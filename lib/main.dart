import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:kafaat/core/core_exports.dart';
import 'package:kafaat/core/notifications/fcm_notification_helper.dart';
import 'package:kafaat/firebase_options.dart';
import 'package:kafaat/providers/auth/login_provider.dart';
import 'package:kafaat/providers/auth/logout_provider.dart';
import 'package:kafaat/providers/auth/profile_provider.dart';
import 'package:kafaat/providers/auth/signup_provider.dart';
import 'package:kafaat/providers/auth/social_login_provider.dart';
import 'package:kafaat/providers/candidate/applied_jobs_provider.dart';
import 'package:kafaat/providers/candidate/candidate_profile_provider.dart';
import 'package:kafaat/providers/candidate/candidates_provider.dart';
import 'package:kafaat/providers/candidate/categories_provider.dart';
import 'package:kafaat/providers/candidate/cv_manager_provider.dart';
import 'package:kafaat/providers/candidate/employers_provider.dart';
import 'package:kafaat/providers/candidate/jobs_provider.dart';
import 'package:kafaat/providers/edit_password_provider.dart';
import 'package:kafaat/providers/employer/add_new_applicant_provider.dart';
import 'package:kafaat/providers/employer/add_new_job_provider.dart';
import 'package:kafaat/providers/employer/application_provider.dart';
import 'package:kafaat/providers/employer/company_profile_provider.dart';
import 'package:kafaat/providers/dashboard_provider.dart';
import 'package:kafaat/providers/employer/manage_jobs_provider.dart';
import 'package:kafaat/providers/employer/my_contacts_provider.dart';
import 'package:kafaat/providers/employer/my_orders_provider.dart';
import 'package:kafaat/providers/plans_provider.dart';
import 'package:kafaat/providers/employer/shortlisted_provider.dart';
import 'package:kafaat/providers/notifications_provider.dart';
import 'package:kafaat/providers/wishlist_provider.dart';
import 'package:kafaat/view/pages/welcome/splash/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalData().init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  RemoteData();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    NotificationHelper();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // ChangeNotifierProvider(create: (context) => FCMProvider()),
        ChangeNotifierProvider(create: (context) => LoginProvider()),
        ChangeNotifierProvider(create: (context) => SocialLoginProvider()),
        ChangeNotifierProvider(create: (context) => ProfileProvider()),
        ChangeNotifierProvider(create: (context) => SignupProvider()),
        ChangeNotifierProvider(create: (context) => LogoutProvider()),
        ChangeNotifierProvider(create: (context) => NotificationsProvider()),
        // Employer
        ChangeNotifierProvider(create: (context) => DashboardProvider()),
        ChangeNotifierProvider(create: (context) => CompanyProfileProvider()),
        ChangeNotifierProvider(create: (context) => ApplicationProvider()),
        ChangeNotifierProvider(create: (context) => ManageJobsProvider()),
        ChangeNotifierProvider(create: (context) => PlansProvider()),
        ChangeNotifierProvider(create: (context) => MyOrdersProvider()),
        ChangeNotifierProvider(create: (context) => MyContactsProvider()),
        ChangeNotifierProvider(create: (context) => ShortlistedProvider()),
        ChangeNotifierProvider(create: (context) => AddNewJobProvider()),
        ChangeNotifierProvider(create: (context) => AddNewApplicantProvider()),
        // Candidate
        ChangeNotifierProvider(create: (context) => CandidatesProvider()),
        ChangeNotifierProvider(create: (context) => JobsProvider()),
        ChangeNotifierProvider(create: (context) => CategoriesProvider()),
        ChangeNotifierProvider(create: (context) => EmployersProvider()),
        ChangeNotifierProvider(create: (context) => WishlistsProvider()),
        ChangeNotifierProvider(create: (context) => CVManagerProvider()),
        ChangeNotifierProvider(create: (context) => AppliedJobsProvider()),
        ChangeNotifierProvider(create: (context) => CandidateProfileProvider()),
        ChangeNotifierProvider(create: (context) => EditPasswordProvider()),
      ],
      child: MaterialApp(
        navigatorKey: NavigationService.navigatorKey,
        title: 'Al-Kafaat الكفاءات',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Poppins',
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.yPrimaryColor),
          useMaterial3: true,
        ),
        home: const SplashPage(),
      ),
    );
  }
}
