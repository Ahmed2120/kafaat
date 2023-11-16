import 'package:kafaat/core/core_exports.dart';
import 'package:kafaat/models/my_contacts_model.dart';
import 'package:kafaat/view/widgets/main_text.dart';

class ContactItem extends StatelessWidget {
  const ContactItem({Key? key, required this.contact}) : super(key: key);
  final Contact contact;

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
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(
                getAsset('contact_name_icon'),
                height: 45,
                width: 45,
              ),
              const SizedBox(width: 10),
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const MainText(
                      text: 'Contact Name',
                      font: 14,
                      weight: FontWeight.bold,
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Image.asset(
                          getAsset('contact_mail_icon'),
                          height: 18,
                          width: 18,
                        ),
                        const SizedBox(width: 8),
                        const MainText(
                          text: 'Email@gmail.com',
                          font: 12,
                          color: AppColors.yBodyColor,
                          weight: FontWeight.w400,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: FittedBox(
                  child: Row(
                    children: [
                      Image.asset(
                        getAsset('duration_icon'),
                        height: 18,
                        width: 18,
                      ),
                      const SizedBox(width: 8),
                      const MainText(
                        text: '04/02/2023',
                        font: 12,
                        color: AppColors.yBodyColor,
                        weight: FontWeight.w400,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const MainText(
            text:
                'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.',
            font: 12,
            color: AppColors.yBodyColor,
            weight: FontWeight.w400,
          ),
        ],
      ),
    );
  }
}
