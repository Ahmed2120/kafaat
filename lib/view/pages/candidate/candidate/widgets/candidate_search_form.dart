import 'package:kafaat/core/core_exports.dart';
import 'package:kafaat/models/filters_model.dart';
import 'package:kafaat/providers/candidate/candidates_provider.dart';
import 'package:kafaat/view/pages/candidate/candidate/widgets/candidates_filter.dart';
import 'package:kafaat/view/widgets/main_text.dart';
import 'package:kafaat/view/widgets/main_text_field.dart';

class CandidateSearchForm extends StatefulWidget {
  const CandidateSearchForm({super.key});

  @override
  State<CandidateSearchForm> createState() => _CandidateSearchFormState();
}

class _CandidateSearchFormState extends State<CandidateSearchForm> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final candidates = CandidatesProvider.get(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTextField(
          controller: controller,
          hint: 'Search Candidate...',
          prefixPath: 'search_icon',
          onChanged: (value) async {
            if (value != null && value.isNotEmpty) {
              if (candidates.candidateFilters == null) {
                candidates.candidateFilters = CandidateFilters(keyword: value);
              } else {
                candidates.candidateFilters!.keyword = value;
              }
            } else {
              if (candidates.candidateFilters == null) {
                candidates.candidateFilters = CandidateFilters(keyword: null);
              } else {
                candidates.candidateFilters!.keyword = null;
              }
              if (candidates.candidateFilters != null && candidates.candidateFilters!.isAllNullVars) {
                candidates.candidateFilters = null;
              }
            }
            await candidates.candidates(retry: true);
          },
          suffixIcon: GestureDetector(
            onTap: () {
              AppRoutes.routeTo(context, const CandidatesFiltersPage());
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
        candidates.candidateFilters == null
            ? const SizedBox()
            : InkWell(
                onTap: () {
                  controller.clear();
                  candidates.candidateFilters = null;
                  candidates.candidates(retry: true);
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
