import os
import base64
import json
import requests
from google.oauth2.service_account import Credentials
from googleapiclient.discovery import build
from googleapiclient.http import MediaFileUpload
from datetime import datetime
import yaml
def get_flutter_version(pubspec_path='pubspec.yaml'):
    with open(pubspec_path, 'r') as f:
        pubspec = yaml.safe_load(f)
        return pubspec.get('version', 'unknown')
def authenticate_gdrive():
    base64_creds = os.environ.get('GDRIVE_CREDENTIALS')
    if not base64_creds:
        raise Exception("GDRIVE_CREDENTIALS not found in environment variables")

    creds_json = base64.b64decode(base64_creds).decode('utf-8')
    with open('credentials.json', 'w') as f:
        f.write(creds_json)

    creds = Credentials.from_service_account_file('credentials.json')
    return build('drive', 'v3', credentials=creds)

def upload_file(service, file_path, custom_name, drive_folder_id="1DB-Dn1PbH43pYMoSt8yeWK5LKBAln2AM"):
    file_metadata = {
        'name': custom_name,
        'parents': [drive_folder_id] if drive_folder_id else []
    }
    media = MediaFileUpload(file_path, resumable=True)
    file = service.files().create(
        body=file_metadata,
        media_body=media,
        fields='id, webViewLink'
    ).execute()
    print(f"File ID: {file.get('id')} uploaded successfully.")
    
    permission = {'type': 'anyone', 'role': 'reader'}
    service.permissions().create(fileId=file.get('id'), body=permission).execute()

    return file.get('webViewLink')


def send_telegram_message(message, telegram_token, chat_id):
    url = f"https://api.telegram.org/bot{telegram_token}/sendMessage"
    payload = {'chat_id': chat_id, 'text': message}
    response = requests.post(url, json=payload)
    if response.status_code != 200:
        raise Exception(f"Failed to send message: {response.text}")
    print("Message sent successfully to Telegram.")
    return response.json()['result']['message_id']


def send_telegram_file(file_path, telegram_token, chat_id, custom_file_name):
    url = f"https://api.telegram.org/bot{telegram_token}/sendDocument"
    with open(file_path, 'rb') as file:
        response = requests.post(url, data={'chat_id': chat_id}, files={'document': (custom_file_name, file)})
    if response.status_code != 200:
        raise Exception(f"Failed to send file: {response.text}")
    print("File sent successfully to Telegram.")
    return response.json()['result']['message_id']


def forward_telegram_message(telegram_token, from_chat_id, message_id, to_chat_id):
    url = f"https://api.telegram.org/bot{telegram_token}/forwardMessage"
    payload = {
        'chat_id': to_chat_id,
        'from_chat_id': from_chat_id,
        'message_id': message_id
    }
    response = requests.post(url, json=payload)
    if response.status_code != 200:
        raise Exception(f"Failed to forward message: {response.text}")
    print("Message forwarded successfully to another group.")


def sanitize_filename(filename):
    return filename.replace(':', '_').replace('/', '_')


if __name__ == '__main__':
    telegram_token = os.environ.get('TELEGRAM_BOT_TOKEN')
    chat_id = os.environ.get('TELEGRAM_CHAT_ID')
    current_date = datetime.now().strftime("%-d-%-m-%Y")
    flutter_version = get_flutter_version()
    # Paths and custom names
    apk_path = 'build/app/outputs/flutter-apk/app-release.apk'
    apk_name = sanitize_filename(f"Ghina shop_APK_{flutter_version}_{current_date}.apk")

    aab_path = 'build/app/outputs/bundle/release/app-release.aab'
    aab_name = sanitize_filename("Ghina shop-AAB_1.0.4+5_7-3-2025.aab")

    gdrive_service = authenticate_gdrive()

    # Upload APK and send notifications
    apk_drive_link = upload_file(gdrive_service, apk_path, apk_name)
    send_telegram_message(f"✅ Weisro APK uploaded successfully!\nGoogle Drive Link: {apk_drive_link}", telegram_token, chat_id)
    send_telegram_file(apk_path, telegram_token, chat_id, apk_name)

    # Upload AAB and send notifications
    # aab_drive_link = upload_file(gdrive_service, aab_path, aab_name)
    # send_telegram_message(f"✅ Weisro AAB uploaded successfully!\nGoogle Drive Link: {aab_drive_link}", telegram_token, chat_id)
    # send_telegram_file(aab_path, telegram_token, chat_id, aab_name)
