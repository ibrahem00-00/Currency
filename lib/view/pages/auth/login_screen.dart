import 'package:auth_buttons/auth_buttons.dart';
import 'package:currency/view%20model/auth/login/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../utilities/app_colors.dart';
import '../../../utilities/app_string.dart';
import '../../../utilities/routes.dart';
import '../../../view model/database/local/cache_helper.dart';
import '../../widgets/default_button.dart';
import '../../widgets/default_text.dart';
import '../../widgets/default_text_button.dart';
import '../../widgets/default_text_form_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  bool _passwordVisible = false;

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: formKey,
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      DefaultText(
                        text: AppStrings.signIn,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 25.sp,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      DefaultFormField(
                          inputFocusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)),
                          inputBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)),
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          prefixIcon:
                              const Icon(Icons.email, color: Colors.grey),
                          hintText: AppStrings.email,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return AppStrings.emailEmpty;
                            }
                            if (!RegExp(
                                    "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9+_.-]+.[a-z]")
                                .hasMatch(value)) {
                              return (AppStrings.validEmail);
                            } else {
                              return null;
                            }
                          }),
                      SizedBox(
                        height: 2.h,
                      ),
                      DefaultFormField(
                        inputFocusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                        inputBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                        controller: passwordController,
                        keyboardType: TextInputType.text,
                        obscureText: _passwordVisible,
                        maxLines: 1,
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: Colors.grey,
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                          icon: Icon(
                            _passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.grey,
                          ),
                        ),
                        hintText: AppStrings.password,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return AppStrings.required;
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      DefaultButton(
                        text: AppStrings.signIn,
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp,
                        background: AppColors.primaryColor,
                        width: 70.w,
                        height: 7.h,
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            CacheHelper.put(
                                key: "logged", value: true);
                            context.read<LoginCubit>().loginByEmailAndPassword(
                                emailController.text,
                                passwordController.text,
                                context);

                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //       builder: (context) => const HomeLayout(),
                            //     ));
                          }
                        },
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      const DefaultText(
                        text: AppStrings.or,
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      GoogleAuthButton(
                        text: AppStrings.continueWithGoogle,
                        onPressed: (){
                           context.read<LoginCubit>().signInByGoogle().then((value){

                             Navigator.popAndPushNamed(context, AppRoutes.homeScreenRoute);
                           });
                        },
                        style: AuthButtonStyle(
                          borderColor: Colors.grey,
                          width: 80.w,
                          height: 6.h,
                          elevation: 0,
                          buttonColor: Colors.transparent,
                          borderWidth: 1,
                          textStyle: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                          //buttonType: AuthButtonType.icon,
                          //iconType: AuthIconType.secondary,
                        ),
                      ),
                      DefaultTextButton(
                        mainTxt: AppStrings.dontHaveAccount,
                        secondaryTxt: AppStrings.signup,
                        mainTxtColor: Colors.black,
                        secondaryTxtColor: AppColors.primaryColor,
                        mainTxtSize: 12.sp,
                        secondaryTxtSize: 14.sp,
                        onPressed: () {
                          Navigator.popAndPushNamed(
                              context, AppRoutes.registerScreenRoute);

                          //Navigator.push(context, MaterialPageRoute(builder: (context) => const SignupScreen(),));
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
