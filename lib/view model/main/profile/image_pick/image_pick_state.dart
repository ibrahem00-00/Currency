part of 'image_pick_cubit.dart';

@immutable
abstract class ImagePickState {}

class ImagePickInitial extends ImagePickState {}
class PicImageSuccessState extends ImagePickState {}
class PicImageSuccessStorageState extends ImagePickState {}
class PicImageSuccessDownloadStorageState extends ImagePickState {}
