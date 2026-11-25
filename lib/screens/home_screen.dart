import 'package:ai_app_flutter/helper/Pref.dart';
import 'package:ai_app_flutter/helper/globle.dart';
import 'package:ai_app_flutter/model/home_type.dart';
import 'package:ai_app_flutter/widgets/home_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    Pref.showOnBoarding = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          appName,
          style: TextStyle(
            color: Colors.blue,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            padding: EdgeInsets.only(right: 10),
            onPressed: () {},
            icon: Icon(
              Icons.brightness_4_rounded,
              color: Colors.blue,
              size: 26,
            ),
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: mq.width * .04,
          vertical: mq.height * .01,
        ),
        children: HomeType.values
            .map((type) => HomeCard(homeType: type))
            .toList(),
      ).animate().fade(duration: 2.seconds, curve: Curves.easeIn),
    );
  }
}
