import 'package:kafaat/core/core_exports.dart';
import 'package:kafaat/models/drawer_model.dart';
import 'package:kafaat/view/widgets/main_text.dart';

class MainAppBar extends StatelessWidget {
  const MainAppBar({
    super.key,
    this.isMenu = false,
    this.title = '',
    this.actionWidgets,
  });

  final bool isMenu;
  final String title;
  final List<Widget>? actionWidgets;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: 80,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  if (isMenu) {
                    DrawerServise.drawerTap;
                  } else {
                    if (Navigator.canPop(context)) {
                      AppRoutes.pop(context);
                    }
                  }
                },
                borderRadius: BorderRadius.circular(12),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: isMenu
                      ? Image.asset(
                          getAsset('menu_icon'),
                          height: 24,
                          width: 24,
                        )
                      : Navigator.canPop(context)
                          ? const Icon(
                              Icons.arrow_back_ios,
                              color: AppColors.yTitleColor,
                            )
                          : const SizedBox(),
                ),
              ),
              MainText(
                text: title,
                color: AppColors.yTitleColor,
                font: 18,
                weight: FontWeight.w600,
              ),
              Row(
                children:
                    actionWidgets ?? [const SizedBox(height: 40, width: 40)],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
