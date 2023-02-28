import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:get/get.dart';
import 'package:kid_shop/core/constants/app_colors.dart';
import 'package:kid_shop/core/constants/app_style.dart';
import 'package:kid_shop/core/constants/text_form_field_validator.dart';
import 'package:kid_shop/core/dtos/account/account_dto.dart';
import 'package:kid_shop/core/utils/crypto_helper.dart';
import 'package:kid_shop/core/view_models/screens/interface/isign_up_view_model.dart';
import 'package:kid_shop/global/router.dart';
import 'package:kid_shop/ui/common_widgets/common_button.dart';
import 'package:kid_shop/ui/common_widgets/custom_app_bar.dart';
import 'package:kid_shop/ui/common_widgets/custom_outline_text_form_field.dart';
import 'package:provider/src/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    confirmPasswordController.dispose();
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
                'Sign Up',
                style: AppStyle.h5(),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomOutlineTextFormField(
                      validator: Validator.validateNameForm,
                      label: 'Name',
                      hintText: 'Enter user name',
                      obscureText: false,
                      controller: nameController,
                    ),
                    CustomOutlineTextFormField(
                      validator: Validator.validateEmailForm,
                      label: 'Email',
                      hintText: 'Enter user email',
                      obscureText: false,
                      controller: emailController,
                    ),
                    CustomOutlineTextFormField(
                      validator: Validator.validatePasswordForm,
                      label: 'Password',
                      hintText: 'Enter password',
                      obscureText: true,
                      controller: passwordController,
                    ),
                    CustomOutlineTextFormField(
                      validator: (value) {
                        if (confirmPasswordController.text
                                .compareTo(passwordController.text) !=
                            0) {
                          return 'Confirm password does not match';
                        }
                        Validator.validateConfirmPasswordForm(value);
                      },
                      label: 'Confirm Password',
                      hintText: 'Enter confirm password',
                      obscureText: true,
                      controller: confirmPasswordController,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.h),
              CommonButton(
                text: 'Sign in',
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    final result =
                        await context.read<ISignUpViewModel>().signUp(
                              AccountDto(
                                username: nameController.text.trim(),
                                password: CryptoHelper.generatedMd5(
                                    passwordController.text.trim()),
                                email: emailController.text.trim(),
                              ),
                            );

                    result
                        ? Get.dialog(
                            AlertDialog(
                              title: Center(
                                  child: Text(
                                'Successful',
                                style: AppStyle.h1(),
                              )),
                              actions: [
                                Center(
                                  child: TextButton(
                                    onPressed: () =>
                                        Get.toNamed(MyRouter.signInScreen),
                                    child: Text(
                                      'Sign in',
                                      style: TextStyle(
                                        color: AppColors.primaryGreen,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        : Get.dialog(
                            AlertDialog(
                              title: Center(
                                  child: Text(
                                'Successful',
                                style: AppStyle.h5(),
                              )),
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
                    'Already have an account? ',
                    style: AppStyle.h3(),
                  ),
                  TextButton(
                    onPressed: () => Get.toNamed(MyRouter.signInScreen),
                    child: Text(
                      'Sign in',
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
