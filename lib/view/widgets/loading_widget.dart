import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:kafaat/core/core_exports.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
    this.size = 50.0,
    this.isCircle = false,
  });
  final double size;
  final bool isCircle;

  @override
  Widget build(BuildContext context) {
    return isCircle
        ? Center(
            child: SizedBox(
              height: size,
              width: size,
              child: const CircularProgressIndicator(strokeWidth: 2),
            ),
          )
        : Center(
            child: SpinKitDoubleBounce(
              color: AppColors.yPrimaryColor,
              size: size,
            ),
          );
  }
}
