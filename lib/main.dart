
import 'package:ecommerce_app/features/authentications/login/view_model/login_cubit/login_cubit.dart';
import 'package:ecommerce_app/features/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubits/layout_cubit/layout_cubit.dart';
import 'features/authentications/login/login_screen.dart';
import 'features/authentications/register/register_screen.dart';
import 'features/authentications/register/view_model/register_cubit/register_cubit.dart';
import 'features/layout_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LayoutCubit()),
        BlocProvider(create: (context) => RegisterCubit()),
        BlocProvider(create: (context) => LoginCubit()),


      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: SplashScreen.route,
        routes: {
          LoginView.route: (context) => LoginView(),
          SignupView.route: (context) => SignupView(),
          LayoutScreen.route: (context) => LayoutScreen(),
          SplashScreen.route: (context) => SplashScreen(),

        },
      ),
    );
  }
}
