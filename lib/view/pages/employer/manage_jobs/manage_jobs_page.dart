import 'package:kafaat/core/core_exports.dart';
import 'package:kafaat/view/pages/employer/manage_jobs/add_application/add_application_page.dart';
import 'package:kafaat/view/pages/employer/manage_jobs/add_job/add_job_page.dart';
import 'package:kafaat/view/pages/employer/manage_jobs/widgets/all_applications.dart';
import 'package:kafaat/view/pages/employer/manage_jobs/widgets/all_jobs.dart';
import 'package:kafaat/view/widgets/main_app_bar.dart';
import 'package:kafaat/view/widgets/main_text.dart';

class ManageJobsPage extends StatefulWidget {
  const ManageJobsPage({super.key, this.current = 0});
  final int current;

  @override
  State<ManageJobsPage> createState() => _ManageJobsPageState();
}

class _ManageJobsPageState extends State<ManageJobsPage> {
  int current = 0;
  @override
  void initState() {
    current = widget.current;
    super.initState();
  }

  List<String> pages = ['All Jobs', 'All Applicants'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          MainAppBar(
            title: 'Manage Jobs',
            actionWidgets: [
              IconButton(
                onPressed: () {
                  if (current == 0) {
                    AppRoutes.routeTo(context, const AddJobPage());
                  }else{
                    AppRoutes.routeTo(context, const AddApplicationPage());
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.yPrimaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                icon: const Icon(Icons.add_rounded, color: Colors.white),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: List.generate(
                pages.length,
                (i) => Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        current = i;
                      });
                    },
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      decoration: BoxDecoration(
                        color: i == current ? AppColors.yPrimaryColor : null,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                      alignment: Alignment.center,
                      child: MainText(
                        text: pages[i],
                        font: 14,
                        weight: FontWeight.w500,
                        color: i == current
                            ? AppColors.yWhiteColor
                            : AppColors.yBodyColor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          current == 0 ? const AllJobsPage() : const AllApplicationsPage(),
        ],
      ),
    );
  }
}
