import 'package:currency/view%20model/database/local/cache_helper.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../../model/user_model/user_model.dart';
import '../../../utilities/routes.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  UserModel registerUser = UserModel();
  FirebaseFirestore fireStore = FirebaseFirestore.instance;
  GoogleSignIn googleSignIn = GoogleSignIn();

  loginByEmailAndPassword(String email, String password, context) async {
    UserCredential credential = await firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);

    fireStore.collection('user').doc(credential.user!.uid).get().then((value) {
      registerUser = UserModel.fromJson(json: (value.data()) as Map<String, dynamic>);
      CacheHelper.put(key: 'name', value: registerUser.name.toString());
      CacheHelper.put(key: 'email', value: registerUser.email.toString());
      CacheHelper.put(key: 'photoUrl', value: registerUser.photoUrl.toString());
      emit(LoginGetFormFirebaseSuccessState(
          userModel: UserModel.fromJson(
              json: (value.data()) as Map<String, dynamic>)));
      Navigator.popAndPushNamed(context, AppRoutes.homeScreenRoute);
    }).catchError((onError) {
      if (kDebugMode) {
        print(onError);
      }
      emit(LoginGetFormFirebaseErrorState());
    });
  }
  signInByGoogle() async {
    try {
      firebaseAuth.signOut();
      GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount!.authentication;
      AuthCredential authCredential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken,
      );
      var user = await firebaseAuth.signInWithCredential(authCredential);

      try {
        registerUser.id = user.user!.uid;
        registerUser.name = googleSignInAccount.displayName;
        registerUser.email = googleSignInAccount.email;
        registerUser.photoUrl = googleSignInAccount.photoUrl;
        registerUser.password = googleSignInAccount.serverAuthCode;
        CacheHelper.put(key: 'name', value: registerUser.name.toString());
        CacheHelper.put(key: 'email', value: registerUser.email.toString());
        CacheHelper.put(key: 'photoUrl', value: registerUser.photoUrl.toString());
        await firebaseFirestore
            .collection('user')
            .doc(registerUser.id)
            .set(registerUser.toJson());
        //getMessage();
        // getUsers();
        // emit(SaveDataToFireStoreEmail());
      } catch (e2) {
        rethrow;
       // emit(ErrorDataToFireStoreEmail());
      }
    } catch (e) {
      rethrow;

      //emit(RegisterFailedEmail());
    }
  }
}
