import 'package:kafaat/core/core_exports.dart';
import 'package:kafaat/view/widgets/main_app_bar.dart';
import 'package:kafaat/view/widgets/main_text.dart';
import 'package:kafaat/view/widgets/map_widget.dart';

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const MainAppBar(title: 'Contact us'),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                MapWidget(
                  width: context.width,
                  height: 200,
                ),
                const SizedBox(height: 32),
                ...List.generate(
                  contacts.length,
                  (i) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CircleAvatar(
                            backgroundColor: AppColors.yPrimaryColor,
                            child: Image.asset(
                              getAsset(contacts[i].image),
                              height: 22,
                              width: 22,
                            ),
                          ),
                          const SizedBox(width: 18),
                          SizedBox(
                            width: context.width - 120,
                            child: MainText(
                              text: contacts[i].text,
                              font: 16,
                              color: AppColors.yBlackColor,
                              weight: FontWeight.w600,
                              maxLines: 2,
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ContactItem {
  final String image;
  final String text;
  ContactItem({
    required this.image,
    required this.text,
  });
}

List<ContactItem> contacts = [
  ContactItem(image: 'Message', text: 'Example @ gmail.com'),
  ContactItem(image: 'Calling', text: '+20 1032316164'),
  ContactItem(image: 'whatsapp', text: '+20 1032316164'),
  ContactItem(
      image: 'Location', text: '1901 Thornridge Cir. Shiloh, Hawaii 81063'),
];
