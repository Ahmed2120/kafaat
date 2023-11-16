import 'package:kafaat/core/core_exports.dart';
import 'package:kafaat/providers/notifications_provider.dart';
import 'package:kafaat/view/pages/all/notifications/widgets/notification_item.dart';
import 'package:kafaat/view/widgets/loading_widget.dart';
import 'package:kafaat/view/widgets/main_app_bar.dart';
import 'package:kafaat/view/widgets/main_text.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  void initState() {
    super.initState();
    NotificationsProvider.listenFalse(context).getNotifications();
  }

  @override
  Widget build(BuildContext context) {
    final notification = NotificationsProvider.get(context);
    return Scaffold(
      body: Column(
        children: [
          const MainAppBar(title: 'Notifications'),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          notification.makeNotificationReadAll(retry: true);
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              getAsset('read_all_icon'),
                              height: 28,
                              width: 28,
                            ),
                            const SizedBox(width: 8),
                            const MainText(
                              text: 'Make as read all',
                              color: AppColors.yBodyColor,
                              font: 14,
                              weight: FontWeight.w400,
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          notification.deleteAllNotification(retry: true);
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const MainText(
                              text: 'Delete all',
                              color: AppColors.yPrimaryColor,
                              font: 14,
                              weight: FontWeight.w400,
                            ),
                            const SizedBox(width: 8),
                            Image.asset(
                              getAsset('delete_icon'),
                              height: 28,
                              width: 28,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Expanded(
                    child: notification.notificationStatus ==
                            DataStatus.successed
                        ? notification
                                .notificationModel!.notifications!.isNotEmpty
                            ? ListView.separated(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                itemBuilder: (BuildContext context, int i) =>
                                    NotificationItem(
                                  notification: notification
                                      .notificationModel!.notifications![i],
                                ),
                                itemCount: notification
                                    .notificationModel!.notifications!.length,
                                separatorBuilder:
                                    (BuildContext context, int i) =>
                                        const SizedBox(height: 10),
                              )
                            : Center(
                                child: Image.asset(
                                  getAsset('not_found'),
                                  width: context.width * 0.4,
                                ),
                              )
                        : notification.notificationStatus == DataStatus.loading
                            ? const LoadingWidget()
                            : const SizedBox(),
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
