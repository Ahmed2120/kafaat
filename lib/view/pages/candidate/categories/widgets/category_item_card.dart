import 'package:kafaat/core/core_exports.dart';
import 'package:kafaat/models/categories_model.dart';
import 'package:kafaat/view/pages/candidate/categories/widgets/category_details.dart';
import 'package:kafaat/view/widgets/main_text.dart';

class CategoryItemCard extends StatelessWidget {
  final CategoryModel category;

  const CategoryItemCard({required this.category, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      surfaceTintColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: () {
          AppRoutes.routeTo(context,
              CategoryDetails(id: category.id!, title: category.name!));
        },
        borderRadius: BorderRadius.circular(12),
        child: SizedBox(
          width: 100,
          height: 125,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(height: 12),
              Expanded(
                child: FittedBox(
                  child: Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                        color: AppColors.yPrimaryColor.withOpacity(0.1),
                        shape: BoxShape.circle),
                    child: Center(
                      child: Image.asset(
                        getAsset('design_cat_icon'),
                        height: 20,
                        width: 20,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child: Container(
                  height: 38,
                  alignment: Alignment.center,
                  child: MainText(
                    text: category.name,
                    font: 12,
                    weight: FontWeight.w600,
                    maxLines: 2,
                    overflow: TextOverflow.clip,
                    color: AppColors.yDarkColor,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              MainText(
                text: '${category.openJobsCount} Jobs',
                font: 10,
                weight: FontWeight.w500,
                color: AppColors.yBodyColor,
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}
