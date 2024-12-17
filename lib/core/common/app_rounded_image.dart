import 'package:flutter/material.dart';
class AppRoundedImage extends StatelessWidget {
  final double? height;
  final double? width;
  final String imageUrl;
  final bool applyImageRadius;
  final bool isNetworkImage;
  final BoxBorder? border;
  final Color? color;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onPressed;
  final double borderRadius;

  const AppRoundedImage({Key? key,
    this.height, this.width,
    required this.imageUrl,
      this.applyImageRadius = true,
     this.isNetworkImage = false,
    this.border, this.color,
    this.fit = BoxFit.contain,
    this.padding,
    this.onPressed,
    this.borderRadius = 8.0 }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height,
        width: width,
        padding: padding,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(borderRadius), border: border,  color: color, ),
        child: ClipRRect(
          borderRadius: applyImageRadius ? BorderRadius.circular(borderRadius) : BorderRadius.zero,
          child: Image(
            fit: fit,
            image: isNetworkImage? NetworkImage(imageUrl) : AssetImage(imageUrl) as ImageProvider,
          ),
        ),
      ),
    );
  }
}
