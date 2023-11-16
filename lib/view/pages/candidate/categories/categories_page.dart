import 'package:kafaat/core/core_exports.dart';
import 'package:kafaat/providers/candidate/categories_provider.dart';
import 'package:kafaat/view/pages/candidate/categories/widgets/category_item_card.dart';
import 'package:kafaat/view/widgets/main_app_bar.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      CategoriesProvider.listenFalse(context).categories();
    });
  }

  @override
  Widget build(BuildContext context) {
    final categories = CategoriesProvider.get(context);
    return Scaffold(
      body: Column(
        children: [
          const MainAppBar(title: 'Categories'),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              // child: Wrap(
              //   runSpacing: 8,
              //   spacing: 8,
              //   children: categories.categoriesModel?.categories
              //           ?.map(
              //               (category) => CategoryItemCard(category: category))
              //           .toList() ??
              //       [],
              // ),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8,
                  childAspectRatio: 0.8,
                  mainAxisSpacing: 8,
                ),
                itemBuilder: (BuildContext context, int i) => CategoryItemCard(
                    category: categories.categoriesModel!.categories![i]),
                itemCount: categories.categoriesModel!.categories!.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
