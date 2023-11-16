import 'package:kafaat/core/core_exports.dart';
import 'package:kafaat/view/widgets/main_app_bar.dart';
import 'package:kafaat/view/widgets/main_text.dart';

class FAQPage extends StatefulWidget {
  const FAQPage({Key? key}) : super(key: key);

  @override
  State<FAQPage> createState() => _FAQPageState();
}

class _FAQPageState extends State<FAQPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const MainAppBar(title: 'FAQ'),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    ...List.generate(
                      faqItems.length,
                      (i) {
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          surfaceTintColor: Colors.white,
                          elevation: 3,
                          shape: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(22),
                          ),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(22),
                            onTap: () {
                              setState(() {
                                for (var item in faqItems) {
                                  item.isExpanded = item == faqItems[i]
                                      ? !faqItems[i].isExpanded
                                      : false;
                                }
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 12,
                              ),
                              child: ListTile(
                                title: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    MainText(
                                      text: faqItems[i].title,
                                      font: 20,
                                      weight: FontWeight.w700,
                                      textAlign: TextAlign.start,
                                      color: AppColors.yBlackColor,
                                    ),
                                    Icon(
                                      faqItems[i].isExpanded
                                          ? Icons.keyboard_arrow_down_rounded
                                          : Icons.arrow_forward_ios_rounded,
                                      size: faqItems[i].isExpanded ? 30 : 20,
                                    ),
                                  ],
                                ),
                                subtitle: faqItems[i].isExpanded
                                    ? Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 24),
                                        child: MainText(
                                          text: faqItems[i].text,
                                          font: 14,
                                          weight: FontWeight.w500,
                                          textAlign: TextAlign.start,
                                          color: AppColors.yGreyBlckColor,
                                        ),
                                      )
                                    : null,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FAQItem {
  final String title;
  final String text;
  bool isExpanded;
  FAQItem({
    required this.title,
    required this.text,
    this.isExpanded = false,
  });
}

List<FAQItem> faqItems = [
  FAQItem(
      title: 'Question 1',
      text:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore\nDuis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatu\nSed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium.'),
  FAQItem(
      title: 'Question 2',
      text:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore\nDuis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatu\nSed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium.'),
  FAQItem(
      title: 'Question 3',
      text:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore\nDuis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatu\nSed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium.'),
  FAQItem(
      title: 'Question 4',
      text:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore\nDuis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatu\nSed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium.'),
  FAQItem(
      title: 'Question 5',
      text:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore\nDuis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatu\nSed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium.'),
  FAQItem(
      title: 'Question 6',
      text:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore\nDuis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatu\nSed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium.'),
];
