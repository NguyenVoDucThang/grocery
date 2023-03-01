import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:get/get.dart';
import 'package:kid_shop/core/constants/app_colors.dart';
import 'package:kid_shop/core/constants/app_style.dart';
import 'package:kid_shop/core/constants/text_form_field_validator.dart';
import 'package:kid_shop/core/utils/crypto_helper.dart';
import 'package:kid_shop/core/view_models/screens/interface/iauthentication_view_model.dart';
import 'package:kid_shop/global/router.dart';
import 'package:kid_shop/ui/common_widgets/common_button.dart';
import 'package:kid_shop/ui/common_widgets/custom_app_bar.dart';
import 'package:kid_shop/ui/common_widgets/custom_outline_text_form_field.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBar: AppBar()),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 35.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/fresh_market.png',
                height: 200.h,
              ),
              Text(
                'Sign In',
                style: AppStyle.h5(),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(height: 10.h),
                    CustomOutlineTextFormField(
                      validator: Validator.validateNameForm,
                      label: 'Name',
                      hintText: 'Enter user name',
                      obscureText: false,
                      controller: nameController,
                    ),
                    CustomOutlineTextFormField(
                      validator: Validator.validatePasswordForm,
                      label: 'Password',
                      hintText: 'Enter password',
                      obscureText: true,
                      controller: passwordController,
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Forgot password?',
                    style: TextStyle(color: AppColors.primaryGreen),
                  ),
                ),
              ),
              CommonButton(
                text: 'Sign in',
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    final result =
                        await context.read<IAuthenticationViewModel>().signIn(
                              nameController.text.trim(),
                              CryptoHelper.generatedMd5(
                                  passwordController.text.trim()),
                            );

                    result
                        ? Get.toNamed(MyRouter.homeScreen)
                        : Get.dialog(
                            AlertDialog(
                              title: Center(
                                child: Text(
                                  'Failure',
                                  style: AppStyle.h5(),
                                ),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Get.back(),
                                  child: const Text(
                                    'Close',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                )
                              ],
                            ),
                          );
                  }
                },
              ),
              SizedBox(height: 30.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Spacer(),
                  Text(
                    'Don\'t have an account? ',
                    style: AppStyle.h3(),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.toNamed(MyRouter.signUpScreen);
                      nameController.clear();
                      passwordController.clear();
                    },
                    child: Text(
                      'Sign up',
                      style: TextStyle(color: AppColors.primaryGreen),
                    ),
                  ),
                  const Spacer(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
