

import 'package:multi_choise_app/screens/login_screen.dart';
import 'package:multi_choise_app/screens/payment_screen.dart';
import 'package:multi_choise_app/screens/signup_screen.dart';
import 'package:multi_choise_app/screens/splash_screen.dart';

class AppRoute {
  static const Splash = '/';
  static const Login = '/login';
  static const SignUp = '/SignUp';
  static const Home = '/Payment';


}

var routes = {
  AppRoute.Splash: (context) => SplashScreen(),
  AppRoute.Login: (context) => Login(),
  AppRoute.SignUp: (context) => SignUp(),
  AppRoute.Home: (context) => Payment(),

};
