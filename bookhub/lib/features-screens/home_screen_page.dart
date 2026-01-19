import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 20.r,
                    backgroundImage: const NetworkImage(
                        'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-4.0.3&auto=format&fit=crop&w=256&q=80'),
                  ),
                  SizedBox(width: 12.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome back,",
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: const Color(0xFF6B7280),
                        ),
                      ),
                      Text(
                        "Alex Johnson",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF1A1D1E),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    padding: EdgeInsets.all(8.w),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Stack(
                      children: [
                        Icon(Icons.notifications_none,
                            color: const Color(0xFF1A1D1E), size: 24.sp),
                        Positioned(
                          right: 0,
                          top: 0,
                          child: Container(
                            width: 8.w,
                            height: 8.w,
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24.h),
              Text(
                "Find books at",
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFF1A1D1E),
                ),
              ),
              Text(
                "State University",
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFF2B7AF5),
                ),
              ),
              SizedBox(height: 8.h),
              Row(
                children: [
                  Icon(Icons.location_on,
                      size: 16.sp, color: const Color(0xFF6B7280)),
                  SizedBox(width: 4.w),
                  Text(
                    "Campus Radius: 5 mi",
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: const Color(0xFF6B7280),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24.h),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(16.w),
                      height: 140.h,
                      decoration: BoxDecoration(
                        color: const Color(0xFF2B7AF5),
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.all(8.w),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            child: Icon(Icons.camera_alt,
                                color: Colors.white, size: 24.sp),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Sell a Book",
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "Scan ISBN to list",
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: Colors.white.withOpacity(0.8),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(16.w),
                      height: 140.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.all(8.w),
                            decoration: BoxDecoration(
                              color: const Color(0xFFEFF6FF),
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            child: Icon(Icons.search,
                                color: const Color(0xFF2B7AF5), size: 24.sp),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Buy a Book",
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xFF1A1D1E),
                                ),
                              ),
                              Text(
                                "Search nearby",
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: const Color(0xFF6B7280),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24.h),
              TextField(
                decoration: InputDecoration(
                  hintText: "Search ISBN, Title, or Class...",
                  hintStyle:
                      TextStyle(color: const Color(0xFF9CA3AF), fontSize: 14.sp),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.r),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: Icon(Icons.search, color: const Color(0xFF9CA3AF)),
                  suffixIcon: Icon(Icons.qr_code_scanner,
                      color: const Color(0xFF9CA3AF)),
                ),
              ),
              SizedBox(height: 24.h),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildCategoryChip("All", true),
                    _buildCategoryChip("Math", false),
                    _buildCategoryChip("Science", false),
                    _buildCategoryChip("Engineering", false),
                  ],
                ),
              ),
              SizedBox(height: 24.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Fresh on Campus",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF1A1D1E),
                    ),
                  ),
                  Text(
                    "See All",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF2B7AF5),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildBookCard(
                      "Chemistry: Central...",
                      "By Brown & LeMay",
                      "\$45",
                      "0.2mi",
                      Colors.white,
                      true,
                    ),
                    SizedBox(width: 16.w),
                    _buildBookCard(
                      "Calculus: Early Tr...",
                      "By James Stewart",
                      "\$30",
                      "0.5mi",
                      const Color(0xFF1A2E35), 
                      false,
                      isDark: true,
                    ),
                    SizedBox(width: 16.w),
                    _buildBookCard(
                      "Intro to Physics",
                      "By David Halliday",
                      "\$12",
                      "1.2mi",
                      Colors.white,
                      false,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24.h),
              Text(
                "Deals Under \$20",
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF1A1D1E),
                ),
              ),
              SizedBox(height: 16.h),
              _buildDealCard("Microeconomics", "Good Condition", "\$18",
                  "0.1 mi away", true),
              SizedBox(height: 16.h),
              _buildDealCard(
                  "Clean Code", "Like New", "\$20", "On Campus", false,
                  isDark: true),
              SizedBox(height: 80.h), 
            ],
          ),
        ),
      ),
      // floatingActionButton: Container(
      //   height: 64.w,
      //   width: 64.w,
      //   decoration: BoxDecoration(
      //     color: const Color(0xFF2B7AF5),
      //     shape: BoxShape.circle,
      //     boxShadow: [
      //       BoxShadow(
      //         color: const Color(0xFF2B7AF5).withOpacity(0.4),
      //         blurRadius: 10,
      //         offset: const Offset(0, 4),
      //       ),
      //     ],
      //   ),
      //   child: Icon(Icons.add, color: Colors.white, size: 32.sp),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // bottomNavigationBar: BottomAppBar(
      //   shape: const CircularNotchedRectangle(),
      //   notchMargin: 8.0,
      //   color: Colors.white,
      //   child: SizedBox(
      //     height: 60.h,
      //     child: Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceAround,
      //       children: [
      //         _buildNavItem(Icons.home_filled, "Home", true),
      //         _buildNavItem(Icons.chat_bubble_outline, "Chat", false),
      //         SizedBox(width: 40.w), 
      //         _buildNavItem(Icons.favorite_border, "Saved", false),
      //         _buildNavItem(Icons.person_outline, "Profile", false),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }

  Widget _buildCategoryChip(String label, bool isSelected) {
    return Container(
      margin: EdgeInsets.only(right: 12.w),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFF1A1D1E) : Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        border: isSelected
            ? null
            : Border.all(color: Colors.grey[200]!),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.bold,
          color: isSelected ? Colors.white : const Color(0xFF6B7280),
        ),
      ),
    );
  }

  Widget _buildBookCard(String title, String author, String price, String distance,
      Color bgColor, bool isVerified,
      {bool isDark = false}) {
    return Container(
      width: 160.w,
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 180.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12.r),
                  image: const DecorationImage(
                    image: NetworkImage(
                        'https://images.unsplash.com/photo-1544947950-fa07a98d237f?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              if (isVerified)
                Positioned(
                  top: 8.h,
                  left: 8.w,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Text(
                      "VERIFIED",
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF1A1D1E),
                      ),
                    ),
                  ),
                ),
              if (isDark)
                Positioned(
                  top: 8.h,
                  right: 8.w,
                  child: Icon(Icons.flash_on, color: Colors.blue, size: 20.sp),
                ),
            ],
          ),
          SizedBox(height: 12.h),
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.white : const Color(0xFF1A1D1E),
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            author,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 12.sp,
              color: isDark ? Colors.white70 : const Color(0xFF6B7280),
            ),
          ),
          SizedBox(height: 8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                price,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFF2B7AF5),
                ),
              ),
              Row(
                children: [
                  Icon(Icons.near_me,
                      size: 12.sp,
                      color: isDark ? Colors.white54 : const Color(0xFF9CA3AF)),
                  SizedBox(width: 2.w),
                  Text(
                    distance,
                    style: TextStyle(
                      fontSize: 10.sp,
                      color: isDark ? Colors.white54 : const Color(0xFF9CA3AF),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDealCard(
      String title, String condition, String price, String distance, bool isTrusted,
      {bool isDark = false}) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        children: [
          Container(
            width: 80.w,
            height: 100.h,
            decoration: BoxDecoration(
              color: isDark ? const Color(0xFF1A2E35) : Colors.grey[200],
              borderRadius: BorderRadius.circular(12.r),
              image: isDark
                  ? null 
                  : const DecorationImage(
                      image: NetworkImage(
                          'https://images.unsplash.com/photo-1589829085413-56de8ae18c73?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80'),
                      fit: BoxFit.cover,
                    ),
            ),
            child: isDark
                ? Center(
                    child: Text("Code", style: TextStyle(color: Colors.white)))
                : null,
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF1A1D1E),
                      ),
                    ),
                    Text(
                      price,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w800,
                        color: const Color(0xFF10B981), 
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4.h),
                Text(
                  condition,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: const Color(0xFF6B7280),
                  ),
                ),
                SizedBox(height: 16.h),
                Row(
                  children: [
                    if (isTrusted)
                      Container(
                        margin: EdgeInsets.only(right: 8.w),
                        padding: EdgeInsets.symmetric(
                            horizontal: 6.w, vertical: 2.h),
                        decoration: BoxDecoration(
                          color: const Color(0xFFECFDF5),
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.check_circle,
                                size: 12.sp, color: const Color(0xFF10B981)),
                            SizedBox(width: 4.w),
                            Text(
                              "Trusted",
                              style: TextStyle(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFF10B981),
                              ),
                            ),
                          ],
                        ),
                      )
                    else
                      Container(
                        margin: EdgeInsets.only(right: 8.w),
                        padding: EdgeInsets.symmetric(
                            horizontal: 6.w, vertical: 2.h),
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                        child: Text(
                          "Student",
                          style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF6B7280),
                          ),
                        ),
                      ),
                    Text(
                      "• $distance",
                      style: TextStyle(
                        fontSize: 10.sp,
                        color: const Color(0xFF9CA3AF),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, bool isSelected) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: isSelected ? const Color(0xFF2B7AF5) : const Color(0xFF9CA3AF),
          size: 24.sp,
        ),
        SizedBox(height: 4.h),
        Text(
          label,
          style: TextStyle(
            fontSize: 10.sp,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            color: isSelected ? const Color(0xFF2B7AF5) : const Color(0xFF9CA3AF),
          ),
        ),
      ],
    );
  }
}
