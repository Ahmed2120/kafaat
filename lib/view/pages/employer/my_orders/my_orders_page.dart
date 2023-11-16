import 'package:kafaat/core/core_exports.dart';
import 'package:kafaat/providers/employer/my_orders_provider.dart';
import 'package:kafaat/view/pages/employer/my_orders/widgets/order_item.dart';
import 'package:kafaat/view/widgets/loading_widget.dart';
import 'package:kafaat/view/widgets/main_app_bar.dart';
import 'package:kafaat/view/widgets/main_text_field.dart';

class MyOrdersPage extends StatefulWidget {
  const MyOrdersPage({super.key});

  @override
  State<MyOrdersPage> createState() => _MyOrdersPageState();
}

class _MyOrdersPageState extends State<MyOrdersPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      MyOrdersProvider.listenFalse(context).myOrders();
    });
  }

  @override
  Widget build(BuildContext context) {
    final orders = MyOrdersProvider.get(context);
    return Scaffold(
      body: Column(
        children: [
          const MainAppBar(title: 'My Orders'),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MainTextField(
                    hint: 'Search By Name',
                    prefixPath: 'search_icon',
                    onChanged: (value) async {
                      await orders.myOrders(keyword: value!);
                    },
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    child: orders.myOrdersStatus == DataStatus.loading
                        ? const LoadingWidget()
                        : orders.myOrdersStatus == DataStatus.successed
                            ? ListView.builder(
                                itemBuilder: (BuildContext context, int i) =>
                                    OrderItem(
                                  order: orders.orderModel!.ordersModel![i],
                                ),
                                itemCount: orders.orderModel!.ordersModel!.length,
                              )
                            : const SizedBox(),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
