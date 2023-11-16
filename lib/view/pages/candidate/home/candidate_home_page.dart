import 'dart:developer';

import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:kafaat/core/core_exports.dart';
import 'package:kafaat/core/notifications/fcm_provider.dart';
import 'package:kafaat/models/drawer_model.dart';
import 'package:kafaat/providers/candidate/categories_provider.dart';
import 'package:kafaat/providers/candidate/jobs_provider.dart';
import 'package:kafaat/providers/dashboard_provider.dart';
import 'package:kafaat/providers/wishlist_provider.dart';
import 'package:kafaat/view/pages/candidate/home/widgets/candidate_home_page_body.dart';
import 'package:kafaat/view/widgets/drawer_menu.dart';
import 'package:shimmer/shimmer.dart';

class CandidateHomePage extends StatefulWidget {
  const CandidateHomePage({super.key});

  @override
  State<CandidateHomePage> createState() => _CandidateHomePageState();
}

class _CandidateHomePageState extends State<CandidateHomePage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      CategoriesProvider.listenFalse(context).categories(retry: true);
      JobsProvider.listenFalse(context).jobs(retry: true);
      DashboardProvider.listenFalse(context).banners();
      WishlistsProvider.listenFalse(context).allWishlists();
    });
  }

  @override
  Widget build(BuildContext context) {
    final categories = CategoriesProvider.get(context);
    final jobs = JobsProvider.get(context);
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
            CategoriesProvider.listenFalse(context).categories(retry: true);
            JobsProvider.listenFalse(context).jobs(retry: true);
            DashboardProvider.listenFalse(context).banners();
            WishlistsProvider.listenFalse(context).allWishlists();
          });
        },
        child: Scaffold(
          body: (categories.categoriesStatus == DataStatus.loading ||
                  jobs.jobsStatus == DataStatus.loading &&
                      categories.categoriesModel == null &&
                      jobs.allJobsModel == null)
              ? Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[200]!,
                  period: const Duration(seconds: 3),
                  child: const CandidateHomePageBodyLoading(),
                )
              : FutureBuilder(
                  future: Future.delayed(const Duration(milliseconds: 50)),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return (categories.categoriesModel != null &&
                              jobs.allJobsModel != null)
                          ? const CandidateHomePageBody()
                          : Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[200]!,
                              period: const Duration(seconds: 3),
                              child: const CandidateHomePageBodyLoading(),
                            );
                    }
                    return Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[200]!,
                      period: const Duration(seconds: 3),
                      child: const CandidateHomePageBodyLoading(),
                    );
                  },
                ),
        ),
      ),
    );
  }
}

Widget vi() {
  return Container();
}
