import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hirehub/controllers/login_provider.dart';
import 'package:hirehub/controllers/zoom_provider.dart';
import 'package:hirehub/models/request/auth/login_model.dart';
import 'package:hirehub/views/common/app_bar.dart';
import 'package:hirehub/views/common/custom_textfield.dart';
import 'package:hirehub/views/common/exports.dart';
import 'package:hirehub/views/common/height_spacer.dart';
import 'package:hirehub/views/common/pages_loader.dart';
import 'package:hirehub/views/common/styled_container.dart';
import 'package:hirehub/views/screens/auth/registration_page.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginNotifier>(builder: (context, loginNotifier, child) {
      loginNotifier.getPref();
      return Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: CustomAppBar(
            text: 'Login',
          ),
        ),
        body: loginNotifier.loader
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
                          text: "Welcome Back",
                          style:
                              appStyle(30, Color(kDark.value), FontWeight.w600),
                        ),
                        ReusableText(
                          text: "Fill in Details to login to your account",
                          style: appStyle(
                              14, Color(kDarkGrey.value), FontWeight.w400),
                        ),
                        const HeightSpacer(size: 40),
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
                          obscureText: loginNotifier.obscureText,
                          keyboardType: TextInputType.visiblePassword,
                          validator: (password) {
                            if (password!.isEmpty || password.length < 8) {
                              return "Please enter valid password";
                            }
                            return null;
                          },
                          suffixIcon: IconButton(
                              onPressed: () {
                                loginNotifier.obscureText =
                                    !loginNotifier.obscureText;
                              },
                              icon: Icon(loginNotifier.obscureText
                                  ? Icons.visibility
                                  : Icons.visibility_off)),
                        ),
                        const HeightSpacer(size: 10),
                        Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: () {
                              Get.offAll(() => const RegistrationPage());
                            },
                            child: ReusableText(
                                text: 'Do not have an account? Register',
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
                                loginNotifier.loader = true;

                                LoginModel model = LoginModel(
                                    email: email.text, password: password.text);
                                String newModel = loginModelToJson(model);

                                loginNotifier.login(newModel, zoomNotifier);

                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(kOrange.value),
                                foregroundColor: Color(kLight.value),
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                              ),
                              child: Text(
                                'Login',
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
