import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:meta/meta.dart';

import '../../../utilities/routes.dart';
import '../../database/local/cache_helper.dart';

part 'sign_out_state.dart';

class SignOutCubit extends Cubit<SignOutState> {
  SignOutCubit() : super(SignOutInitial());
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  signOut(context) {
    firebaseAuth.signOut().then((value) {
      CacheHelper.put(key: "logged", value: false);
      CacheHelper.removeData(key: "name");
      CacheHelper.removeData(key: "email");
      CacheHelper.removeData(key: "photoUrl");
      Navigator.popAndPushNamed(
          context, AppRoutes.splashScreenRoute);
    });
  }
}
