import 'dart:developer';

import 'package:best_price/core/utils/helper_functions.dart';
import 'package:best_price/feature/account/presentation/view/widgets/susses_account_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:best_price/core/theme/app_color.dart';
import 'package:best_price/core/utils/constants.dart';

class WhatsAppFloatingButton extends StatelessWidget {
  final String phoneNumber;

  const WhatsAppFloatingButton({super.key, required this.phoneNumber});

  /// Normalizes the input number to the correct international format (+963...)
  String normalizePhoneNumber(String number) {
    number = number.trim().replaceAll(' ', '');

    if (number.startsWith('+963')) {
      return number;
    } else if (number.startsWith('00963')) {
      return '+963${number.substring(5)}';
    } else if (number.startsWith('0')) {
      return '+963${number.substring(1)}';
    } else if (number.startsWith('9')) {
      // Assume local number like 988107858
      return '+963$number';
    }

    // Default fallback, use as-is (can be improved with validation)
    return number;
  }

  Future<void> _openWhatsApp(String number, BuildContext context) async {
    final formatted = normalizePhoneNumber(number);
    const String text = "";
    final androidUrl = "whatsapp://send?phone=" + formatted + "&text=$text";
    final webUrl = 'https://wa.me/${formatted.replaceAll('+', '')}';

    try {
      final androidUri = Uri.parse(androidUrl);
      final webUri = Uri.parse(webUrl);

      if (await canLaunchUrl(androidUri)) {
        await launchUrl(androidUri);
      } else if (await canLaunchUrl(webUri)) {
        await launchUrl(webUri, mode: LaunchMode.externalApplication);
      } else {
        if (context.mounted) {
          HelperFunctions.showCustomDialog(
            context,
            const UpdateAccountDialog(
              title: "",
              contain: "لم يتم تثبيت WhatsApp أو لا يمكن فتحه",
            ),
          );
        }
      }
    } catch (e) {
      log("Error opening WhatsApp: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => _openWhatsApp(phoneNumber, context),
      backgroundColor: AppColor.green,
      child: SvgPicture.asset(
        IconsPath.whatsAppIcon,
        color: Colors.white,
        height: 28,
      ),
    );
  }
}
