import 'package:get/get.dart';

import 'package:tourism_app/core/constant/routesApp.dart';

import 'package:tourism_app/view/screen/user_screens/another_screens/appointment.dart';
import 'package:tourism_app/view/screen/user_screens/auth_screens/forget_password.dart';
import 'package:tourism_app/view/screen/user_screens/auth_screens/login.dart';
import 'package:tourism_app/view/screen/user_screens/auth_screens/register.dart';
import 'package:tourism_app/view/screen/user_screens/auth_screens/reset_password.dart';
import 'package:tourism_app/view/screen/user_screens/auth_screens/verify_code.dart';
import 'package:tourism_app/view/screen/user_screens/another_screens/continuescreen.dart';
import 'package:tourism_app/view/screen/user_screens/country_details/country_details_screen.dart';
import 'package:tourism_app/view/screen/user_screens/another_screens/editpassword.dart';
import 'package:tourism_app/view/screen/user_screens/another_screens/editprofile.dart';
import 'package:tourism_app/view/screen/user_screens/another_screens/favoritepage.dart';
import 'package:tourism_app/view/screen/user_screens/another_screens/bottom_nav_bar_page.dart';
import 'package:tourism_app/view/screen/guide_screens/another_screens/bottom_nav_bar.dart';
import 'package:tourism_app/view/screen/guide_screens/another_screens/edit_password_guide.dart';
import 'package:tourism_app/view/screen/guide_screens/another_screens/editprofile.dart';
import 'package:tourism_app/view/screen/guide_screens/another_screens/home_screen.dart';
import 'package:tourism_app/view/screen/guide_screens/another_screens/notifications.dart';
import 'package:tourism_app/view/screen/guide_screens/another_screens/profile.dart';
import 'package:tourism_app/view/screen/guide_screens/another_screens/settings.dart';
import 'package:tourism_app/view/screen/guide_screens/another_screens/wallet_history.dart';
import 'package:tourism_app/view/screen/guide_screens/auth_guide_screens/login.dart';
import 'package:tourism_app/view/screen/guide_screens/auth_guide_screens/register.dart';
import 'package:tourism_app/view/screen/guide_screens/auth_guide_screens/reset_password.dart';
import 'package:tourism_app/view/screen/guide_screens/auth_guide_screens/verify_code.dart';
import 'package:tourism_app/view/screen/user_screens/another_screens/homepage.dart';
import 'package:tourism_app/view/screen/user_screens/another_screens/homescreen.dart';
import 'package:tourism_app/view/screen/user_screens/another_screens/list_offers.dart';
import 'package:tourism_app/view/screen/user_screens/another_screens/notifications.dart';
import 'package:tourism_app/view/screen/onboarding/onboarding.dart';
import 'package:tourism_app/view/screen/user_screens/another_screens/profile.dart';
import 'package:tourism_app/view/screen/user_screens/another_screens/list_recommended.dart';
import 'package:tourism_app/view/screen/user_screens/country_details/trips_and_facilities_screen.dart';
import 'package:tourism_app/view/screen/user_screens/another_screens/settingspage.dart';
import 'package:tourism_app/view/screen/splash/splash_screen.dart';
import 'package:tourism_app/view/screen/user_screens/facility_details/facility_details_screen.dart';
import 'package:tourism_app/view/screen/user_screens/search/search_screen.dart';
import 'package:tourism_app/view/screen/user_screens/trip_details/reviews_sreen.dart';
import 'package:tourism_app/view/screen/user_screens/trip_details/trip_details_screen.dart';
import 'package:tourism_app/view/screen/user_screens/another_screens/wallet_history.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
    name: AppRoute.navbar,
    page: () => BottomNavBar(),
  ),
  GetPage(
    name: AppRoute.onboarding,
    page: () => const Onboarding(),
  ),
  GetPage(
    name: AppRoute.login,
    page: () => const LogIn(),
  ),
  GetPage(
    name: AppRoute.register,
    page: () => const Register(),
  ),
  GetPage(
    name: AppRoute.forgetpassword,
    page: () => const ForgetPassword(),
  ),
  GetPage(
    name: AppRoute.verifycode,
    page: () => const VerifyCode(),
  ),
  GetPage(
    name: AppRoute.resetpassword,
    page: () => const ResetPassword(),
  ),
  GetPage(
    name: AppRoute.navbar,
    page: () => BottomNavBar(),
  ),
  GetPage(
    name: AppRoute.home,
    page: () => const HomePage(),
  ),
  GetPage(
    name: AppRoute.favorite,
    page: () => const FavoritePage(),
  ),
  GetPage(
    name: AppRoute.profile,
    page: () => const ProfilePage(),
  ),
  GetPage(
    name: AppRoute.settings,
    page: () => const SettingsPage(),
  ),
  GetPage(
    name: AppRoute.editprofile,
    page: () => const EditProfile(),
  ),
  GetPage(
    name: AppRoute.editpassword,
    page: () => const EditPassword(),
  ),
  GetPage(
    name: AppRoute.recommended,
    page: () => const RecommendedPage(),
  ),
  GetPage(
    name: AppRoute.offers,
    page: () => const OffersPage(),
  ),
  GetPage(
    name: AppRoute.appointment,
    page: () => const AppointmentPage(),
  ),
  GetPage(
    name: AppRoute.continuepage,
    page: () => const ContinuePage(),
  ),
  ////////////////Guide/////////
  GetPage(
    name: AppRoute.logingGuide,
    page: () => const LogInGuide(),
  ),
  GetPage(
    name: AppRoute.homeGuide,
    page: () => const HomeGuideScreen(),
  ),
  GetPage(
    name: AppRoute.navbarGuide,
    page: () => BottomNavBarGuide(),
  ),
  GetPage(
    name: AppRoute.profileGuide,
    page: () => const ProfileGuidePage(),
  ),
  GetPage(
    name: AppRoute.editpasswordGuide,
    page: () => const EditPasswordGuide(),
  ),
  GetPage(
    name: AppRoute.resetpasswordGuide,
    page: () => const ResetPasswordGuide(),
  ),
  GetPage(
    name: AppRoute.verifycodeGuide,
    page: () => const VerifyCodeGuide(),
  ),
  GetPage(
    name: AppRoute.registerGuide,
    page: () => const RegisterGuide(),
  ),
  GetPage(
    name: AppRoute.editprofileGuide,
    page: () => const EditProfileGuide(),
  ),
  GetPage(
    name: AppRoute.settingsGuide,
    page: () => const SettingsPageGuide(),
  ),
  GetPage(
    name: AppRoute.transactionsGuide,
    page: () => const TransactionsGuide(),
  ),
  GetPage(
    name: AppRoute.notificationsGuide,
    page: () => const NotificationsGuide(),
  ),
  GetPage(
    name: AppRoute.notifications,
    page: () => const Notifications(),
  ),

  GetPage(
    name: AppRoute.transactions,
    page: () => WalletHistory(),
  ),
  GetPage(name: "/", page: () => const SplashScreen()),
  GetPage(name: AppRoute.home, page: () => const HomeScreen()),
  GetPage(
    name: AppRoute.countryDetails,
    page: () => CountryDetailsScreen(countryId: Get.parameters['id']!),
  ),
  GetPage(
      name: AppRoute.countryDetails,
      page: () =>
          CountryDetailsScreen(countryId: Get.parameters["id"] = "countryId")),
  GetPage(
      name: AppRoute.tripDetails,
      page: () => TripDetails(tripId: Get.parameters['id']!)),
  GetPage(
      name: AppRoute.reviews,
      page: () => ReviewsScreen(tripId: Get.parameters['id']!)),
  GetPage(name: AppRoute.search, page: () => const SearchScreen()),

  GetPage(
      name: AppRoute.facilityDetails,
      page: () => FacilityDetails(facilityId: Get.parameters['id']!)),
  GetPage(
      name: AppRoute.tripsAndFacilities,
      page: () => TripsAndFacilitiesScreen(type: Get.parameters['type']!)),
];
