import 'package:ai_app_flutter/helper/Pref.dart';
import 'package:ai_app_flutter/helper/globle.dart';
import 'package:ai_app_flutter/screens/home_screen.dart';
import 'package:ai_app_flutter/screens/on_boarding_screen.dart';
import 'package:ai_app_flutter/widgets/custom_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      // Navigator.of(context).pushReplacement(
      //   MaterialPageRoute(
      //     builder: (_) => Pref.showOnBoarding
      //         ? const OnBoardingScreen()
      //         : const HomeScreen(),
      //   ),
      // );
      Get.off(
        () =>
            Pref.showOnBoarding ? const OnBoardingScreen() : const HomeScreen(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SizedBox(
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Spacer(flex: 2),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              color: Colors.blue,
              child: Padding(
                padding: EdgeInsets.all(mq.width * .05),
                child: Image.asset(
                  "assets/images/logo.png",
                  width: mq.width * .4,
                ),
              ),
            ),
            Spacer(),
            CustomLoading(),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
