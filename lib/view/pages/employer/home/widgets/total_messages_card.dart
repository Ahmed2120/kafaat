import 'package:kafaat/core/core_exports.dart';
import 'package:kafaat/providers/employer/my_contacts_provider.dart';
import 'package:kafaat/view/pages/employer/my_contacts/my_contacts_page.dart';
import 'package:kafaat/view/widgets/main_text.dart';

class TotalMessagesCard extends StatelessWidget {
  const TotalMessagesCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final contacts = MyContactsProvider.get(context);
    return Expanded(
      child: GestureDetector(
        onTap: () {
          AppRoutes.routeTo(context, const MyContactsPage());
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: AppColors.yBlackColor.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 3,
                offset: const Offset(0, 3),
              ),
            ],
            borderRadius: BorderRadius.circular(12),
            color: AppColors.yWhiteColor,
          ),
          alignment: Alignment.center,
          child: Row(
            children: [
              Container(
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                    color: AppColors.yPrimaryColor.withOpacity(0.1),
                    shape: BoxShape.circle),
                child: Center(
                  child: Image.asset(
                    getAsset('chat_icon'),
                    height: 24,
                    width: 24,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const MainText(
                      text: 'Total Messages',
                      font: 12,
                      weight: FontWeight.bold,
                      color: AppColors.yDarkColor,
                    ),
                    const SizedBox(height: 5),
                    contacts.contactModel != null
                        ? MainText(
                            text: contacts.contactModel!.contacts!.length
                                .toString(),
                            font: 14,
                            weight: FontWeight.w400,
                            color: AppColors.yBodyColor,
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
