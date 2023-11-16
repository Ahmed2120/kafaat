import 'package:kafaat/core/core_exports.dart';
import 'package:kafaat/providers/candidate/employers_provider.dart';
import 'package:kafaat/view/pages/candidate/empolyer/widgets/employer_search_form.dart';
import 'package:kafaat/view/pages/candidate/empolyer/widgets/empolyer_item_card.dart';
import 'package:kafaat/view/widgets/loading_widget.dart';
import 'package:kafaat/view/widgets/main_app_bar.dart';
import 'package:kafaat/view/widgets/main_text_field.dart';
import 'package:kafaat/view/widgets/retry_widget.dart';

class EmployersPage extends StatefulWidget {
  const EmployersPage({Key? key}) : super(key: key);

  @override
  State<EmployersPage> createState() => _EmployersPageState();
}

class _EmployersPageState extends State<EmployersPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      EmployersProvider.listenFalse(context).employers(retry: true);
    });
  }

  @override
  Widget build(BuildContext context) {
    final employers = EmployersProvider.get(context);
    return Scaffold(
      body: Column(
        children: [
          const MainAppBar(title: 'Employers'),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const EmployerSearchForm(),
                  const SizedBox(height: 4),
                  (employers.employersStatus == DataStatus.loading)
                      ? const Expanded(child: LoadingWidget())
                      : (employers.employersStatus == DataStatus.successed)
                          ? Expanded(
                              child: ListView.builder(
                              itemBuilder: (BuildContext context, int i) =>
                                  EmployerItemCard(
                                employer: employers
                                    .employerModel!.employers!.employers![i],
                              ),
                              itemCount: employers
                                  .employerModel!.employers!.employers!.length,
                            ))
                          : (employers.employersStatus == DataStatus.error)
                              ? RetryWidget(
                                  retryCallback: () {
                                    employers.employers(retry: true);
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
