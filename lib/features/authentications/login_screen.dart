
import 'package:ecommerce_app/features/authentications/register_screen.dart';
import 'package:flutter/material.dart';

import '../../components/custom_card.dart';
import '../../components/custom_text_form_field.dart';
import '../../models/login_view_model.dart';

class LoginView extends StatelessWidget {
  static var route = "/loginView";
  LoginView({super.key});

  final LoginControllers loginControllers = LoginControllers();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 90,
              ),
              Container(
                  width: 90,
                  height: 90,
                  child: Image.asset("assets/images/logo.png")),
              SizedBox(
                height: 15,
              ),
              Text(
                "Welcome to lafyuu",
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.w500),
              ),
              Text(
                "Sign in to continue",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey.shade300,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 15,
              ),
              Form(
                  key: formKey,
                  child: Column(
                    children: [
                      CustomTextFormField(
                        isPassword: false,
                        controller: loginControllers.emailController,
                        hintText: " Email",
                        label: "Email",
                        prefix: Icons.mail,
                        validator: (value) {
                          if (!loginControllers.isValidEmail(value!)) {
                            return "invalid email";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      CustomTextFormField(
                          isPassword: true,
                          controller: loginControllers.passwordController,
                          hintText: " Password",
                          label: "PAssword",
                          prefix: Icons.lock_outline,
                          validator: (value) {
                            if (!loginControllers.isValidPassword(value!)) {
                              return "password invalid";
                            }

                            return null;
                          }),
                      SizedBox(
                        height: 50,
                      ),
                    ],
                  )),
              InkWell(
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    /*  Navigator.pushNamedAndRemoveUntil(
                      context,
                      LayoutScreen.route,
                    );*/
                  }
                },
                child: Container(
                  padding: EdgeInsets.all(15),
                  alignment: Alignment.center,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      color: Colors.blueAccent),
                  child: Text(
                    "LOGIN",
                    style: TextStyle(
                        //fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 16),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: Colors.black,
                      thickness: 1,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "OR",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.black,
                      thickness: 1,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              CustomCard(
                image: "assets/images/google.png",
                text: "Login with Google",
              ),
              SizedBox(
                height: 10,
              ),
              CustomCard(
                image: "assets/images/facebook.png",
                text: "Login with Facebook",
              ),
              SizedBox(
                height: 15,
              ),
              Center(
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      SignupView.route,
                    );
                  },
                  child: Text.rich(TextSpan(children: [
                    TextSpan(
                        text: "don't have an account? ",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.black)),
                    TextSpan(
                        text: "REGISTER ",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue)),
                  ])),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
