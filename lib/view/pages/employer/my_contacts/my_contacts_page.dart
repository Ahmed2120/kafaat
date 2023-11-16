import 'package:kafaat/core/core_exports.dart';
import 'package:kafaat/providers/employer/my_contacts_provider.dart';
import 'package:kafaat/view/pages/employer/my_contacts/widgets/contact_item.dart';
import 'package:kafaat/view/widgets/loading_widget.dart';
import 'package:kafaat/view/widgets/main_app_bar.dart';
import 'package:kafaat/view/widgets/main_text_field.dart';

class MyContactsPage extends StatefulWidget {
  const MyContactsPage({super.key});

  @override
  State<MyContactsPage> createState() => _MyContactsPageState();
}

class _MyContactsPageState extends State<MyContactsPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      MyContactsProvider.listenFalse(context).myContacts();
    });
  }

  @override
  Widget build(BuildContext context) {
    final contacts = MyContactsProvider.get(context);
    return Scaffold(
      body: Column(
        children: [
          const MainAppBar(title: 'My Contacts'),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MainTextField(
                    hint: 'Search By Name or Email',
                    prefixPath: 'search_icon',
                    onChanged: (value) async {
                      await contacts.myContacts(keyword: value!);
                    },
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    child: contacts.myContactsStatus == DataStatus.loading
                        ? const LoadingWidget()
                        : contacts.myContactsStatus == DataStatus.successed
                            ? ListView.builder(
                                itemBuilder: (BuildContext context, int i) =>
                                    ContactItem(
                                  contact: contacts.contactModel!.contacts![i],
                                ),
                                itemCount:
                                    contacts.contactModel!.contacts!.length,
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
