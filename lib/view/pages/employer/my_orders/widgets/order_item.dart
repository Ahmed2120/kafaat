import 'package:kafaat/core/core_exports.dart';
import 'package:kafaat/models/my_orders_model.dart';
import 'package:kafaat/view/widgets/main_text.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({Key? key, required this.order}) : super(key: key);
  final OrdersModel order;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      margin: const EdgeInsets.only(bottom: 25),
      decoration: BoxDecoration(
          color: AppColors.yWhiteColor,
          boxShadow: [
            BoxShadow(
              color: AppColors.yBlackColor.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MainText(
                text: order.product!.title,
                font: 16,
                weight: FontWeight.bold,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                    color: AppColors.yGreenColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10)),
                child: MainText(
                  text: order.status,
                  color: AppColors.yGreenColor,
                  font: 14,
                  weight: FontWeight.w400,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          MainText(
            text: '\$${order.subtotal}',
            font: 15,
            color: AppColors.ySecondaryColor,
            weight: FontWeight.w500,
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              order.order!.gateway != null
                  ? Row(
                      children: [
                        Image.asset(
                          getAsset('paypal_icon'),
                          height: 20,
                          width: 20,
                        ),
                        const SizedBox(width: 8),
                        MainText(
                          text: order.order!.gateway,
                          font: 14,
                          color: AppColors.yBodyColor,
                          weight: FontWeight.w400,
                        ),
                      ],
                    )
                  : const SizedBox(),
              order.order!.gateway != null
                  ? Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      height: 2,
                      width: 2,
                      color: AppColors.yDarkColor,
                    )
                  : const SizedBox(),
              Row(
                children: [
                  Image.asset(
                    getAsset('duration_icon'),
                    height: 20,
                    width: 20,
                  ),
                  const SizedBox(width: 8),
                  MainText(
                    text: order.createdAt!.substring(0, 10),
                    font: 14,
                    color: AppColors.yBodyColor,
                    weight: FontWeight.w400,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
