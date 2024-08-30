
import 'package:get/get.dart';
import 'package:quote_app_db/View/Screens/QuoteScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';


class OnboardingController extends GetxController {
  var hasSeenOnboarding = false.obs;

  @override
  void onInit() {
    super.onInit();
    _checkOnboardingStatus();
  }

  void _checkOnboardingStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    hasSeenOnboarding.value = prefs.getBool('hasSeenOnboarding') ?? false;

    if (hasSeenOnboarding.value) {
      Get.offAll(() => QuotePage()); // Replace with your main screen
    }
  }

  void completeOnboarding() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('hasSeenOnboarding', true);
    Get.offAll(() => QuotePage()); // Replace with your main screen
  }
}
