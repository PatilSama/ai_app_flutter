import 'package:ai_app_flutter/helper/globle.dart';
import 'package:ai_app_flutter/model/OnBoard.dart';
import 'package:ai_app_flutter/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c = PageController();
    final list = [
      OnBoard(
        title: "Ask me anything",
        subtitle: "I can be your best friend & you can ask me anything & I will help you.",
        lottie: "ai_ask_me",
      ),
      OnBoard(
        title: "Imagination to Reality.",
        subtitle: "Just Imagine Anything & let me know, I will create something wonderful for you.",
        lottie: "ai_play",
      ),
    ];
    return Scaffold(
      body: PageView.builder(
        controller: c,
        itemCount: list.length,
        itemBuilder: (ctx, ind) {
          final isLast = ind == list.length - 1;
          return Column(
            children: [
              Lottie.asset(
                "assets/lottie/${list[ind].lottie}.json",
                height: mq.height * .6,
                width: isLast ? mq.width * .7 : null,
              ),
              Text(
                list[ind].title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                  letterSpacing: .5,
                ),
              ),
              SizedBox(height: mq.height * .015),
              SizedBox(
                width: mq.width * .7,
                child: Text(
                  list[ind].subtitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    letterSpacing: .5,
                    color: Colors.black54,
                  ),
                ),
              ),
              SizedBox(height: mq.height * .02),
              Wrap(
                spacing: 10,
                children: List.generate(
                  list.length,
                  (i) => Container(
                    width: i == ind ? 15 : 10,
                    height: 8,
                    decoration: BoxDecoration(
                      color: i == ind ? Colors.blue : Colors.grey,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ),
              SizedBox(height: mq.height * .02),
              ElevatedButton(
                onPressed: () {
                  if (isLast) {
                    // Navigator.of(context).pushReplacement(
                    //   MaterialPageRoute(builder: (_) => HomeScreen()),
                    // );
                    Get.off(() => HomeScreen());
                  } else {
                    c.nextPage(
                      duration: Duration(milliseconds: 6),
                      curve: Curves.ease,
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  elevation: 0,
                  minimumSize: Size(mq.width * .4, 50),
                ),
                child: Text(
                  ind == list.length - 1 ? "FINISH" : "NEXT",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
