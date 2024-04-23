import 'dart:convert';

class Setting {
    bool? status;
    int? code;
    String? message;
    SettingClass? setting;

    Setting({
        this.status,
        this.code,
        this.message,
        this.setting,
    });

    factory Setting.fromRawJson(String str) => Setting.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Setting.fromJson(Map<String, dynamic> json) => Setting(
        status: json["status"],
        code: json["code"],
        message: json["message"],
        setting: json["setting"] == null ? null : SettingClass.fromJson(json["setting"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "message": message,
        "setting": setting?.toJson(),
    };
}

class SettingClass {
    int? id;
    dynamic url;
    String? logo;
    String? favicon;
    String? appStoreUrl;
    String? playStoreUrl;
    String? infoEmail;
    String? mobile;
    String? whatsApp;
    String? phone;
    String? twitter;
    String? instagram;
    String? snapchat;
    String? image;
    int? paginateTotal;
    int? codStatus;
    dynamic deliveryCost;
    DateTime? createdAt;
    DateTime? updatedAt;
    String? tiktok;
    String? title;
    String? description;
    String? address;
    dynamic dStoreGuestInstructions;
    dynamic dStoreUserInstructions;
    dynamic boxInstructions;
    dynamic boxPopupInstructions;
    dynamic boxPasswordInstructions;
    dynamic boxSuccessPopupInstructions;
    dynamic guestAccountInstructions;
    dynamic walletInstructions;
    dynamic rateText;
    dynamic changeLanguageText;
    dynamic dStoreCounterTitle;
    dynamic dStoreCounterDetails;

    SettingClass({
        this.id,
        this.url,
        this.logo,
        this.favicon,
        this.appStoreUrl,
        this.playStoreUrl,
        this.infoEmail,
        this.mobile,
        this.whatsApp,
        this.phone,
        this.twitter,
        this.instagram,
        this.snapchat,
        this.image,
        this.paginateTotal,
        this.codStatus,
        this.deliveryCost,
        this.createdAt,
        this.updatedAt,
        this.tiktok,
        this.title,
        this.description,
        this.address,
        this.dStoreGuestInstructions,
        this.dStoreUserInstructions,
        this.boxInstructions,
        this.boxPopupInstructions,
        this.boxPasswordInstructions,
        this.boxSuccessPopupInstructions,
        this.guestAccountInstructions,
        this.walletInstructions,
        this.rateText,
        this.changeLanguageText,
        this.dStoreCounterTitle,
        this.dStoreCounterDetails,
    });

    factory SettingClass.fromRawJson(String str) => SettingClass.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory SettingClass.fromJson(Map<String, dynamic> json) => SettingClass(
        id: json["id"],
        url: json["url"],
        logo: json["logo"],
        favicon: json["favicon"],
        appStoreUrl: json["app_store_url"],
        playStoreUrl: json["play_store_url"],
        infoEmail: json["info_email"],
        mobile: json["mobile"],
        whatsApp: json["whatsApp"],
        phone: json["phone"],
        twitter: json["twitter"],
        instagram: json["instagram"],
        snapchat: json["snapchat"],
        image: json["image"],
        paginateTotal: json["paginateTotal"],
        codStatus: json["cod_status"],
        deliveryCost: json["delivery_cost"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        tiktok: json["tiktok"],
        title: json["title"],
        description: json["description"],
        address: json["address"],
        dStoreGuestInstructions: json["d_store_guest_instructions"],
        dStoreUserInstructions: json["d_store_user_instructions"],
        boxInstructions: json["box_instructions"],
        boxPopupInstructions: json["box_popup_instructions"],
        boxPasswordInstructions: json["box_password_instructions"],
        boxSuccessPopupInstructions: json["box_success_popup_instructions"],
        guestAccountInstructions: json["guest_account_instructions"],
        walletInstructions: json["wallet_instructions"],
        rateText: json["rate_text"],
        changeLanguageText: json["change_language_text"],
        dStoreCounterTitle: json["d_store_counter_title"],
        dStoreCounterDetails: json["d_store_counter_details"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "logo": logo,
        "favicon": favicon,
        "app_store_url": appStoreUrl,
        "play_store_url": playStoreUrl,
        "info_email": infoEmail,
        "mobile": mobile,
        "whatsApp": whatsApp,
        "phone": phone,
        "twitter": twitter,
        "instagram": instagram,
        "snapchat": snapchat,
        "image": image,
        "paginateTotal": paginateTotal,
        "cod_status": codStatus,
        "delivery_cost": deliveryCost,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "tiktok": tiktok,
        "title": title,
        "description": description,
        "address": address,
        "d_store_guest_instructions": dStoreGuestInstructions,
        "d_store_user_instructions": dStoreUserInstructions,
        "box_instructions": boxInstructions,
        "box_popup_instructions": boxPopupInstructions,
        "box_password_instructions": boxPasswordInstructions,
        "box_success_popup_instructions": boxSuccessPopupInstructions,
        "guest_account_instructions": guestAccountInstructions,
        "wallet_instructions": walletInstructions,
        "rate_text": rateText,
        "change_language_text": changeLanguageText,
        "d_store_counter_title": dStoreCounterTitle,
        "d_store_counter_details": dStoreCounterDetails,
    };
}
