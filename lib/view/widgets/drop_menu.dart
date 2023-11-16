import 'package:kafaat/core/core_exports.dart';

class DropMenu extends StatelessWidget {
  final List<String>? items;
  final Function(String?)? onChanged;
  final String? Function(String?)? valid;
  final String hint;
  final bool shouldBeEmpty;
  final bool hasHeader;
  final String? header;
  final Color? headerTextColor;
  final Function()? onTap;
  final dynamic initialValue;
  final bool isModel;
  final Widget? prefixIcon;
  final Color? dropDownColor;
  final Color? fillColor;
  final Color? color;
  const DropMenu({
    super.key,
    this.initialValue,
    required this.hint,
    this.shouldBeEmpty = false,
    this.valid,
    this.header,
    this.hasHeader = false,
    this.dropDownColor,
    this.items,
    this.prefixIcon,
    this.onChanged,
    this.headerTextColor,
    this.onTap,
    this.isModel = false,
    this.fillColor,
    this.color,
  });

  @override
  build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(16), boxShadow: [
        BoxShadow(
          color: AppColors.yBlackColor.withOpacity(0.1),
          spreadRadius: 1,
          blurRadius: 3,
          offset: const Offset(0, 3),
        ),
      ]),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 25, vertical: 0),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(16),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(16),
          ),
          prefixIcon: prefixIcon != null
              ? Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: IconButton(
                    icon: prefixIcon!,
                    onPressed: () {},
                  ),
                )
              : null,
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(16),
          ),
          filled: true,
          fillColor: fillColor ?? AppColors.yWhiteColor,
        ),
        selectedItemBuilder: (BuildContext ctx) => items!
            .map(
              (e) => Text(
                e,
                style: const TextStyle(
                  fontSize: 16,
                  color: AppColors.yDarkColor,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Poppins',
                ),
              ),
            )
            .toList(),
        dropdownColor: dropDownColor ?? Colors.white,
        validator: valid,
        value: initialValue,
        icon: Icon(
          Icons.keyboard_arrow_down,
          color: color ?? AppColors.yBodyColor,
          size: 16,
        ),
        hint: Text(
            initialValue == null
                ? hint
                : isModel
                    ? initialValue.name
                    : initialValue,
            style: TextStyle(
                fontSize: 16,
                color: color ?? AppColors.yDisableTabColor,
                fontWeight: FontWeight.w400)),
        iconEnabledColor: AppColors.yWhiteColor,
        isExpanded: true,
        items: items == null || items!.isEmpty || shouldBeEmpty
            ? []
            : items!
                .map((e) => DropdownMenuItem<String>(
                      value: items![items!.indexOf(e)],
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          e,
                          style: const TextStyle(
                            fontSize: 16,
                            color: AppColors.yDarkColor,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                    ))
                .toList(),
        onChanged: onChanged,
      ),
    );
  }
}
