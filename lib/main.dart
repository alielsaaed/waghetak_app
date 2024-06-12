import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waghetak_app/routes.dart';
import 'package:waghetak_app/theme.dart';
import 'package:waghetak_app/view/auth/password_forgot_screen.dart';
import 'package:waghetak_app/view/auth/signup_screen.dart';
import 'package:waghetak_app/view/core/agency_page_screen.dart';
import 'package:waghetak_app/view/core/booking_information_screen.dart';
import 'package:waghetak_app/view/core/home_screen.dart';
import 'package:waghetak_app/view/core/payments_invoice_screen.dart';
import 'package:waghetak_app/view/core/reservation_screen.dart';
import 'package:waghetak_app/view/onboarding/onboarding_1.dart';
import 'package:waghetak_app/view_model/cubits/booking_cubit/booking_cubit.dart';
import 'package:waghetak_app/view_model/services/home_api.dart';

void main() {
  runApp(
    const ScreenUtilInit(
      designSize: Size(375, 812),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BookingInfoCubit(HomeApi()),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: theme(),
        home: const HomeScreen(),
        debugShowCheckedModeBanner: false,
        routes: routes,
        supportedLocales: const [
          Locale("ar"),
          Locale("en"),
        ],
        locale: const Locale("ar"),
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
      ),
    );
  }
}
