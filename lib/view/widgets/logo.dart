import 'package:kafaat/core/core_exports.dart';

class Logo extends StatelessWidget {
  const Logo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      getAsset('logo'),
      width: context.width / 3,
    );
  }
}
