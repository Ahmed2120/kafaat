import 'package:kafaat/core/core_exports.dart';
import 'package:kafaat/view/widgets/main_button.dart';
import 'package:kafaat/view/widgets/main_text.dart';

class ChoosePlanPage extends StatefulWidget {
  const ChoosePlanPage({Key? key}) : super(key: key);

  @override
  State<ChoosePlanPage> createState() => _ChoosePlanPageState();
}

class _ChoosePlanPageState extends State<ChoosePlanPage> {
  int current = 0;

  @override
  void initState() {
    super.initState();
    // AuthProvider.listenFalse(context).plans();
  }

  @override
  Widget build(BuildContext context) {
    // final auth = AuthProvider.get(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Choose plans')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            const Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    MainText(
                      text: 'Choose plans',
                      font: 20,
                      weight: FontWeight.w500,
                      color: AppColors.yTitleColor,
                    ),
                    SizedBox(height: 10),
                    MainText(
                      text: 'Unlock all features with premium plan',
                      font: 16,
                      weight: FontWeight.w400,
                      color: AppColors.yBodyColor,
                    ),
                    SizedBox(height: 30),
                    // Consumer<AuthProvider>(
                    //   builder: (context, value, child) {
                    //     if (auth.plansStatus != DataStatus.successed) {
                    //       Future.delayed(Duration.zero, () async {
                    //         await auth.getPlans(retry: true);
                    //       });
                    //     }
                    //     return auth.plansStatus == DataStatus.loading
                    //         ? Center(
                    //             child: SpinKitDoubleBounce(
                    //               color: AppColors.yPrimaryColor,
                    //             ),
                    //           )
                    //         : auth.plansStatus == DataStatus.success
                    //             ? GridView.builder(
                    //                 shrinkWrap: true,
                    //                 physics: const NeverScrollableScrollPhysics(),
                    //                 gridDelegate:
                    //                     const SliverGridDelegateWithFixedCrossAxisCount(
                    //                   crossAxisCount: 2,
                    //                   childAspectRatio: 9 / 10,
                    //                   crossAxisSpacing: 32,
                    //                   mainAxisSpacing: 32,
                    //                 ),
                    //                 itemCount: value.plans!.length,
                    //                 itemBuilder: (context, i) {
                    //                   return ChoosePlanItem(
                    //                     onPress: () {
                    //                       setState(() {
                    //                         _current = value.plans![i].id;
                    //                       });
                    //                     },
                    //                     data: value.plans![i],
                    //                     current: _current,
                    //                   );
                    //                 },
                    //               )
                    //             : RetryWidget(retryCallback: () {
                    //                 // auth.getPlans(retry: true);
                    //               });
                    //   },
                    // ),
                    // const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
            MainButton(
              title: 'Continue',
              withIcon: true,
              iconPath: 'button_arrow',
              onPressed: () async {
                // await auth.checkoutPlan(_current.toString());
              },
            ),
          ],
        ),
      ),
    );
  }
}
