import 'package:best_price/core/widgets/custom_network_image_widget.dart';
import 'package:flutter/material.dart';

class SmallPhotoOptionWidget extends StatelessWidget {
  const SmallPhotoOptionWidget({
    super.key,
    required this.imageUrl,
    required this.borderColor,
  });
  final String imageUrl;
  final Color borderColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: borderColor, //AppColor.pirateGold,
          width: 1.5,
        ),
      ),
      child: CustomNetworkImageWidget(
        urlImage: imageUrl,
      ),
    );
  }
}
