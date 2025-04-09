import 'package:best_price/core/utils/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomNetworkImageWidget extends StatelessWidget {
  const CustomNetworkImageWidget({
    super.key,
    required this.urlImage,
    this.height,
    this.width,
  });
  final String urlImage;
  final double? height;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: CachedNetworkImage(
        imageUrl: urlImage,
        errorWidget: (context, url, error) => const Image(
          fit: BoxFit.fill,
          image: AssetImage(
            IconsPath.splashLogo,
          ),
        ),
      ),
    );
  }
}
