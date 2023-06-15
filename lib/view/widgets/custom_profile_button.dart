import 'package:flutter/material.dart';
import 'default_text.dart';

class CustomProfileButton extends StatelessWidget {
  final double? height;
  final double? width;
  final double? radius;
  final double? fontSize;
  final double? iconSize;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final Color? color;
  final Color? iconColor;
  final VoidCallback onTap;
  final String text;
  final IconData? iconData;
  final MainAxisAlignment mainAxisAlignment;
  final EdgeInsetsGeometry?padding ;

  const CustomProfileButton({
    Key? key,
    this.radius,
    this.color,
    required this.text,
    this.iconData,
    this.iconColor,
    this.iconSize,
    required this.onTap,
    this.height,
    this.width,
    this.fontSize,
    this.fontWeight, this.textAlign, this.mainAxisAlignment=MainAxisAlignment.spaceAround, this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: padding,
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius!),
          color: color,
          shape: BoxShape.rectangle
        ),
        child: Row(
          mainAxisAlignment: mainAxisAlignment,
          children: [
            DefaultText(
              text: text,
              fontWeight: fontWeight,
              fontSize: fontSize,
              color: Colors.white,
              textAlign: textAlign,
            ),
            Icon(
              iconData,
              color: iconColor,
              size: iconSize,
            ),
          ],
        ),
      ),
    );
  }
}
