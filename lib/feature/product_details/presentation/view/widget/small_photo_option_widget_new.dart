import 'package:best_price/core/theme/app_color.dart';
import 'package:best_price/core/widgets/custom_network_image_widget.dart';
import 'package:flutter/material.dart';

class SmallPhotoOptionWidget extends StatelessWidget {
  final String imageUrl;
  final Color borderColor;
  final bool isVideo;

  const SmallPhotoOptionWidget({
    super.key,
    required this.imageUrl,
    required this.borderColor,
    this.isVideo = false,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: borderColor),
            borderRadius: BorderRadius.circular(8),
          ),
          child: CustomNetworkImageWidget(
            urlImage: imageUrl,
            height: 60,
            width: 60,
          ),
        ),
        if (isVideo)
          const Positioned.fill(
            child: Center(
              child:
                  Icon(Icons.play_circle_fill, color: AppColor.green  , size: 28),
            ),
          ),
      ],
    );
  }
}
