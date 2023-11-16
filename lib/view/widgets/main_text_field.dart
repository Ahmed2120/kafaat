import 'package:flutter/services.dart';
import 'package:kafaat/core/core_exports.dart';
import 'main_text.dart';

class MainTextField extends StatefulWidget {
  final String? hint;
  final String? initialValue;
  final int? minLines;
  final int? maxLines;
  final bool? hasLabel;
  final bool? hasHint;
  final Color? hintColor;
  final int? maxLength;
  final bool nullMax;
  final TextInputType? type;
  final List<TextInputFormatter>? inputFormatters;
  final Function(String?)? onsave;
  final Function()? suffixCallback;
  final Function(String? value)? onChanged;
  final Function()? iconCallback;
  final String? Function(String?)? valid;
  final AutovalidateMode? validationMode;
  final Widget? suffixIcon;
  final Color? fillColor;
  final Color? cursorColor;
  final bool isPassword;
  final double? radius;
  final FontWeight? hintWeight;
  final double? hintFont;
  final TextEditingController? controller;
  final VoidCallback? onTap;
  final String? prefixPath;
  final FocusNode? focus;
  final bool autoFocus;
  final bool? read;
  final bool withPasswordIcon;
  final bool isPhone;
  final bool? flag;
  final TextAlign? align;
  final TextInputAction? action;
  final VoidCallback? edit;
  final bool? isEdit;
  final double? hor;
  final double? horizontalPadding;
  final double? verticalPadding;
  final bool isUnfocused;

  const MainTextField({
    super.key,
    this.hint,
    this.maxLines,
    this.onsave,
    this.hintWeight,
    this.hintFont,
    this.onTap,
    this.cursorColor,
    this.radius,
    this.minLines,
    this.hintColor,
    this.suffixCallback,
    this.withPasswordIcon = true,
    this.suffixIcon,
    this.type,
    this.initialValue,
    this.maxLength,
    this.nullMax = false,
    this.inputFormatters,
    this.fillColor,
    this.valid,
    this.action,
    this.hasHint = true,
    this.align,
    this.onChanged,
    this.isPassword = false,
    this.iconCallback,
    this.controller,
    this.isPhone = false,
    this.focus,
    this.autoFocus = false,
    this.prefixPath,
    this.hasLabel,
    this.read,
    this.edit,
    this.isEdit,
    this.flag,
    this.hor,
    this.validationMode,
    this.verticalPadding,
    this.horizontalPadding,
    this.isUnfocused = false,
  });

  @override
  MainTextFieldState createState() => MainTextFieldState();
}

class MainTextFieldState extends State<MainTextField> {
  bool _isHidden = true;

  void _visibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.yBlackColor.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: TextFormField(
        onTap: widget.onTap,
        initialValue: widget.initialValue,
        validator: widget.valid,
        controller: widget.controller,
        cursorColor: widget.cursorColor ?? AppColors.yPrimaryColor,
        onSaved: widget.onsave,
        focusNode: widget.focus,
        inputFormatters: widget.inputFormatters,
        textAlign: widget.align ?? TextAlign.start,
        textInputAction: widget.action,
        readOnly: widget.read == true ? true : false,
        maxLines:
            widget.nullMax ? null : widget.maxLines ?? widget.minLines ?? 1,
        minLines: widget.minLines,
        autofocus: widget.autoFocus,
        maxLength: widget.isPhone ? 11 : widget.maxLength,
        obscureText: widget.isPassword ? _isHidden : false,
        keyboardType: widget.type,
        onTapOutside: (event) {
          if (widget.isUnfocused) {
            FocusScope.of(context).requestFocus(FocusNode());
          }
        },
        onChanged: widget.onChanged,
        style: const TextStyle(
          fontSize: 16,
          color: AppColors.yDarkColor,
          fontWeight: FontWeight.w400,
        ),
        decoration: InputDecoration(
          errorStyle:
              const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          hintText: widget.hasHint == true ? widget.hint : null,
          fillColor: widget.fillColor ?? AppColors.yWhiteColor,
          filled: true,
          contentPadding: EdgeInsets.symmetric(
              horizontal: widget.horizontalPadding ?? 15,
              vertical: (widget.minLines != null && widget.minLines! > 1)
                  ? 8
                  : widget.verticalPadding ?? 0),
          prefixIcon: widget.prefixPath != null
              ? Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 8,
                  ),
                  height: 40,
                  width: 40,
                  child: Center(
                    child: Image.asset(
                      getAsset(widget.prefixPath!),
                      height: 20,
                      width: 20,
                    ),
                  ),
                )
              : null,
          labelText: widget.hasLabel == true ? widget.hint : null,
          prefix: widget.flag == true ? const MainText(text: "+966  ") : null,
          icon: widget.isEdit == true ? const Icon(Icons.edit) : null,
          counterText: '',
          labelStyle: const TextStyle(
            fontSize: 14,
            color: Colors.black,
          ),
          hintStyle: TextStyle(
            fontSize: widget.hintFont ?? 14,
            fontWeight: widget.hintWeight ?? FontWeight.w400,
            color: widget.hintColor ?? AppColors.yDisableTabColor,
          ),
          suffixIcon: widget.isPassword
              ? widget.withPasswordIcon
                  ? Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: IconButton(
                        onPressed: _visibility,
                        alignment: Alignment.center,
                        icon: _isHidden
                            ? const Icon(
                                Icons.visibility_off,
                                color: Colors.grey,
                              )
                            : const Icon(
                                Icons.visibility,
                                color: Colors.grey,
                              ),
                      ),
                    )
                  : IconButton(
                      onPressed: () {},
                      icon: Container(),
                    )
              : widget.suffixIcon,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.transparent,
            ),
            borderRadius: BorderRadius.circular(widget.radius ?? 16),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColors.yPrimaryColor,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(widget.radius ?? 16),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.transparent,
            ),
            borderRadius: BorderRadius.circular(widget.radius ?? 16),
          ),
        ),
      ),
    );
  }
}
