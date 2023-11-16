import 'package:kafaat/core/core_exports.dart';

class MainCheckbox extends StatefulWidget {
  final Function(bool value) onChanged;
  final String? content;
  final String? boldContent;
  final double? borderWidth;
  final Color? textColor;
  final Color? boldTextColor;
  final bool? initialValue;
  final bool? value;

  const MainCheckbox({
    super.key,
    required this.onChanged,
    this.content,
    this.borderWidth,
    this.boldContent,
    this.textColor,
    this.boldTextColor,
    this.initialValue,
    this.value,
  });

  @override
  State<MainCheckbox> createState() => _MainCheckboxState();
}

class _MainCheckboxState extends State<MainCheckbox> {
  late bool isChecked;
  @override
  void initState() {
    isChecked = widget.initialValue ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.value != null && widget.initialValue == null) {
      isChecked = widget.value ?? false;
    }
    return GestureDetector(
      onTap: () {
        setState(() {
          isChecked = !isChecked;
        });
        widget.onChanged(isChecked);
      },
      child: Padding(
        padding: const EdgeInsets.all(3),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: isChecked ? AppColors.yPrimaryColor : Colors.transparent,
                border: Border.all(
                    color: Colors.grey[400]!, width: widget.borderWidth ?? 0.3),
              ),
              child: Center(
                child: isChecked
                    ? const Icon(
                        Icons.done,
                        color: Colors.white,
                        size: 15,
                      )
                    : null,
              ),
            ),
            const SizedBox(width: 8),
            widget.content != null
                ? Text(
                    widget.content!,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: widget.textColor ??
                          AppColors.yBlackColor.withOpacity(0.5),
                    ),
                  )
                : Container(),
            widget.boldContent != null
                ? Text(
                    widget.boldContent!,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: widget.boldTextColor ?? AppColors.yDarkColor,
                    ),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
