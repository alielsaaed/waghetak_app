import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:waghetak_app/common%20compounents/custom_textformfield.dart';
import 'package:waghetak_app/common%20compounents/custom_textformfield_password.dart';
import 'package:waghetak_app/common%20compounents/main_button.dart';
import 'package:waghetak_app/constants/constants.dart';
import 'package:waghetak_app/model/auth/login_model.dart';
import 'package:waghetak_app/view-model/cubits/login/login_cubit.dart';
import 'package:waghetak_app/view-model/functions/snackbar.dart';
import 'package:waghetak_app/view/auth/signup_screen.dart';
import 'package:waghetak_app/view/core/home_screen.dart';

class LoginScreen extends StatelessWidget {
  static String id = "LoginScreen";
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLoading = false;
    final loginModel = Provider.of<LoginModel>(context);
    GlobalKey<FormState> formKey = GlobalKey();
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    String eemail = "";
    String ppassword = "";

    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginLoading) {
              isLoading = true;
            } else if (state is LoginFailed) {
              isLoading = false;
              showSnackBar(context, state.errMessage, redColor);
            } else if (state is LoginSuccess) {
              isLoading = false;
              Navigator.of(context)
                  .pushNamedAndRemoveUntil(HomeScreen.id, (route) => false);
            }
          },
          builder: (context, state) {
            return ModalProgressHUD(
              inAsyncCall: isLoading,
              child: Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ListTile(
                          titleTextStyle: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(
                                fontWeight: mainFontWeight,
                              ),
                          title: const Text(
                            "تسجيل الدخول",
                            textAlign: TextAlign.start,
                          ),
                          subtitle: const Text(
                            "ابدأ رحلتك معنا عبر تسجيل الدخول، ادخل إلى حسابك بسهولة وانطلق في استكشاف خدماتنا وتجاربنا المميزة.",
                            textAlign: TextAlign.start,
                          ),
                        ),
                        SizedBox(
                          height: constVerticalPadding,
                        ),
                        Text(
                          "البريد الالكتروني",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        SizedBox(
                          height: constVerticalPadding,
                        ),
                        TextFormFieldCustom(
                          context: context,
                          labelText: "ادخل البريد الالكتروني",
                          controller: email,
                          onChanged: (p0) => loginModel.email = p0,
                        ),
                        SizedBox(
                          height: constVerticalPadding,
                        ),
                        Text(
                          "كلمة المرور",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        SizedBox(
                          height: constVerticalPadding,
                        ),
                        PasswordFormFieldCustom(
                          labelText: "ادخل كلمة المرور",
                          controller: password,
                          onChanged: (p0) => loginModel.password = p0,
                        ),
                        SizedBox(height: constVerticalPadding),
                        MainButton(
                          text: "تسجيل الدخول",
                          backGroundColor: primaryColor,
                          onTap: () {
                            // Ensure loginModel is updated
                            loginModel.email = email.text;
                            loginModel.password = password.text;
                            print(loginModel.email);
                            print(loginModel.password);
                            if (formKey.currentState!.validate()) {
                              BlocProvider.of<LoginCubit>(context)
                                  .login(loginModel, context);
                            }
                          },
                        ),
                        SizedBox(height: constVerticalPadding),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(child: Divider(color: blackColor)),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text("او"),
                            ),
                            Expanded(
                              child: Divider(color: blackColor),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "ليس لديك حساب؟",
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, SignupScreen.id);
                              },
                              child: Text(
                                "سجل الان",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      color: primaryColor,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
