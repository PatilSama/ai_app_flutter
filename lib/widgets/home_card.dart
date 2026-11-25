import 'package:ai_app_flutter/helper/globle.dart';
import 'package:ai_app_flutter/model/home_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lottie/lottie.dart';

class HomeCard extends StatelessWidget {
  final HomeType homeType;


  const HomeCard({super.key, required this.homeType});

  @override
  Widget build(BuildContext context) {
    Animate.restartOnHotReload = true;
    return Card(
      color: Colors.blue.withOpacity(.1),
      elevation: 0,
      margin: EdgeInsets.only(bottom: mq.height * .02),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: homeType.leftAlign?Row(
        children: [
          SizedBox(
            width: mq.width * .35,
            child: Padding(
              padding: homeType.padding,
              child: Lottie.asset(
                "assets/lottie/${homeType.lottie}",

              ),
            ),
          ),
          Spacer(),
          Text(
            homeType.title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.black,
              letterSpacing: 1,
            ),
          ),
          Spacer(flex: 2),
        ],
      ):Row(
        children: [
          Spacer(flex: 2,),
          Text(
            homeType.title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.black,
              letterSpacing: 1,
            ),
          ),
          Spacer(),
          SizedBox(
            width: mq.width * .35,
            child: Padding(
              padding: homeType.padding,
              child: Lottie.asset(
                "assets/lottie/${homeType.lottie}",

              ),
            ),
          ),
        ],
      ),
    );
  }
}
