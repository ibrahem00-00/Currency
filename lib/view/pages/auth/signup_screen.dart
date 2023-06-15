import 'package:currency/utilities/app_colors.dart';
import 'package:currency/utilities/app_string.dart';
import 'package:currency/view%20model/auth/signup/signup_cubit.dart';
import 'package:currency/view/pages/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../widgets/default_text_button.dart';
import '../../widgets/default_button.dart';
import '../../widgets/default_text.dart';
import '../../widgets/default_text_form_field.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  var nameController = TextEditingController();

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
    return BlocConsumer<SignupCubit, SignupState>(
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
                        text: AppStrings.signup,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 25.sp,
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      DefaultFormField(
                        inputFocusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                        inputBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                        controller: nameController,
                        keyboardType: TextInputType.name,
                        prefixIcon:
                            const Icon(Icons.person, color: Colors.grey),
                        hintText: AppStrings.name,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return AppStrings.required;
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 3.h,
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
                        height: 3.h,
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
                        height: 3.h,
                      ),
                      DefaultButton(
                        text: AppStrings.signup,
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp,
                        background: AppColors.primaryColor,
                        width: 70.w,
                        height: 7.h,
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            context
                                .read<SignupCubit>()
                                .registerByEmailAndPassword(
                                    emailController.text,
                                    passwordController.text,
                                    nameController.text,
                                    context);

                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //       builder: (context) => const HomeLayout(),
                            //     ));
                          }
                        },
                      ),
                      DefaultTextButton(
                        mainTxt: AppStrings.alreadyHaveAccount,
                        secondaryTxt: AppStrings.login,
                        mainTxtColor: Colors.black,
                        secondaryTxtColor: AppColors.primaryColor,
                        mainTxtSize: 12.sp,
                        secondaryTxtSize: 14.sp,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ));
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
