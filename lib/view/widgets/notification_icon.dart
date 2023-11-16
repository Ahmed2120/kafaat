import 'package:kafaat/core/core_exports.dart';
import 'package:kafaat/providers/notifications_provider.dart';
import 'package:kafaat/view/pages/all/notifications/notifications_page.dart';

class NotificationIcon extends StatefulWidget {
  const NotificationIcon({
    super.key,
  });

  @override
  State<NotificationIcon> createState() => _NotificationIconState();
}

class _NotificationIconState extends State<NotificationIcon> {
  @override
  void initState() {
    super.initState();
    NotificationsProvider.listenFalse(context).getNotifications();
  }

  @override
  Widget build(BuildContext context) {
    final notification = NotificationsProvider.get(context);
    return InkWell(
        onTap: () {
          AppRoutes.routeTo(context, const NotificationsPage());
        },
        child: SizedBox(
          height: 25,
          width: 25,
          child: Center(
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                Image.asset(
                  getAsset('notification_icon'),
                  height: 30,
                  width: 30,
                  color: AppColors.yDarkColor.withOpacity(0.3),
                ),
                notification.isNotificatonsNotRead
                    ? const CircleAvatar(
                        radius: 5,
                        backgroundColor: AppColors.yPrimaryColor,
                      )
                    : const SizedBox(),
              ],
            ),
          ),
        ));
  }
}
