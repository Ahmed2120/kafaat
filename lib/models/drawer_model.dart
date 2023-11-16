import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:kafaat/core/core_exports.dart';
import 'package:kafaat/providers/auth/logout_provider.dart';
import 'package:kafaat/view/pages/all/settings/settings_page.dart';
import 'package:kafaat/view/pages/candidate/applied_jobs/applied_jobs_page.dart';
import 'package:kafaat/view/pages/candidate/candidate/candidates_page.dart';
import 'package:kafaat/view/pages/candidate/categories/categories_page.dart';
import 'package:kafaat/view/pages/candidate/cv_manager/cv_manager_page.dart';
import 'package:kafaat/view/pages/candidate/empolyer/empolyer_page.dart';
import 'package:kafaat/view/pages/candidate/home/candidate_home_page.dart';
import 'package:kafaat/view/pages/candidate/jobs/jobs_page.dart';
import 'package:kafaat/view/pages/candidate/my_profile/my_profile_page.dart';
import 'package:kafaat/view/pages/employer/company_profile/company_profile_page.dart';
import 'package:kafaat/view/pages/employer/home/employer_home_page.dart';
import 'package:kafaat/view/pages/employer/manage_jobs/manage_jobs_page.dart';
import 'package:kafaat/view/pages/employer/my_contacts/my_contacts_page.dart';
import 'package:kafaat/view/pages/employer/my_orders/my_orders_page.dart';
import 'package:kafaat/view/pages/all/my_plan/my_plan_page.dart';
import 'package:kafaat/view/pages/employer/shortlisted/shortlisted_page.dart';

class DrawerModel {
  final String title;
  final String icon;
  void Function()? onTap;
  DrawerModel({
    required this.title,
    required this.icon,
    this.onTap,
  });
}

class DrawerServise {
  static final drawerController = ZoomDrawerController();
  static final context = NavigationService.currentContext;
  static final logout = LogoutProvider.listenFalse(context);

  static get drawerTap {
    drawerController.toggle!.call();
    drawerController.stateNotifier;
  }

  static List<DrawerModel> employerDrawerList = [
    DrawerModel(
      title: 'Dashboard',
      icon: 'home_icon',
      onTap: () {
        AppRoutes.routeRemoveAllTo(context, const EmployerHomePage());
        drawerTap;
      },
    ),
    DrawerModel(
      title: 'Company profile',
      icon: 'company_icon',
      onTap: () {
        AppRoutes.routeTo(context, const CompanyProfilePage());
        drawerTap;
      },
    ),
    DrawerModel(
      title: 'Manage jobs',
      icon: 'jobs_icon',
      onTap: () {
        AppRoutes.routeTo(context, const ManageJobsPage());
        drawerTap;
      },
    ),
    DrawerModel(
      title: 'Shortlisted',
      icon: 'shortisted_icon',
      onTap: () {
        AppRoutes.routeTo(context, const ShortlistedPage());
        drawerTap;
      },
    ),
    DrawerModel(
      title: 'My Plan',
      icon: 'dollar_sign_icon',
      onTap: () {
        AppRoutes.routeTo(context, const MyPlanPage());
        drawerTap;
      },
    ),
    DrawerModel(
      title: 'My orders',
      icon: 'document_icon',
      onTap: () {
        AppRoutes.routeTo(context, const MyOrdersPage());
        drawerTap;
      },
    ),
    DrawerModel(
      title: 'My Contact',
      icon: 'contacts_icon',
      onTap: () {
        AppRoutes.routeTo(context, const MyContactsPage());
        drawerTap;
      },
    ),
    DrawerModel(
      title: 'Settings',
      icon: 'settings_icon',
      onTap: () {
        AppRoutes.routeTo(context, const SettingsPage());
        drawerTap;
      },
    ),
    DrawerModel(
      title: 'Log out',
      icon: 'logout_icon',
      onTap: () async {
        // drawerTap;
        await logout.logout(loading: true);
      },
    ),
  ];

  static List<DrawerModel> candidateDrawerList = [
    DrawerModel(
      title: 'Home',
      icon: 'home_icon',
      onTap: () {
        AppRoutes.routeRemoveAllTo(context, const CandidateHomePage());
        drawerTap;
      },
    ),
    DrawerModel(
      title: 'Jobs',
      icon: 'jobs_icon',
      onTap: () {
        AppRoutes.routeTo(context, const JobsPage());
        drawerTap;
      },
    ),
    DrawerModel(
      title: 'Applied Jobs',
      icon: 'jobs_icon',
      onTap: () {
        AppRoutes.routeTo(context, const AppliedJobsPage());
        drawerTap;
      },
    ),
    DrawerModel(
      title: 'Category',
      icon: 'category_icon',
      onTap: () {
        AppRoutes.routeTo(context, const CategoriesPage());
        drawerTap;
      },
    ),
    DrawerModel(
      title: 'Employers',
      icon: 'empolyer_icon',
      onTap: () {
        AppRoutes.routeTo(context, const EmployersPage());
        drawerTap;
      },
    ),
    DrawerModel(
      title: 'Candidate',
      icon: 'candidate_icon',
      onTap: () {
        AppRoutes.routeTo(context, const CandidatesPage());
        drawerTap;
      },
    ),
    DrawerModel(
      title: 'CV Manager',
      icon: 'candidate_icon',
      onTap: () {
        AppRoutes.routeTo(context, const CVManagerPage());
        drawerTap;
      },
    ),
    DrawerModel(
      title: 'My Plan',
      icon: 'dollar_sign_icon',
      onTap: () {
        AppRoutes.routeTo(context, const MyPlanPage());
        drawerTap;
      },
    ),
    DrawerModel(
      title: 'My Profile',
      icon: 'company_icon',
      onTap: () {
        AppRoutes.routeTo(context, const MyProfilePage());
        drawerTap;
      },
    ),
    DrawerModel(
      title: 'Settings',
      icon: 'settings_icon',
      onTap: () {
        AppRoutes.routeTo(context, const SettingsPage());
        drawerTap;
      },
    ),
    DrawerModel(
      title: 'Log out',
      icon: 'logout_icon',
      onTap: () async {
        // drawerTap;
        await logout.logout(loading: true);
      },
    ),
  ];

  static List<DrawerModel> get drawerList {
    String role = LocalData.userLoginData.role!;
    return role == 'employer'
        ? employerDrawerList
        : role == 'candidate'
            ? candidateDrawerList
            : [];
  }
}
