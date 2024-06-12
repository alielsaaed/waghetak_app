import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:waghetak_app/model/auth/login_model.dart';
import 'package:waghetak_app/model/auth/register_model.dart';
import 'package:waghetak_app/routes.dart';
import 'package:waghetak_app/splash_screen.dart';
import 'package:waghetak_app/theme.dart';
import 'package:waghetak_app/view-model/cubits/favorite/favorite_cubit.dart';
import 'package:waghetak_app/view-model/cubits/login/login_cubit.dart';
import 'package:waghetak_app/view-model/cubits/register/register_cubit.dart';
import 'package:waghetak_app/view-model/hive/favorite.dart';
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

late FlutterSecureStorage secureStorage;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(FavoriteAdapter());
  await Hive.openBox<Favorite>('favorites');
  secureStorage = const FlutterSecureStorage();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<LoginModel>(
          create: (_) => LoginModel(),
        ),
        ChangeNotifierProvider<RegisterModel>(
          create: (_) => RegisterModel(),
        ),

        // ChangeNotifierProvider<OrderProvider>(
        //   create: (_) => OrderProvider(),
        // ),
      ],
      child: const ScreenUtilInit(
        designSize: Size(393, 852),
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    // final provider = Provider.of<LocaleProvider>(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginCubit>(
          create: (context) => LoginCubit(),
        ),
        BlocProvider<RegisterCubit>(
          create: (context) => RegisterCubit(),
        ),
        BlocProvider<FavoriteCubit>(
          create: (context) => FavoriteCubit(),
        ),
        BlocProvider<BookingInfoCubit>(
          create: (context) => BookingInfoCubit(HomeApi()),
        ),
      ],
      child: MaterialApp(
        title: 'RCT App',
        theme: theme(),
        debugShowCheckedModeBanner: false,
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
        home: const SplashScreen(),
        routes: routes,
      ),
    );
  }
}
