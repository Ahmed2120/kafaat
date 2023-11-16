import 'dart:developer';

import 'package:kafaat/core/core_exports.dart';
import 'package:kafaat/models/my_contacts_model.dart';
import 'package:provider/provider.dart';
export 'package:provider/provider.dart';

class MyContactsProvider extends ChangeNotifier {
  static MyContactsProvider get(context) =>
      Provider.of<MyContactsProvider>(context);

  static MyContactsProvider listenFalse(context) =>
      Provider.of<MyContactsProvider>(context, listen: false);

  DataStatus? myContactsStatus;
  ContactModel? contactModel;

  Future<void> myContacts({String keyword = '', bool retry = false}) async {
    try {
      if (retry) {
        myContactsStatus = DataStatus.loading;
        notifyListeners();
      }
      var r = await RemoteData.getRequest(
          (keyword.isNotEmpty)
              ? '${AppStrings.myContactsEndPoint}?s=$keyword'
              : AppStrings.myContactsEndPoint,
          withAuth: true);
      if (r['error'] == true) {
        myContactsStatus = DataStatus.error;
      } else {
        contactModel = ContactModel.fromJson(r['data']);
        myContactsStatus = DataStatus.successed;
      }
    } catch (e) {
      myContactsStatus = DataStatus.error;
      log(e.toString());
    }
    notifyListeners();
  }
}
