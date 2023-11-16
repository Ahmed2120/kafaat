import 'package:kafaat/core/core_exports.dart';
import 'package:kafaat/models/categories_model.dart';
import 'package:kafaat/view/pages/candidate/categories/widgets/category_details.dart';
import 'package:kafaat/view/widgets/main_text.dart';

class CategoryHomeCard extends StatelessWidget {
  const CategoryHomeCard({
    super.key,
    required this.category,
    this.horizontal = false,
  });

  final CategoryModel category;
  final bool horizontal;

  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: AppColors.yWhiteColor,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: InkWell(
        onTap: () {
          AppRoutes.routeTo(context,
              CategoryDetails(id: category.id!, title: category.name!));
        },
        borderRadius: BorderRadius.circular(20),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              horizontal ? const SizedBox(width: 4) : const SizedBox(),
              horizontal
                  ? Container(
                      height: 37,
                      width: 37,
                      decoration: BoxDecoration(
                          color: AppColors.yPrimaryColor.withOpacity(0.1),
                          shape: BoxShape.circle),
                      child: Center(
                        child: Image.asset(
                          getAsset('finance_icon'),
                          height: 24,
                          width: 24,
                        ),
                      ),
                    )
                  : const SizedBox(),
              horizontal ? const SizedBox(width: 4) : const SizedBox(),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    horizontal
                        ? const SizedBox()
                        : Container(
                            height: 55,
                            width: 55,
                            decoration: BoxDecoration(
                                color: AppColors.yPrimaryColor.withOpacity(0.1),
                                shape: BoxShape.circle),
                            child: Center(
                              child: Image.asset(
                                getAsset('education_icon'),
                                height: 25,
                                width: 25,
                              ),
                            ),
                          ),
                    SizedBox(
                      width: horizontal ? null : context.width / 3,
                      child: MainText(
                        text: '${category.name}',
                        maxLines: 2,
                        font: horizontal ? 12 : 13,
                        weight: FontWeight.w700,
                        color: AppColors.yDarkColor,
                        overflow: TextOverflow.fade,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    MainText(
                      text: '${category.openJobsCount} Jobs',
                      font: 12,
                      weight: FontWeight.w700,
                      color: AppColors.yBodyColor,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
