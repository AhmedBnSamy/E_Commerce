
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../components/custom_text_form_field.dart';
import '../../cubits/register_cubit/register_cubit.dart';
import '../../models/login_view_model.dart';
import '../layout_screen.dart';
import 'login_screen.dart';

class SignupView extends StatelessWidget {
  static const route = "/signup";
  final LoginControllers loginControllers = LoginControllers();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is SignUpSuccessful) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("register Succeed")));
          Navigator.pushReplacementNamed(context, LayoutScreen.route);
        } else if (state is SignUpFailure) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("Error :${state.error} ")));
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/logo.png"),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Let's Get Started",
                      style: const TextStyle(
                          fontSize: 36, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "Create a new account",
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.grey.shade300,
                          fontWeight: FontWeight.w500),
                    ),
                    Form(
                      key: formKey,
                      child: Column(
                        children: [
                          CustomTextFormField(
                            isPassword: false,
                            controller: loginControllers.nameController,
                            hintText: "Full Name",
                            label: "Name",
                            prefix: Icons.mail,
                            validator: (value) {
                              if (!loginControllers.isValidName(value!)) {
                                return "Name invalid";
                              }

                              return null;
                            },
                          ),
                          const SizedBox(height: 30),
                          CustomTextFormField(
                            isPassword: false,
                            controller: loginControllers.emailController,
                            hintText: "Email",
                            label: "Email",
                            prefix: Icons.mail,
                            validator: (value) {
                              if (!loginControllers.isValidEmail(value!)) {
                                return "Email invalid";
                              }

                              return null;
                            },
                          ),
                          const SizedBox(height: 30),
                          CustomTextFormField(
                              isPassword: true,
                              controller: loginControllers.passwordController,
                              hintText: "Password",
                              label: "Password",
                              prefix: Icons.lock_outline,
                              validator: (value) {
                                if (!loginControllers.isValidPassword(value!)) {
                                  return "password invalid";
                                }
                                return null;
                              }),
                          const SizedBox(height: 30),
                          CustomTextFormField(
                              isPassword: false,
                              controller: loginControllers.phoneController,
                              hintText: "phone number",
                              label: "phone number",
                              prefix: Icons.lock_outline,
                              validator: (value) {
                                if (!loginControllers.isValidPhone(value!)) {
                                  return "phone number invalid";
                                }
                                return null;
                              }),
                          const SizedBox(height: 50),
                        ],
                      ),
                    ),
                    state is SignUpLoading
                        ? Center(
                      child: CircularProgressIndicator(),
                    )
                        : InkWell(
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          BlocProvider.of<RegisterCubit>(context)
                              .userRegister(
                              name: loginControllers
                                  .nameController.text,
                              email: loginControllers
                                  .emailController.text,
                              password: loginControllers
                                  .passwordController.text,
                              phone: loginControllers
                                  .phoneController.text);
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        alignment: Alignment.center,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          color: Colors.blueAccent,
                        ),
                        child: const Text(
                          "SignUp",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Center(
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            LoginView.route,
                            /* arguments:
                                loginControllers.emailController.text.trim(),*/
                          );
                        },
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "Have an account? ",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                              TextSpan(
                                text: "Login",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}