import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:bookhub/utility/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    nextScreen();
  }

  Future<void> nextScreen() async {
    await Future.delayed(const Duration(seconds: 4));
    if (mounted) {
      GoRouter.of(context).go(AppRoutes.welcomePage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFF5F7FA), 
              Color(0xFFE4E8EB), 
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const Spacer(flex: 3),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: 100.w,
                    height: 100.w,
                    decoration: BoxDecoration(
                      color: const Color(0xFF2B7AF5), 
                      borderRadius: BorderRadius.circular(24.r),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF2B7AF5).withOpacity(0.3),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Icon(
                        Icons.local_library_rounded, 
                        color: Colors.white,
                        size: 50.sp,
                      ),
                    ),
                  ),
                  Positioned(
                    top: -8.h,
                    right: -8.w,
                    child: Container(
                      padding: EdgeInsets.all(6.w),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.swap_horiz_rounded,
                        color: const Color(0xFF2B7AF5),
                        size: 16.sp,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24.h),
              Text(
                "CampusBooks",
                style: TextStyle(
                  fontSize: 28.sp,
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFF1A1D1E),
                  letterSpacing: -0.5,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                "Safe. Local. Affordable.",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF6B7280),
                ),
              ),
              const Spacer(flex: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildDot(true),
                  SizedBox(width: 6.w),
                  _buildDot(false),
                  SizedBox(width: 6.w),
                  _buildDot(false),
                ],
              ),
              SizedBox(height: 20.h),
              Text(
                "V 1.0",
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF9CA3AF),
                ),
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDot(bool isActive) {
    return Container(
      width: 8.w,
      height: 8.w,
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFF2B7AF5) : const Color(0xFFBFDBFE),
        shape: BoxShape.circle,
      ),
    );
  }
}
