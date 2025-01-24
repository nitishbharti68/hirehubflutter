import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hirehub/constants/app_constants.dart';
import 'package:hirehub/views/common/custom_outline_btn.dart';
import 'package:hirehub/views/common/exports.dart';
import 'package:hirehub/views/screens/mainscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PageThree extends StatelessWidget {
  const PageThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: width,
        height: hieght,
        color: Color(kLightBlue.value),
        child: Column(
          children: [
            Image.asset('assets/images/page3.png'),
            const SizedBox(
              height: 20,
            ),
            Column(
              children: [
                Text('Welcome to HireHub',
                    textAlign: TextAlign.center,
                    style: appStyle(30, Color(kLight.value), FontWeight.w600)),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    'We help find your dream job according to your skills and experience.',
                    textAlign: TextAlign.center,
                    style: appStyle(14, Color(kLight.value), FontWeight.normal),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomOutlineBtn(
                    onTap: () async {
                      final SharedPreferences prefs =
                          await SharedPreferences.getInstance();

                      prefs.setBool('entrypoint', true);
                      // all the above is used for that app don't starts from the very first welcome page but from MainScreen.
                      Get.to(
                        () => const MainScreen(),
                      );
                    },
                    hieght: hieght * 0.05,
                    width: width * 0.8,
                    text: 'Continue as guest',
                    color: Color(kLight.value))
              ],
            )
          ],
        ),
      ),
    );
  }
}
