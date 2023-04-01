import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/fonts_manager.dart';
import '../resources/style_manager.dart';
import '../widgets/text_field_input.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _userNameController = TextEditingController();
  final _bioController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _userNameController.dispose();
    _bioController.dispose();
  }

  @override
  Widget build(BuildContext context) {
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

              // circular widget to accept and show selected file
              Stack(
                children: [
                  CircleAvatar(
                    radius: 64,
                    backgroundImage: NetworkImage(
                      'https://images.unsplash.com/photo-1680173683324-14f412fbf00d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
                    ),
                  ),
                  Positioned(
                    bottom: -10,
                    left: 80,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.add_a_photo,
                        color: ColorManager.whiteColor,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(
                height: 24,
              ),

              // text field input for user name
              TextFieldInput(
                controller: _userNameController,
                hintText: 'Enter your user name',
                textInputType: TextInputType.text,
                isLastInput: false,
              ),

              const SizedBox(
                height: 24,
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
                isLastInput: false,
              ),

              const SizedBox(
                height: 24,
              ),

              // text field input for user name
              TextFieldInput(
                controller: _bioController,
                hintText: 'Enter your bio',
                textInputType: TextInputType.text,
                isLastInput: true,
              ),

              const SizedBox(
                height: 24,
              ),

              // login button
              InkWell(
                onTap: () {},
                child: Container(
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
                    onTap: () {},
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
