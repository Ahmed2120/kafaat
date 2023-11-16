import 'package:kafaat/core/core_exports.dart';
import 'package:kafaat/providers/plans_provider.dart';
import 'package:kafaat/view/pages/all/my_plan/widgets/plan_item.dart';
import 'package:kafaat/view/widgets/loading_widget.dart';
import 'package:kafaat/view/widgets/main_app_bar.dart';
import 'package:kafaat/view/widgets/main_text.dart';

class MyPlanPage extends StatefulWidget {
  const MyPlanPage({super.key, this.current = 0});
  final int current;

  @override
  State<MyPlanPage> createState() => _MyPlanPageState();
}

class _MyPlanPageState extends State<MyPlanPage> {
  int current = 0;
  @override
  void initState() {
    current = widget.current;
    super.initState();
    Future.delayed(Duration.zero, () async {
      PlansProvider.listenFalse(context).plans(retry: true);
    });
  }

  List<String> pages = ['Monthly', 'Annual'];
  @override
  Widget build(BuildContext context) {
    final plans = PlansProvider.get(context);
    return Scaffold(
      body: Column(
        children: [
          const MainAppBar(title: 'My Plan'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const MainText(
                  text: 'Choose your pricing plan',
                  font: 13,
                  weight: FontWeight.w400,
                  color: AppColors.yBodyColor,
                ),
                const SizedBox(height: 16),
                Row(
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
                            color:
                                i == current ? AppColors.yPrimaryColor : null,
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
              ],
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: plans.plansStatus == DataStatus.loading
                ? const LoadingWidget()
                : plans.plansStatus == DataStatus.successed
                    ? ListView.builder(
                        itemBuilder: (BuildContext context, int i) => PlanItem(
                          plan: plans.planModel!.plans![i],
                          isAnnual: current == 1,
                        ),
                        itemCount: plans.planModel!.plans!.length,
                      )
                    : const SizedBox(),
          ),
        ],
      ),
    );
  }
}
