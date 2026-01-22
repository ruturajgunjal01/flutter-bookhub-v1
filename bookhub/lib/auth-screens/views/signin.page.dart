import 'package:bookhub/custum_widgets/text_widget.dart';
import 'package:bookhub/utility/constants/app_colors.dart';
import 'package:bookhub/utility/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bookhub/auth-screens/controller/auth_controller.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final AuthController _authController = AuthController();
  bool _isPhoneLogin = true;
  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
  }

  void _handleSignIn() async {
    setState(() => _isLoading = true);
    await _authController.signIn(context, isPhone: _isPhoneLogin);
    if (mounted) setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundthemcolor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              SizedBox(height: 10.h),
              Container(
                width: double.infinity,
                height: 200.h,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(24.r),
                  image: const DecorationImage(
                    image: NetworkImage(
                      'https://images.unsplash.com/photo-1523240795612-9a054b0db644?ixlib=rb-4.0.3&auto=format&fit=crop&w=1740&q=80',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 24.h),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w800,
                    color: AppColors.blacktextColor,
                    height: 1.2,
                  ),
                  children: [
                    TextSpan(text: "Buy & Sell Books\n"),
                    TextSpan(
                      text: "on Campus",
                      style: TextStyle(color: AppColors.primaryColor),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8.h),
              TextWidget(
                text: "Log in to find the best deals from your classmates.",
                fontSize: 14.sp,
                color: AppColors.greyTextColor,
                height: 1.5,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 32.h),
              Container(
                padding: EdgeInsets.all(4.w),
                decoration: BoxDecoration(
                  color: AppColors.dividerColor,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() => _isPhoneLogin = true),
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 12.h),
                          decoration: BoxDecoration(
                            color: _isPhoneLogin
                                ? AppColors.whiteColor
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(12.r),
                            boxShadow: _isPhoneLogin
                                ? [
                                    BoxShadow(
                                      // ignore: deprecated_member_use
                                      color: Colors.black.withOpacity(0.05),
                                      blurRadius: 4,
                                      offset: const Offset(0, 2),
                                    ),
                                  ]
                                : [],
                          ),
                          child: TextWidget(
                            text: "Phone",
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            color: _isPhoneLogin
                                ? AppColors.primaryColor
                                : AppColors.greyTextColor,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() => _isPhoneLogin = false),
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 12.h),
                          decoration: BoxDecoration(
                            color: !_isPhoneLogin
                                ? AppColors.whiteColor
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(12.r),
                            boxShadow: !_isPhoneLogin
                                ? [
                                    BoxShadow(
                                      // ignore: deprecated_member_use
                                      color: Colors.black.withOpacity(0.05),
                                      blurRadius: 4,
                                      offset: const Offset(0, 2),
                                    ),
                                  ]
                                : [],
                          ),
                          child: TextWidget(
                            text: "Email",
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            color: !_isPhoneLogin
                                ? AppColors.primaryColor
                                : AppColors.greyTextColor,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24.h),
              TextFormField(
                controller: _isPhoneLogin
                    ? _authController.phoneController
                    : _authController.emailController,
                keyboardType: _isPhoneLogin
                    ? TextInputType.phone
                    : TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: _isPhoneLogin
                      ? "(555) 000-0000"
                      : "name@university.edu",
                  hintStyle: TextStyle(
                    color: AppColors.lightGreyColor,
                    fontSize: 14.sp,
                  ),
                  filled: true,
                  fillColor: AppColors.whiteColor,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 16.h,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.r),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: Icon(
                    _isPhoneLogin ? Icons.phone : Icons.email,
                    color: AppColors.lightGreyColor,
                  ),
                ),
              ),
              SizedBox(height: 24.h),
              SizedBox(
                width: double.infinity,
                height: 56.h,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _handleSignIn,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                    elevation: 0,
                  ),
                  child: _isLoading
                      ? const CircularProgressIndicator(color: AppColors.whiteColor)
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextWidget(
                              text: AppString.getLoginCode,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.whiteColor,
                            ),
                            SizedBox(width: 8.w),
                            const Icon(Icons.arrow_forward,
                                color: AppColors.whiteColor),
                          ],
                        ),
                ),
              ),
              SizedBox(height: 32.h),
              Row(
                children: [
                  Expanded(child: Divider(color: AppColors.lightGreyColor)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: TextWidget(
                      text: AppString.orContinueWith,
                      fontSize: 12.sp,
                      color: AppColors.lightGreyColor,
                    ),
                  ),
                  Expanded(child: Divider(color: AppColors.lightGreyColor)),
                ],
              ),
              SizedBox(height: 24.h),
              Row(
                children: [
                  Expanded(
                    child: _buildSocialButton(Icons.g_mobiledata, Colors.red),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: _buildSocialButton(Icons.apple, Colors.black),
                  ),
                ],
              ),
              SizedBox(height: 40.h),
              Center(
                child: Container(
                  padding: EdgeInsets.all(8.w),
                  decoration: BoxDecoration(
                    color: const Color(0xFFECFDF5),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.security,
                    color: const Color(0xFF10B981),
                    size: 16.sp,
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: TextWidget(
                  text: AppString.byLoggingInAgreement,
                  fontSize: 10.sp,
                  color: AppColors.lightGreyColor,
                  height: 1.5,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSocialButton(IconData icon, Color color) {
    return Container(
      height: 56.h,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(30.r),
        border: Border.all(color: AppColors.lightGreyColor),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Center(
        child: Icon(icon, color: color, size: 28.sp),
      ),
    );
  }
}
