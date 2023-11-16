import 'package:kafaat/core/core_exports.dart';

class DataCellWidget extends StatelessWidget {
  const DataCellWidget(
      {super.key,
      required this.child,
      this.onTap,
      this.color,
      this.fromStart = false});
  final Widget child;
  final Color? color;
  final void Function()? onTap;
  final bool fromStart;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      margin: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: color ?? AppColors.yWhiteColor,
        boxShadow: [
          BoxShadow(
            color: AppColors.yBlackColor.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 3),
          ),
        ],
        borderRadius: BorderRadius.circular(5),
      ),
      alignment: fromStart ? Alignment.centerLeft : Alignment.center,
      child: InkWell(
        onTap: onTap,
        child: FittedBox(child: child),
      ),
    );
  }
}
