import 'package:kafaat/core/core_exports.dart';
import 'package:kafaat/providers/candidate/candidates_provider.dart';
import 'package:kafaat/view/pages/candidate/candidate/widgets/candidate_item_card.dart';
import 'package:kafaat/view/pages/candidate/candidate/widgets/candidate_search_form.dart';
import 'package:kafaat/view/widgets/loading_widget.dart';
import 'package:kafaat/view/widgets/main_app_bar.dart';
import 'package:kafaat/view/widgets/main_text_field.dart';
import 'package:kafaat/view/widgets/retry_widget.dart';

class CandidatesPage extends StatefulWidget {
  const CandidatesPage({Key? key}) : super(key: key);

  @override
  State<CandidatesPage> createState() => _CandidatesPageState();
}

class _CandidatesPageState extends State<CandidatesPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      CandidatesProvider.listenFalse(context).candidates();
    });
  }

  @override
  Widget build(BuildContext context) {
    final candidates = CandidatesProvider.get(context);
    return Scaffold(
      body: Column(
        children: [
          const MainAppBar(title: 'Candidates'),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                children: [
                  const CandidateSearchForm(),
                  const SizedBox(height: 4),
                  (candidates.candidatesStatus == DataStatus.loading)
                      ? const Expanded(child: LoadingWidget())
                      : (candidates.candidatesStatus == DataStatus.successed)
                          ? Expanded(
                              child: ListView.builder(
                                itemBuilder: (BuildContext context, int i) =>
                                    CandidateItemCard(
                                  candidate: candidates.candidateModel!
                                      .candidates!.candidates![i],
                                ),
                                itemCount: candidates.candidateModel!
                                    .candidates!.candidates!.length,
                              ),
                            )
                          : (candidates.candidatesStatus == DataStatus.error)
                              ? RetryWidget(
                                  retryCallback: () {
                                    candidates.candidates(retry: true);
                                  },
                                )
                              : const SizedBox(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
