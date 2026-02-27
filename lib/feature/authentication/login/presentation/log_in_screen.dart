// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:work_02_2026/common_widgets/background.dart';
import 'package:work_02_2026/common_widgets/custom_button.dart';
import 'package:work_02_2026/common_widgets/custom_text_form_field.dart';
import 'package:work_02_2026/constants/validator.dart';
import 'package:work_02_2026/gen/colors.gen.dart';
import 'package:work_02_2026/helpers/ui_helpers.dart';
import 'package:work_02_2026/navigation.dart';
import 'package:work_02_2026/providers/auth_providers.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final _nameController = TextEditingController();
  final _passController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isPasswordVisible = true;

  @override
  void dispose() {
    _nameController.dispose();
    _passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AuthProviders>(context);
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Background(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UIHelper.verticalSpace(120.h),
                  ////------------- Login Text --------------------/////
                  Center(
                    child: Text(
                      "LogIn",
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 40.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  UIHelper.verticalSpace(20.h),
                  UIHelper.customDivider(
                    color: const Color(0x1943A3F1),
                    height: 2.h,
                  ),
                  UIHelper.verticalSpace(30.h),
                  /////------------- PHONE NUMBER TEXT FIELD --------------------/////
                  CommonTextFormField(
                    isSuffixIcon: false,
                    isPrefixIcon: true,
                    prefixIcon: Icons.person,
                    hintText: "Enter your user name",
                    controller: _nameController,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.name,
                    validator: nameValidator,
                  ),
                  UIHelper.verticalSpace(20.h),
                  /////------------- PASSWORD TEXT FIELD --------------------/////
                  CommonTextFormField(
                    isSuffixIcon: false,
                    controller: _passController,
                    isPrefixIcon: true,
                    prefixIcon: Icons.lock,
                    hintText: "Enter your password",
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.done,
                    obscureText: _isPasswordVisible,
                    suffixIconWidget: GestureDetector(
                      onTap: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                      child: Icon(
                        !_isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: const Color(0xff637381),
                      ),
                    ),
                    validator: passwordValidator,
                  ),
                  UIHelper.verticalSpace(40.h),
                  /////------------- LOGIN BUTTON --------------------/////
                  provider.isLoading
                      ? SpinKitChasingDots(color: AppColors.primaryColor)
                      : CustomButton(
                          onTap: () async {
                            if (_formKey.currentState!.validate()) {
                              final success = await provider.loginSubmit(
                                userName: _nameController.text,
                                password: _passController.text.trim(),
                              );
                              if (success) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => NavigationScreen(
                                      pageNum: provider.currentIndex,
                                    ),
                                  ),
                                );
                              }
                            }
                          },
                          text: "Login",
                        ),
                  UIHelper.verticalSpace(40.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
