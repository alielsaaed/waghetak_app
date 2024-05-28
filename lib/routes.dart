import 'package:flutter/cupertino.dart';
import 'package:waghetak_app/view/auth/login_screen.dart';
import 'package:waghetak_app/view/auth/signup_screen.dart';
import 'package:waghetak_app/view/core/booking_information_screen.dart';
import 'package:waghetak_app/view/core/booking_invoice_screen.dart';
import 'package:waghetak_app/view/core/favorite_screen.dart';
import 'package:waghetak_app/view/core/home_screen.dart';
import 'package:waghetak_app/view/core/notifications_screen.dart';
import 'package:waghetak_app/view/core/payments_screen.dart';
import 'package:waghetak_app/view/onboarding/onbaording_3.dart';
import 'package:waghetak_app/view/onboarding/onboarding_1.dart';
import 'package:waghetak_app/view/onboarding/onboarding_2.dart';

Map<String, Widget Function(BuildContext)> routes = {
  OnboardingScreen1.id: (context) => const OnboardingScreen1(),
  OnboardingScreen2.id: (context) => const OnboardingScreen2(),
  OnboardingScreen3.id: (context) => const OnboardingScreen3(),
  LoginScreen.id: (context) => const LoginScreen(),
  SignupScreen.id: (context) => const SignupScreen(),
  HomeScreen.id: (context) => const HomeScreen(),
  NotificationScreen.id: (context) => NotificationScreen(),
  FavoriteScreen.id: (context) => const FavoriteScreen(),
  PaymentsScreen.id: (context) => const PaymentsScreen(),
  BookingInvoiceScreen.id: (context) => const BookingInvoiceScreen(),
  BookingInformationScreen.id: (context) => const BookingInformationScreen(),
};
