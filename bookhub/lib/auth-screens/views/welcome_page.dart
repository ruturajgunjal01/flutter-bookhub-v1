import 'package:bookhub/auth-screens/views/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.book,
                    color: const Color(0xFF2B7AF5),
                    size: 24.sp,
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    "BookSwap",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF1A1D1E),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24.h),
              Container(
                width: double.infinity,
                height: 250.h,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(32.r),
                  image: const DecorationImage(
                    image: NetworkImage(
                      'https://images.unsplash.com/photo-1523240795612-9a054b0db644?ixlib=rb-4.0.3&auto=format&fit=crop&w=1740&q=80',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: const Center(
                  child: Icon(Icons.image, color: Colors.white54, size: 50),
                ),
              ),
              SizedBox(height: 20.h),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w800,
                    color: const Color(0xFF1A1D1E),
                    height: 1.2,
                  ),
                  children: const [
                    TextSpan(text: "Textbooks for Less,\n"),
                    TextSpan(
                      text: "Locally",
                      style: TextStyle(color: Color(0xFF2B7AF5)),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15.h),
              Text(
                "Save money on textbooks and sell what you don't need. The safe, local marketplace for students.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: const Color(0xFF6B7280),
                  height: 1.5,
                ),
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildBadge(
                    icon: Icons.check_circle,
                    color: const Color(0xFF2B7AF5),
                    text: "Verified Students",
                  ),
                  SizedBox(width: 12.w),
                  _buildBadge(
                    icon: Icons.security,
                    color: const Color(0xFF10B981), 
                    text: "Safe Meetups",
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                height: 56.h,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const SignupPage()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2B7AF5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    "Get Started",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              InkWell(
                child: Text(
                  "I already have an account",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF1A1D1E),
                  ),
                ),
                onTap: ()=> {},
              ),
              SizedBox(height: 20.h),
              Text(
                "By continuing, you agree to our Terms of Service & Privacy Policy",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 10.sp,
                  color: const Color(0xFF9CA3AF),
                ),
              ),
              SizedBox(height: 14.h),
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildBadge({
    required IconData icon,
    required Color color,
    required String text,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, color: color, size: 16.sp),
          SizedBox(width: 6.w),
          Text(
            text,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF1A1D1E),
            ),
          ),
        ],
      ),
    );
  }
}
