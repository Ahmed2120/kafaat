import 'package:kafaat/core/core_exports.dart';

class MainButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String title;
  final String? family;
  final Color? color;
  final double? verticalPadding;
  final double? borerRadius;
  final double? horizontalPadding;
  final double? verticalMargin;
  final double? horizontalMargin;
  final FontWeight? weight;
  final bool isTransparent;
  final bool withBorder;
  final Color? borderColor;
  final Color? textColor;
  final Color? imageColor;
  final double? width;
  final double? height;
  final double? borderWidth;
  final double? hor;
  final double? ver;
  final double? font;
  final bool withIcon;
  final bool hasShadow;
  final String? iconPath;

  const MainButton({
    super.key,
    this.onPressed,
    required this.title,
    this.color,
    this.iconPath,
    this.width,
    this.borerRadius,
    this.hasShadow = false,
    this.withBorder = false,
    this.verticalPadding,
    this.verticalMargin,
    this.borderWidth,
    this.withIcon = false,
    this.horizontalPadding,
    this.horizontalMargin,
    this.family,
    this.weight,
    this.borderColor,
    this.hor,
    this.isTransparent = false,
    this.height,
    this.font,
    this.textColor,
    this.ver,
    this.imageColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: horizontalMargin ?? 0, vertical: verticalMargin ?? 0),
        padding: EdgeInsets.symmetric(
            vertical: verticalPadding ?? 15,
            horizontal: horizontalPadding ?? 0),
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: isTransparent
              ? Colors.transparent
              : color ?? AppColors.yPrimaryColor,
          borderRadius: BorderRadius.circular(borerRadius ?? 20),
          border: withBorder
              ? Border.all(
                  width: borderWidth ?? 1.0, color: borderColor ?? Colors.white)
              : null,
          boxShadow: hasShadow
              ? [
                  BoxShadow(
                    color: AppColors.yBlackColor.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: const Offset(0, 3),
                  ),
                ]
              : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                  color: textColor ?? AppColors.yWhiteColor,
                  fontSize: font ?? 20,
                  fontFamily: family ?? 'Poppins',
                  fontWeight: weight ?? FontWeight.w400),
            ),
            if (withIcon) const SizedBox(width: 12),
            if (withIcon)
              Image.asset(
                getAsset(iconPath!),
                height: 16,
                width: 16,
              ),
          ],
        ),
      ),
    );
  }
}
