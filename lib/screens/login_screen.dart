// ignore_for_file: use_build_context_synchronously, deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/fonts_manager.dart';
import '../resources/style_manager.dart';
import '../responsive/mobile_screen_layout.dart';
import '../responsive/responsive_layout_screen.dart';
import '../responsive/web_screen_layout.dart';
import '../services/auth_services.dart';
import '../services/services.dart';
import '../widgets/loader.dart';
import '../widgets/text_field_input.dart';
import 'signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  bool _isLoading = false;
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void loginUser() async {
    setState(() {
      _isLoading = true;
    });
    String response = await AuthServices().loginUser(
      email: _emailController.text,
      password: _passwordController.text,
    );
    if (response == 'Success') {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const ResponsiveLayout(
            webScreenLayout: WebScreenLayout(),
            mobileScreenLayout: MobileScreenLayout(),
          ),
        ),
      );
    } else {
      Services().showSnackBar(context, response);
    }
    setState(() {
      _isLoading = false;
    });
  }

  void navigateToSignup() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const SignupScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 32,
          ),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                flex: 2,
                child: Container(),
              ),

              // Logo
              SvgPicture.asset(
                ImageAssets.appLogo,
                color: ColorManager.whiteColor,
                height: 64,
              ),
              const SizedBox(
                height: 64,
              ),

              // text field input for email
              TextFieldInput(
                controller: _emailController,
                hintText: 'Enter your email',
                textInputType: TextInputType.emailAddress,
                isLastInput: false,
              ),

              const SizedBox(
                height: 24,
              ),

              // text field input for password
              TextFieldInput(
                controller: _passwordController,
                hintText: 'Enter your password',
                textInputType: TextInputType.text,
                isPassword: true,
              ),

              const SizedBox(
                height: 24,
              ),

              // login button
              InkWell(
                onTap: loginUser,
                child: _isLoading
                    ? Center(
                        child: Loader(
                          shape: LoaderShape.fadingCircle,
                        ),
                      )
                    : Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: const ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(4),
                            ),
                          ),
                          color: ColorManager.blueColor,
                        ),
                        child: Text(
                          'Log in',
                          style: getRegularTextStyle(
                            color: ColorManager.whiteColor,
                            fontSize: FontSize.s14,
                          ),
                        ),
                      ),
              ),

              const SizedBox(
                height: 12,
              ),
              Flexible(
                flex: 2,
                child: Container(),
              ),

              // transaction to sign up page
              if (!isKeyboard)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Text(
                        "Don't have an account? ",
                        style: getRegularTextStyle(
                          color: ColorManager.greyColor,
                          fontSize: FontSize.s14,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: navigateToSignup,
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Text(
                          "Sign up.",
                          style: getSemiBoldTextStyle(
                            color: ColorManager.whiteColor,
                            fontSize: FontSize.s14,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
            ],
          ),
        ),
      ),
    );
  }
}
