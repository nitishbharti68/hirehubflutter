import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hirehub/constants/app_constants.dart';
import 'package:hirehub/views/common/app_style.dart';
import 'package:hirehub/views/common/reusable_text.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, this.text, this.child, this.actions});

  final String? text;
  final Widget? child;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(),
      backgroundColor: Color(kOrange.value),
      foregroundColor: Color(kLight.value),
      // shape: const RoundedRectangleBorder(
      //     borderRadius: BorderRadius.only(
      //   bottomLeft: Radius.circular(20),
      // )),
      elevation: 0,
      automaticallyImplyLeading: false,
      leadingWidth: 70.w,
      leading: child,
      actions: actions,
      centerTitle: true,
      title: ReusableText(
          text: text ?? "",
          style: appStyle(16, Color(kLight.value), FontWeight.w600)),
    );
  }
}
