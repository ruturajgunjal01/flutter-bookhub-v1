import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:bookhub/utility/app_routes.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  int _selectedUserType = 0; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Let’s get started!",
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFF1A1D1E),
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                "Create your account to buy and sell books safely within your campus community.",
                style: TextStyle(
                  fontSize: 14.sp,
                  color: const Color(0xFF6B7280),
                  height: 1.5,
                ),
              ),
              SizedBox(height: 24.h),
              _buildLabel("Full Name"),
              _buildTextField(hintText: "e.g. Alex Johnson"),
              SizedBox(height: 16.h),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildLabel("Age"),
                        _buildTextField(hintText: "20", keyboardType: TextInputType.number),
                      ],
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildLabel("Phone Number"),
                        _buildTextField(hintText: "+91", keyboardType: TextInputType.phone),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              _buildLabel("Email Address"),
              _buildTextField(
                hintText: "Enter your email",
                keyboardType: TextInputType.emailAddress,
                suffixIcon: const Icon(Icons.check_circle, color: Color(0xFF10B981)),
              ),
              SizedBox(height: 16.h),
              _buildLabel("Location"),
              _buildTextField(
                hintText: "City, Zip Code",
                suffixIcon: const Icon(Icons.my_location, color: Color(0xFF2B7AF5)),
              ),
              SizedBox(height: 8.h),
              Row(
                children: [
                  Icon(Icons.lock, size: 12.sp, color: const Color(0xFF6B7280)),
                  SizedBox(width: 4.w),
                  Text(
                    "Used only to find local buyers near you.",
                    style: TextStyle(fontSize: 12.sp, color: const Color(0xFF6B7280)),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              _buildLabel("School / University"),
              _buildTextField(
                hintText: "Search for your campus...",
                prefixIcon: const Icon(Icons.school, color: Color(0xFF9CA3AF)),
              ),
              SizedBox(height: 19.h),
              _buildLabel("choose your role in the community"),
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
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2B7AF5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                    elevation: 0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Create Account",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      const Icon(Icons.arrow_forward, color: Colors.white),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 24.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: const Color(0xFF6B7280),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => context.push(AppRoutes.signInPage),
                    child: Text(
                      "Log In",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF2B7AF5),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 13.sp,
          fontWeight: FontWeight.bold,
          color: const Color(0xFF1A1D1E),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String hintText,
    TextInputType? keyboardType,
    Widget? suffixIcon,
    Widget? prefixIcon,
  }) {
    return TextFormField(
      keyboardType: keyboardType,
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
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
      ),
    );
  }

  Widget _buildUserTypeCard(int index, String label, IconData icon) {
    final isSelected = _selectedUserType == index;
    return GestureDetector(
      onTap: () => setState(() => _selectedUserType = index),
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
                color: isSelected ? const Color(0xFF2B7AF5) : Colors.transparent,
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
                  color: isSelected ? const Color(0xFF2B7AF5) : const Color(0xFF6B7280),
                  size: 28.sp,
                ),
                SizedBox(height: 8.h),
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                    color: isSelected ? const Color(0xFF2B7AF5) : const Color(0xFF6B7280),
                  ),
                ),
              ],
            ),
          ),
          if (isSelected)
            Positioned(
              top: -6.h,
              right: -6.w,
              child: Container(
                padding: EdgeInsets.all(4.w),
                decoration: const BoxDecoration(
                  color: Color(0xFF2B7AF5),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 12.sp,
                ),
              ),
            ),
        ],
      ),
    );
  }
}