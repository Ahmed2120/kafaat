import 'package:kafaat/core/core_exports.dart';
import 'package:kafaat/models/filters_model.dart';
import 'package:kafaat/providers/candidate/employers_provider.dart';
import 'package:kafaat/view/pages/candidate/empolyer/widgets/employers_filter.dart';
import 'package:kafaat/view/widgets/main_text.dart';
import 'package:kafaat/view/widgets/main_text_field.dart';

class EmployerSearchForm extends StatefulWidget {
  const EmployerSearchForm({super.key});

  @override
  State<EmployerSearchForm> createState() => _EmployerSearchFormState();
}

class _EmployerSearchFormState extends State<EmployerSearchForm> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final employers = EmployersProvider.get(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTextField(
          controller: controller,
          hint: 'Search Employer...',
          prefixPath: 'search_icon',
          onChanged: (value) async {
            if (value != null && value.isNotEmpty) {
              if (employers.employerFilters == null) {
                employers.employerFilters = EmployerFilters(keyword: value);
              } else {
                employers.employerFilters!.keyword = value;
              }
            } else {
              if (employers.employerFilters == null) {
                employers.employerFilters = EmployerFilters(keyword: null);
              } else {
                employers.employerFilters!.keyword = null;
              }
              if (employers.employerFilters != null && employers.employerFilters!.isAllNullVars) {
                employers.employerFilters = null;
              }
            }
            await employers.employers(retry: true);
          },
          suffixIcon: GestureDetector(
            onTap: () {
              AppRoutes.routeTo(context, const EmployersFiltersPage());
            },
            child: Container(
              height: 40,
              width: 40,
              margin: const EdgeInsets.only(right: 8, top: 4, bottom: 4),
              decoration: BoxDecoration(
                  color: AppColors.yPrimaryColor,
                  borderRadius: BorderRadius.circular(12)),
              child: Center(
                child: Image.asset(
                  getAsset('filter_icon'),
                  height: 24,
                  width: 24,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        employers.employerFilters == null
            ? const SizedBox()
            : InkWell(
                onTap: () {
                  controller.clear();
                  employers.employerFilters = null;
                  employers.employers(retry: true);
                },
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.close_rounded,
                      color: AppColors.yPrimaryColor,
                      size: 18,
                    ),
                    MainText(
                      text: 'Filters Reset',
                      color: AppColors.yPrimaryColor,
                      font: 12,
                    ),
                  ],
                ),
              ),
      ],
    );
  }
}
