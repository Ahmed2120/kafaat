import 'package:kafaat/core/core_exports.dart';
import 'package:kafaat/view/pages/candidate/applied_jobs/widgets/applied_jobs.dart';
import 'package:kafaat/view/widgets/main_app_bar.dart';

class AppliedJobsPage extends StatelessWidget {
  const AppliedJobsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          MainAppBar(title: 'Applied Jobs'),
          AppliedJobs(),
        ],
      ),
    );
  }
}
