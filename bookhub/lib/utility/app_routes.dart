import 'package:bookhub/auth-screens/views/signIn_page.dart';
import 'package:bookhub/auth-screens/views/signup_page.dart';
import 'package:bookhub/auth-screens/views/welcome_page.dart';
import 'package:bookhub/features-screens/home_screen_page.dart';
import 'package:go_router/go_router.dart';
import 'package:bookhub/auth-screens/views/splash_screen.dart';

class AppRoutes {

  static const String splashScreen = "/"; 
  static const String signInPage = "/signIn";
  static const String signUpPage = "/signUp"; 
  static const String welcomePage = "/welcomePage"; 
  static const String homeScreen = "/home";
  

  GoRouter get router => _goRouter;
  late final GoRouter _goRouter = GoRouter(
    routes: [
      GoRoute(
        path: splashScreen,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: welcomePage,
        builder: (context, state) => const WelcomePage(),
      ),
      GoRoute(
        path: signInPage,
        builder: (context, state) => const SigninPage(),
      ),
      GoRoute(
        path: signUpPage,
        builder: (context, state) => const SignupPage(),
      ),
      GoRoute(
        path: homeScreen,
        builder: (context, state) => const HomeScreen(),
      ),
    ],
  );
}
