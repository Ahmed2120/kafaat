import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:kafaat/core/core_exports.dart';
import 'package:kafaat/models/notifications_model.dart';
import 'package:kafaat/providers/notifications_provider.dart';
import 'package:kafaat/view/widgets/loading_widget.dart';
import 'package:kafaat/view/widgets/main_text.dart';

class NotificationItem extends StatefulWidget {
  final NotificationItemModel notification;

  const NotificationItem({Key? key, required this.notification})
      : super(key: key);

  @override
  State<NotificationItem> createState() => _NotificationItemState();
}

class _NotificationItemState extends State<NotificationItem> {
  @override
  Widget build(BuildContext context) {
    final notification = NotificationsProvider.get(context);
    return Slidable(
      endActionPane: ActionPane(
        extentRatio: 0.45,
        motion: const BehindMotion(),
        children: [
          const Spacer(),
          InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: () {
              notification.makeNotificationRead(widget.notification.data!.id!,
                  retry: true);
            },
            child: Container(
              height: 60,
              width: 60,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
                borderRadius: BorderRadius.circular(20),
              ),
              child: (notification.notificationReadStatus ==
                          DataStatus.loading &&
                      notification.currentId == widget.notification.data!.id)
                  ? const LoadingWidget(size: 15, isCircle: true)
                  : Image.asset(
                      getAsset('share_icon'),
                      height: 30,
                      width: 30,
                    ),
            ),
          ),
          const SizedBox(width: 10),
          InkWell(
            onTap: () {
              notification.deleteOneNotification(widget.notification.data!.id!,
                  retry: true);
            },
            borderRadius: BorderRadius.circular(20),
            child: Container(
              height: 60,
              width: 60,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
              child: (notification.notificationDeleteStatus ==
                          DataStatus.loading &&
                      notification.currentId == widget.notification.data!.id)
                  ? const LoadingWidget(size: 15, isCircle: true)
                  : Image.asset(
                      getAsset('delete_icon'),
                      height: 30,
                      width: 30,
                    ),
            ),
          ),
        ],
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        decoration: BoxDecoration(
            color: widget.notification.readAt != null
                ? AppColors.yWhiteColor
                : AppColors.yGreyColor.withOpacity(0.8),
            boxShadow: [
              BoxShadow(
                color: AppColors.yBlackColor.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
            borderRadius: BorderRadius.circular(20)),
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(
              widget.notification.data!.notification!.avatar!,
            ),
          ),
          title: MainText(
            text: widget.notification.data!.notification!.name,
            font: 16,
            color: AppColors.yMainColor,
            weight: FontWeight.w500,
          ),
          subtitle: MainText(
            text: widget.notification.data!.notification!.message,
            font: 13,
            color: AppColors.yBodyColor,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            weight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
