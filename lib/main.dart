
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubits/layout_cubit/layout_cubit.dart';
import 'cubits/register_cubit/register_cubit.dart';
import 'features/authentications/login_screen.dart';
import 'features/authentications/register_screen.dart';
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

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: LoginView.route,
        routes: {
          LoginView.route: (context) => LoginView(),
          SignupView.route: (context) => SignupView(),
          LayoutScreen.route: (context) => LayoutScreen(),
        },
      ),
    );
  }
}
