import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hirehub/controllers/signup_provider.dart';
import 'package:hirehub/models/request/auth/signup_model.dart';
import 'package:hirehub/views/common/pages_loader.dart';
import 'package:hirehub/views/screens/auth/login_page.dart';
import 'package:provider/provider.dart';

import '../../../constants/app_constants.dart';
import '../../../controllers/login_provider.dart';
import '../../../controllers/zoom_provider.dart';
import '../../common/BackBtn.dart';
import '../../common/app_bar.dart';
import '../../common/app_style.dart';
import '../../common/custom_textfield.dart';
import '../../common/height_spacer.dart';
import '../../common/reusable_text.dart';
import '../../common/styled_container.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController username = TextEditingController();

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    username.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SignUpNotifier>(builder: (context, signUpNotifier, child) {
      return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: CustomAppBar(
            text: 'Sign Up',
            child: GestureDetector(
              onTap: () {
                Get.offAll(() => const LoginPage());
              },
              child: Icon(
                AntDesign.leftcircleo,
                color: Color(kLight.value),
              ),
            ),
          ),
        ),
        body: signUpNotifier.loader
            ? const PageLoader()
            : buildStyleContainer(
                context,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Form(
                    child: ListView(
                      padding: EdgeInsets.zero,
                      children: [
                        const HeightSpacer(size: 50),
                        ReusableText(
                          text: "Welcome",
                          style:
                              appStyle(30, Color(kDark.value), FontWeight.w600),
                        ),
                        ReusableText(
                          text: "Fill in Details to sign up to your account",
                          style: appStyle(
                              14, Color(kDarkGrey.value), FontWeight.w400),
                        ),
                        const HeightSpacer(size: 40),
                        CustomTextField(
                          controller: username,
                          hintText: 'Full Name',
                          keyboardType: TextInputType.text,
                          validator: (username) {
                            if (username!.isEmpty) {
                              return "Please enter your email correctly";
                            }
                            return null;
                          },
                        ),
                        const HeightSpacer(size: 20),
                        CustomTextField(
                          controller: email,
                          hintText: 'Enter your email',
                          keyboardType: TextInputType.emailAddress,
                          validator: (email) {
                            if (email!.isEmpty || !email.contains('@')) {
                              return "Please enter your email correctly";
                            }
                            return null;
                          },
                        ),
                        const HeightSpacer(size: 20),
                        CustomTextField(
                          controller: password,
                          hintText: 'Password',
                          obscureText: signUpNotifier.obscureText,
                          keyboardType: TextInputType.visiblePassword,
                          validator: (password) {
                            if (password!.isEmpty || password.length < 8) {
                              return "Please enter valid password";
                            }
                            return null;
                          },
                          suffixIcon: IconButton(
                              onPressed: () {
                                signUpNotifier.obscureText =
                                    !signUpNotifier.obscureText;
                              },
                              icon: Icon(signUpNotifier.obscureText
                                  ? Icons.visibility
                                  : Icons.visibility_off)),
                        ),
                        const HeightSpacer(size: 10),
                        Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: () {
                              Get.offAll(() => const LoginPage());
                            },
                            child: ReusableText(
                                text: 'Already have an account? Login',
                                style: appStyle(12, Color(kLightBlue.value),
                                    FontWeight.w400)),
                          ),
                        ),
                        const HeightSpacer(size: 30),
                        Consumer<ZoomNotifier>(
                            builder: (context, zoomNotifier, child) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 50),
                            child: ElevatedButton(
                              onPressed: () {
                                signUpNotifier.loader = true;

                                SignupModel model = SignupModel(
                                    username: username.text,
                                    email: email.text,
                                    password: password.text);

                                String newModel = signupModelToJson(model);

                                signUpNotifier.signUp(newModel);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(kOrange.value),
                                foregroundColor: Color(kLight.value),
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                              ),
                              child: Text(
                                'Sign Up',
                                style: appStyle(
                                    16, Color(kLight.value), FontWeight.w600),
                              ),
                            ),
                          );
                        })
                      ],
                    ),
                  ),
                ),
              ),
      );
    });
  }
}
