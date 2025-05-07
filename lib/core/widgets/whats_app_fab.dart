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

  Future<void> _openWhatsApp(String number) async {
    final formatted = normalizePhoneNumber(number);
    final url = 'https://wa.me/${formatted.replaceAll('+', '')}';

    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    } else {
      debugPrint('Could not open WhatsApp for $formatted');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => _openWhatsApp(phoneNumber),
      backgroundColor: AppColor.green,
      child: SvgPicture.asset(
        IconsPath.whatsAppIcon,
        color: Colors.white,
        height: 28,
      ),
    );
  }
}
