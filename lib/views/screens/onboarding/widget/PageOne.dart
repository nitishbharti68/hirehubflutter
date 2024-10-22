import 'package:flutter/material.dart';
import 'package:hirehub/constants/app_constants.dart';
import 'package:hirehub/views/common/exports.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: width,
        height: hieght,
        color: Color(kDarkPurple.value),
        child: Column(
          children: [
            const SizedBox(
              height: 70,
            ),
            Image.asset('assets/images/page1.png'),
            const SizedBox(
              height: 40,
            ),
            Column(
              children: [
                ReusableText(
                    text: 'Find your dram job',
                    style: appStyle(30, Color(kLight.value), FontWeight.w500)),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    'We help find your dream job according to your skills and experience. '
                    'We help find your dream job according to your skills and experience.',
                    textAlign: TextAlign.center,
                    style: appStyle(14, Color(kLight.value), FontWeight.normal),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
