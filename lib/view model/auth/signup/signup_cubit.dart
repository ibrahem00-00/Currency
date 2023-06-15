import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

import '../../../model/user_model/user_model.dart';
import '../../../utilities/routes.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  UserModel registerUser = UserModel();

  FirebaseFirestore fireStore = FirebaseFirestore.instance;

  registerByEmailAndPassword(
      String email, String password, String name, context) async {
    emit(SignupLoadingState());
    UserCredential credential = await firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password);
    registerUser.name = name;
    registerUser.password = password;
    registerUser.email = email;
    registerUser.id = credential.user!.uid;
    fireStore
        .collection("user")
        .doc(registerUser.id)
        .set(registerUser.toJson())
        .then((value) {
      Navigator.popAndPushNamed(context, AppRoutes.loginScreenRoute);
      emit(SignupSuccessSaveToFireStoreState());
    });
  }
}
