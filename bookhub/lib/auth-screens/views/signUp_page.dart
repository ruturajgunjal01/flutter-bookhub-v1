import 'package:bookhub/custum_widgets/text_widget.dart';
import 'package:bookhub/utility/constants/app_colors.dart';
import 'package:bookhub/utility/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:bookhub/utility/app_routes.dart';
import 'package:bookhub/auth-screens/controller/auth_controller.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final AuthController _authController = AuthController();
  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
  }

  void _handleSignUp() async {
    if (_authController.validateSignUpForm()) {
      setState(() => _isLoading = true);
      await _authController.signUp(context);
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
          child: Form(
            key: _authController.signUpFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  text: AppString.signupTitle,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFF1A1D1E),
                ),
                SizedBox(height: 8.h),
                TextWidget(
                  text: AppString.title,
                  fontSize: 14.sp,
                  color: const Color(0xFF6B7280),
                  height: 1.5,
                ),
                SizedBox(height: 20.h),
                _buildLabel(AppString.fullname),
                _buildTextField(
                  controller: _authController.firstNameController,
                  hintText: AppString.namehinttext,
                  validator: _authController.validateName,
                ),
                SizedBox(height: 16.h),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildLabel(AppString.age),
                          _buildTextField(
                            controller: _authController.userAgeController,
                            keyboardType: TextInputType.number,
                            validator: _authController.validateUserAge,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 16.w),
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildLabel(AppString.phoneNumber),
                          _buildTextField(
                            controller: _authController.phoneController,
                            keyboardType: TextInputType.phone,
                            validator: _authController.validatePhone,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                _buildLabel(AppString.email),
                _buildTextField(
                  controller: _authController.emailController,
                  hintText: AppString.emailaddress,
                  keyboardType: TextInputType.emailAddress,
                  suffixIcon: const Icon(
                    Icons.check_circle,
                    color: Color(0xFF10B981),
                  ),
                  validator: _authController.validateEmail,
                ),
                SizedBox(height: 16.h),
                _buildLabel(AppString.location),
                _buildTextField(
                  controller: _authController.locationController,
                  hintText: AppString.cityhinttext,
                  suffixIcon: const Icon(
                    Icons.my_location,
                    color: Color(0xFF2B7AF5),
                  ),
                  validator: _authController.validateLocation,
                ),
                SizedBox(height: 8.h),
                Row(
                  children: [
                    Icon(
                      Icons.lock,
                      size: 12.sp,
                      color: const Color(0xFF6B7280),
                    ),
                    SizedBox(width: 4.w),
                    TextWidget(
                      text: AppString.usedOnlyToFindLocalBuyers,
                      fontSize: 12.sp,
                      color: const Color(0xFF6B7280),
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                _buildLabel(AppString.schoolUniversity),
                _buildTextField(
                  controller: _authController.schoolUniController,
                  hintText: AppString.searchcam,
                  prefixIcon: const Icon(
                    Icons.school,
                    color: Color(0xFF9CA3AF),
                  ),
                ),
                SizedBox(height: 19.h),
                _buildLabel(AppString.choosecommunity),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildUserTypeCard(0, "Student", Icons.school),
                    _buildUserTypeCard(1, "College", Icons.business),
                    _buildUserTypeCard(2, "Individual", Icons.person),
                  ],
                ),
                SizedBox(height: 32.h),
                SizedBox(
                  width: double.infinity,
                  height: 56.h,
                  child: ElevatedButton(
                    onPressed: _isLoading ? null : _handleSignUp,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2B7AF5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                      elevation: 0,
                    ),
                    child: _isLoading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextWidget(
                                text: AppString.signupTitle,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              SizedBox(width: 8.w),
                              const Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                              ),
                            ],
                          ),
                  ),
                ),
                SizedBox(height: 24.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextWidget(text: AppString.account, fontSize: 14.sp, color: const Color(0xFF6B7280)),
                    GestureDetector(
                      onTap: () => context.push(AppRoutes.signInPage),
                      child:
                      TextWidget(text: AppString.signin,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF2B7AF5),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: TextWidget(
        text: text,
        fontSize: 13.sp,
        fontWeight: FontWeight.bold,
        color: AppColors.blacktextColor,
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    String? hintText,
    TextInputType? keyboardType,
    Widget? suffixIcon,
    Widget? prefixIcon,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: const Color(0xFF9CA3AF), fontSize: 14.sp),
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: const BorderSide(color: Color(0xFF2B7AF5), width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: const BorderSide(color: Colors.red, width: 1.0),
        ),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
      ),
    );
  }

  Widget _buildUserTypeCard(int index, String label, IconData icon) {
    final isSelected = _authController.selectedUserType == index;
    return GestureDetector(
      onTap: () => setState(() => _authController.selectedUserType = index),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 100.w,
            height: 100.w,
            decoration: BoxDecoration(
              color: isSelected ? const Color(0xFFEFF6FF) : Colors.white,
              borderRadius: BorderRadius.circular(20.r),
              border: Border.all(
                color: isSelected
                    ? const Color(0xFF2B7AF5)
                    : Colors.transparent,
                width: 2,
              ),
              boxShadow: isSelected
                  ? []
                  : [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: isSelected
                      ? const Color(0xFF2B7AF5)
                      : const Color(0xFF6B7280),
                  size: 28.sp,
                ),
                SizedBox(height: 8.h),
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                    color: isSelected
                        ? const Color(0xFF2B7AF5)
                        : const Color(0xFF6B7280),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
