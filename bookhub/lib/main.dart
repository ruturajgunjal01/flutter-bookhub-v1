import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:bookhub/utility/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      splitScreenMode: true,
      builder: (_, child) {
        final appRoutes = AppRoutes();
        return GetMaterialApp.router(
          title: 'bookhoub',
          // themeMode: ThemeMode.system,
          // theme: TAppthemes.lightTheme,
          // darkTheme: TAppthemes.darkTheme,
          debugShowCheckedModeBanner: false,
          routerDelegate: appRoutes.router.routerDelegate,
          routeInformationProvider: appRoutes.router.routeInformationProvider,
          routeInformationParser: appRoutes.router.routeInformationParser,
        );
      },
    );
  }
}
