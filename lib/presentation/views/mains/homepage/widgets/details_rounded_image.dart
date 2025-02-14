import 'package:flutter/material.dart';


class RoundedImage extends StatelessWidget {
  final double? height,width;
  final String imgUrl;
  final bool? applyImgRadius;
  final double? borderRadius;
  final Color? backgroundColor;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final VoidCallback? onPressed;

  const RoundedImage({
    super.key,
    this.height = 150,
    this.width = double.infinity,
    required this.imgUrl,
    this.applyImgRadius = false,
    this.borderRadius = 8,
    this.backgroundColor = Colors.white,
    this.fit = BoxFit.contain,
    this.padding,
    this.isNetworkImage = false,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height,
        width: width,
        padding: padding,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius!,),
        ),
        child: ClipRRect(
          borderRadius: applyImgRadius!? BorderRadius.circular(8): BorderRadius.zero,
          child: Image( image: isNetworkImage  ? NetworkImage(imgUrl) : AssetImage(imgUrl) as ImageProvider,
            fit: BoxFit.cover,),
        ),
      ),
    );
  }
}