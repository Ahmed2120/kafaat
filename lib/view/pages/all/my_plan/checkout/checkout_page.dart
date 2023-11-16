import 'package:kafaat/core/core_exports.dart';
import 'package:kafaat/models/plan_model.dart';
import 'package:kafaat/providers/plans_provider.dart';
import 'package:kafaat/view/widgets/drop_menu.dart';
import 'package:kafaat/view/widgets/main_app_bar.dart';
import 'package:kafaat/view/widgets/main_button.dart';
import 'package:kafaat/view/widgets/main_text.dart';
import 'package:kafaat/view/widgets/main_text_field.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({Key? key, required this.plan, required this.isAnnual})
      : super(key: key);
  final Plan plan;
  final bool isAnnual;

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {

  @override
  Widget build(BuildContext context) {
    final plans = PlansProvider.get(context);
    return Scaffold(
      body: Column(
        children: [
          const MainAppBar(title: 'Checkout'),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const MainText(
                    text: 'Billing Details',
                    font: 15,
                    weight: FontWeight.w400,
                    color: AppColors.yBodyColor,
                  ),
                  const SizedBox(height: 20),
                  const Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MainText(
                              text: 'First name',
                              font: 15,
                              weight: FontWeight.w500,
                              color: AppColors.yMainColor,
                            ),
                            SizedBox(height: 8),
                            MainTextField(
                              hint: 'Enter first name',
                              type: TextInputType.text,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MainText(
                              text: 'Last name',
                              font: 15,
                              weight: FontWeight.w500,
                              color: AppColors.yMainColor,
                            ),
                            SizedBox(height: 8),
                            MainTextField(
                              hint: 'Enter Last name',
                              type: TextInputType.text,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MainText(
                        text: 'Phone Number',
                        font: 15,
                        weight: FontWeight.w500,
                        color: AppColors.yMainColor,
                      ),
                      SizedBox(height: 8),
                      MainTextField(
                        hint: 'Enter Phone Number',
                        type: TextInputType.phone,
                        isPhone: true,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const MainText(
                        text: 'Country',
                        font: 15,
                        weight: FontWeight.w500,
                        color: AppColors.yMainColor,
                      ),
                      const SizedBox(height: 8),
                      DropMenu(
                        hint: 'Enter Country',
                        items: countries,
                        onChanged: (String? v) {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MainText(
                        text: 'State/Province/Region',
                        font: 15,
                        weight: FontWeight.w500,
                        color: AppColors.yMainColor,
                      ),
                      SizedBox(height: 8),
                      MainTextField(
                        hint: 'Enter State/Province/Region',
                        type: TextInputType.text,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MainText(
                        text: 'City',
                        font: 15,
                        weight: FontWeight.w500,
                        color: AppColors.yMainColor,
                      ),
                      SizedBox(height: 8),
                      MainTextField(
                        hint: 'Enter City',
                        type: TextInputType.text,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MainText(
                        text: 'Street Address',
                        font: 15,
                        weight: FontWeight.w500,
                        color: AppColors.yMainColor,
                      ),
                      SizedBox(height: 8),
                      MainTextField(
                        hint: 'Enter Street Address',
                        type: TextInputType.text,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MainText(
                        text: 'ZIP code/Postal code',
                        font: 15,
                        weight: FontWeight.w500,
                        color: AppColors.yMainColor,
                      ),
                      SizedBox(height: 8),
                      MainTextField(
                        hint: 'Enter ZIP code/Postal code',
                        type: TextInputType.number,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const MainText(
                    text: 'Order Summary',
                    font: 15,
                    weight: FontWeight.w400,
                    color: AppColors.yBodyColor,
                  ),
                  const SizedBox(height: 15),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    decoration: BoxDecoration(
                      color: AppColors.yWhiteColor,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.yBlackColor.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 3,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const MainText(
                              text: 'Product',
                              font: 15,
                              weight: FontWeight.w400,
                            ),
                            MainText(
                              text: widget.plan.title,
                              font: 17,
                              weight: FontWeight.w500,
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const MainText(
                              text: 'Subtotal',
                              font: 15,
                              weight: FontWeight.w400,
                            ),
                            MainText(
                              text: widget.isAnnual
                                  ? widget.plan.annualPrice
                                  : widget.plan.price,
                              font: 17,
                              color: AppColors.yPrimaryColor,
                              weight: FontWeight.w500,
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        const Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const MainText(
                              text: 'Total',
                              font: 15,
                              weight: FontWeight.w400,
                            ),
                            MainText(
                              text: widget.isAnnual
                                  ? widget.plan.annualPrice
                                  : widget.plan.price,
                              font: 17,
                              weight: FontWeight.w500,
                              color: AppColors.yPrimaryColor,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  MainButton(
                    title: 'Place order',
                    onPressed: () async {
                      await plans.buyPlan(widget.plan.id!,
                          isAnnual: widget.isAnnual);
                    },
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
