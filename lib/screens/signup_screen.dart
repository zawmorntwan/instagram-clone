// ignore_for_file: use_build_context_synchronously, deprecated_member_use

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

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
import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _bioController = TextEditingController();
  final _emailController = TextEditingController();
  Uint8List? _image;
  bool _isLoading = false;
  final _passwordController = TextEditingController();
  final _userNameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _userNameController.dispose();
    _bioController.dispose();
  }

  void selectImage() async {
    Uint8List image = await Services().pickImage(ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  void signUpUser() async {
    setState(() {
      _isLoading = true;
    });
    if (_image == null) {
      Services().showSnackBar(
        context,
        'Please select profile photo.',
      );
      setState(() {
        _isLoading = false;
      });
    } else {
      String response = await AuthServices().signUpUser(
        email: _emailController.text,
        password: _passwordController.text,
        userName: _userNameController.text,
        bio: _bioController.text,
        file: _image!,
      );

      setState(() {
        _isLoading = false;
      });

      if (response != 'success') {
        Services().showSnackBar(
          context,
          response,
        );
      } else {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const ResponsiveLayout(
              webScreenLayout: WebScreenLayout(),
              mobileScreenLayout: MobileScreenLayout(),
            ),
          ),
        );
      }
    }
  }

  void navigateToLogin() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
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
          height: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                flex: 2,
                child: Container(),
              ),

              // Logo
              if (!isKeyboard)
                SvgPicture.asset(
                  ImageAssets.appLogo,
                  color: ColorManager.whiteColor,
                  height: 64,
                ),
              const SizedBox(
                height: 64,
              ),

              // circular widget to accept and show selected file
              if (!isKeyboard)
                Stack(
                  children: [
                    _image != null
                        ? CircleAvatar(
                            radius: 64,
                            backgroundImage: MemoryImage(_image!),
                          )
                        : const CircleAvatar(
                            radius: 64,
                            backgroundImage:
                                AssetImage(ImageAssets.defaultUserPhoto),
                          ),
                    Positioned(
                      bottom: -10,
                      left: 80,
                      child: IconButton(
                        onPressed: selectImage,
                        icon: const Icon(
                          Icons.add_a_photo,
                          color: ColorManager.whiteColor,
                        ),
                      ),
                    ),
                  ],
                ),

              if (!isKeyboard)
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
                onTap: signUpUser,
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
                          'Sign up',
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
                      "Already have an account? ",
                      style: getRegularTextStyle(
                        color: ColorManager.greyColor,
                        fontSize: FontSize.s14,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: navigateToLogin,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Text(
                        "log in.",
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
