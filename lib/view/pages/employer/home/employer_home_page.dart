import 'dart:developer';

import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:kafaat/core/core_exports.dart';
import 'package:kafaat/core/notifications/fcm_provider.dart';
import 'package:kafaat/models/drawer_model.dart';
import 'package:kafaat/providers/dashboard_provider.dart';
import 'package:kafaat/providers/employer/application_provider.dart';
import 'package:kafaat/providers/employer/my_contacts_provider.dart';
import 'package:kafaat/providers/employer/shortlisted_provider.dart';
import 'package:kafaat/view/pages/employer/home/widgets/employer_home_page_body.dart';
import 'package:kafaat/view/widgets/drawer_menu.dart';
import 'package:shimmer/shimmer.dart';

class EmployerHomePage extends StatefulWidget {
  const EmployerHomePage({
    super.key,
  });

  @override
  State<EmployerHomePage> createState() => _EmployerHomePageState();
}

class _EmployerHomePageState extends State<EmployerHomePage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      DashboardProvider.listenFalse(context).dashboard();
      ApplicationProvider.listenFalse(context).getAllApplication();
      MyContactsProvider.listenFalse(context).myContacts();
      ShortlistedProvider.listenFalse(context).shortlisted();
    });
  }

  @override
  Widget build(BuildContext context) {
    final dashboard = DashboardProvider.get(context);
    final applications = ApplicationProvider.get(context);
    final contacts = MyContactsProvider.get(context);
    final shortlisted = ShortlistedProvider.get(context);
    // final fcm = FCMProvider.get(context);
    // fcm.getToken;
    log(LocalData.userLoginData.token!);
    return ZoomDrawer(
      controller: DrawerServise.drawerController,
      menuScreen: const DrawerMenu(),
      borderRadius: 24.0,
      angle: 0,
      dragOffset: 20,
      menuBackgroundColor: AppColors.yDrawerColor,
      slideWidth: context.width * 0.8,
      openCurve: Curves.fastOutSlowIn,
      closeCurve: Curves.bounceIn,
      mainScreen: RefreshIndicator(
        onRefresh: () async {
          Future.delayed(Duration.zero, () async {
            DashboardProvider.listenFalse(context).dashboard();
            ApplicationProvider.listenFalse(context).getAllApplication();
            MyContactsProvider.listenFalse(context).myContacts();
            ShortlistedProvider.listenFalse(context).shortlisted();
          });
        },
        child: Scaffold(
          body: (dashboard.dashboardStatus == DataStatus.loading ||
                  applications.applicationStatus == DataStatus.loading ||
                  contacts.myContactsStatus == DataStatus.loading ||
                  shortlisted.shortlistedStatus == DataStatus.loading)
              ? Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[200]!,
                  period: const Duration(seconds: 3),
                  child: const EmployerHomePageBodyLoading(),
                )
              : FutureBuilder(
                  future: Future.delayed(const Duration(milliseconds: 50)),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return const EmployerHomePageBody();
                    }
                    return Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[200]!,
                      period: const Duration(seconds: 3),
                      child: const EmployerHomePageBodyLoading(),
                    );
                  },
                ),
        ),
      ),
    );
  }
}
