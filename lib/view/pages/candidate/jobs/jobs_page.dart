import 'package:kafaat/core/core_exports.dart';
import 'package:kafaat/providers/candidate/jobs_provider.dart';
import 'package:kafaat/view/pages/candidate/jobs/widgets/job_item_card.dart';
import 'package:kafaat/view/pages/candidate/jobs/widgets/job_search_form.dart';
import 'package:kafaat/view/widgets/loading_widget.dart';
import 'package:kafaat/view/widgets/main_app_bar.dart';
import 'package:kafaat/view/widgets/not_found_widget.dart';

class JobsPage extends StatefulWidget {
  const JobsPage({Key? key}) : super(key: key);

  @override
  State<JobsPage> createState() => _JobsPageState();
}

class _JobsPageState extends State<JobsPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      JobsProvider.listenFalse(context).jobs(retry: true);
    });
  }

  @override
  Widget build(BuildContext context) {
    final jobs = JobsProvider.get(context);
    return Scaffold(
      body: Column(
        children: [
          const MainAppBar(title: 'All Jobs'),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  const JobSearchForm(),
                  (jobs.jobsStatus == DataStatus.loading)
                      ? const Expanded(child: LoadingWidget())
                      : (jobs.jobsStatus == DataStatus.successed)
                          ? Expanded(
                              child: ListView.builder(
                                itemBuilder: (BuildContext context, int i) =>
                                    JobItemCard(
                                  job: jobs.jobModel!.allJobs!.jobs![i],
                                ),
                                itemCount: jobs.jobModel!.allJobs!.jobs!.length,
                              ),
                            )
                          : const Expanded(
                              child: NotFoundWidget(),
                            ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
