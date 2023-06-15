import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

import '../../../../model/user_model/user_model.dart';
import '../../../database/local/cache_helper.dart';

part 'image_pick_state.dart';

class ImagePickCubit extends Cubit<ImagePickState> {
  ImagePickCubit() : super(ImagePickInitial());
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  ImagePicker imagePicker = ImagePicker();
  UserModel registerUser = UserModel();
  XFile? userImage;
  String? photoUrl;

  image(
    String camera,
    UserModel user,
  ) async {
    if (camera == "camera") {
      userImage = await imagePicker.pickImage(source: ImageSource.camera);
      emit(PicImageSuccessState());
      await firebaseStorage
          .ref()
          .child("images/")
          .child("${user.id}.jpg")
          .putFile(File(userImage!.path));
      emit(PicImageSuccessStorageState());
      firebaseStorage
          .ref()
          .child("images/")
          .child("${user.id}.jpg")
          .getDownloadURL()
          .then((value) {
        firebaseFirestore
            .collection('user')
            .doc(user.id)
            .update({"photoUrl": value});
        firebaseFirestore.collection('user').doc(user.id).get().then((value) {
          registerUser = UserModel.fromJson(json: (value.data()) as Map<String, dynamic>);
          CacheHelper.put(key: 'photoUrl', value: registerUser.photoUrl);
          emit(PicImageSuccessDownloadStorageState());
        });
        //CacheHelper.put(key: 'photoUrl', value: user.photoUrl);

      }).catchError((onError) {
        throw (onError);
      });
      // firebaseStorage
      //     .ref()
      //     .child("images/")
      //     .child("${user.id}.jpg")
      //     .getDownloadURL()
      //     .then((value) {
      //       user.photoUrl=value;
      //   firebaseFirestore.collection('user').doc(user.id).set(user.toJson());
      //   photoUrl = value;
      //   emit(PicImageSuccessDownloadStorageState());
      // });

      return userImage!.readAsBytes();
    } else {
      userImage = await imagePicker.pickImage(source: ImageSource.gallery);
      await firebaseStorage
          .ref()
          .child("images/")
          .child("${user.id}.jpg")
          .putFile(File(userImage!.path));
      firebaseStorage
          .ref()
          .child("images/")
          .child("${user.id}.jpg")
          .getDownloadURL()
          .then((value) {
        firebaseFirestore
            .collection('user')
            .doc(user.id)
            .update({"photoUrl": value});
        firebaseFirestore.collection('user').doc(user.id).get().then((value) {
          registerUser = UserModel.fromJson(json: (value.data()) as Map<String, dynamic>);
          CacheHelper.put(key: 'photoUrl', value: registerUser.photoUrl);
          emit(PicImageSuccessDownloadStorageState());
        });
      }).catchError((onError) {
        throw (onError);
      });
      return userImage!.readAsBytes();
    }
  }
}
