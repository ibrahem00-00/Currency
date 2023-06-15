import 'package:cached_network_image/cached_network_image.dart';
import 'package:currency/utilities/app_colors.dart';
import 'package:currency/view%20model/auth/login/login_cubit.dart';
import 'package:currency/view%20model/auth/sign_out/sign_out_cubit.dart';
import 'package:currency/view%20model/main/profile/image_pick/image_pick_cubit.dart';
import 'package:currency/view%20model/main/theme/theme_cubit.dart';
import 'package:currency/view/widgets/default_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../utilities/app_string.dart';
import '../../utilities/themes.dart';
import '../../view model/database/local/cache_helper.dart';
import '../widgets/custom_profile_button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignOutCubit, SignOutState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: SingleChildScrollView(
              child: BlocConsumer<ImagePickCubit, ImagePickState>(
                listener: (context, state) {},
                builder: (context, state) {
                  return BlocConsumer<LoginCubit, LoginState>(
                    listener: (context, state) {
                      // TODO: implement listener
                    },
                    builder: (context, state) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ClipOval(
                            child: SizedBox.fromSize(
                              size: const Size.fromRadius(100), // Image radius
                              child: CacheHelper.get(
                                          key: AppStrings.photoUrl) ==
                                      'null'
                                  ? CircleAvatar(
                                      radius: 70,
                                      backgroundColor: Colors.grey[300],
                                      child: Icon(
                                        Icons.person,
                                        size: 40.sp,
                                        color: Colors.grey,
                                      ))
                                  : CachedNetworkImage(
                                      placeholder: (context, url) =>
                                          CircleAvatar(
                                              radius: 70,
                                              backgroundColor: Colors.grey[300],
                                              child: const Center(
                                                  child:
                                                      CircularProgressIndicator(
                                                color: AppColors.primaryColor,
                                              ))),
                                      imageUrl: CacheHelper.get(
                                          key: AppStrings.photoUrl),
                                      fit: BoxFit.cover),
                            ),
                          ),
                          DefaultText(
                            text: CacheHelper.get(key: AppStrings.name),
                            fontWeight: FontWeight.w600,
                            fontSize: 25,
                          ),
                          DefaultText(
                            text: CacheHelper.get(key: AppStrings.email),
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomProfileButton(
                                padding: const EdgeInsets.only(left: 10),
                                height: 5.h,
                                width: 45.w,
                                text: AppStrings.formGallery,
                                iconData: Icons.image,
                                radius: 5,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                //iconSize: 30,
                                color: AppColors.secondaryColor,
                                iconColor: Colors.white,
                                onTap: () {
                                  context.read<ImagePickCubit>().image(
                                      AppStrings.gallery,
                                      context.read<LoginCubit>().registerUser);
                                },
                              ),
                              SizedBox(
                                width: 3.w,
                              ),
                              CustomProfileButton(
                                padding: const EdgeInsets.only(left: 10),
                                height: 5.h,
                                width: 45.w,
                                text: AppStrings.addPhoto,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                iconData: Icons.camera_alt,
                                radius: 5,
                                // iconSize: 30,
                                color: AppColors.secondaryColor,
                                iconColor: Colors.white,
                                onTap: () {
                                  context.read<ImagePickCubit>().image(
                                      AppStrings.camera,
                                      context.read<LoginCubit>().registerUser);
                                },
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          BlocConsumer<ThemeCubit, ThemeState>(
                            listener: (context, state) {
                              // TODO: implement listener
                            },
                            builder: (context, state) {
                              return CustomProfileButton(
                                padding: const EdgeInsets.only(left: 10),
                                mainAxisAlignment: MainAxisAlignment.start,
                                height: 5.h,
                                width: 90.w,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                text: AppStrings.changeTheme,
                                radius: 5,
                                iconSize: 30,
                                color: AppColors.secondaryColor,
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                            backgroundColor:
                                                Themes.isDarkMode(context)
                                                    ? Color(0xff151f2c)
                                                    : Colors.blueGrey,
                                            title: Text(
                                              "Change Theme",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            actions: [
                                              Column(
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 10, right: 10),
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 45,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5)),
                                                      child: ElevatedButton(
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                                primary: Colors
                                                                    .white),
                                                        onPressed: () {
                                                          context.read<ThemeCubit>().saveThemeModeToSharedPref(ThemeMode
                                                              .system);
                                                          // Provider.of<ThemeProvider>(
                                                          //         context,
                                                          //         listen: false)
                                                          //     .saveThemeModeToSharedPref(
                                                          //         ThemeMode
                                                          //             .system);
                                                          // Get.back();
                                                        },
                                                        child: Text(
                                                          'System',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 20),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            .02,
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 10, right: 10),
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 45,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5)),
                                                      child: ElevatedButton(
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                                primary: Colors
                                                                    .white),
                                                        onPressed: () {
                                                          context.read<ThemeCubit>().saveThemeModeToSharedPref(ThemeMode.light);
                                                          // Provider.of<ThemeProvider>(
                                                          //         context,
                                                          //         listen: false)
                                                          //     .saveThemeModeToSharedPref(
                                                          //         ThemeMode
                                                          //             .light);
                                                          // Get.back();
                                                        },
                                                        child: Text(
                                                          'Light',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 20),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            .02,
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 10, right: 10),
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 45,
                                                      decoration: BoxDecoration(
                                                          color: Colors.black,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5)),
                                                      child: ElevatedButton(
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                                primary: Colors
                                                                    .black),
                                                        onPressed: () {
                                                          context.read<ThemeCubit>().saveThemeModeToSharedPref(ThemeMode.dark);
                                                          // Provider.of<ThemeProvider>(
                                                          //         context,
                                                          //         listen: false)
                                                          //     .saveThemeModeToSharedPref(
                                                          //         ThemeMode
                                                          //             .dark);
                                                          // Get.back();
                                                        },
                                                        child: Text(
                                                          'Dark',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 20),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ));
                                  showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                            backgroundColor:
                                                Themes.isDarkMode(context)
                                                    ? Color(0xff151f2c)
                                                    : Colors.blueGrey,
                                            title: Text(
                                              "Change Theme",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            actions: [
                                              Column(
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 10, right: 10),
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 45,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5)),
                                                      child: ElevatedButton(
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                                primary: Colors
                                                                    .white),
                                                        onPressed: () {
                                                          context.read<ThemeCubit>().saveThemeModeToSharedPref(ThemeMode.system);
                                                          // Provider.of<ThemeProvider>(
                                                          //         context,
                                                          //         listen: false)
                                                          //     .saveThemeModeToSharedPref(
                                                          //         ThemeMode
                                                          //             .system);
                                                          // Get.back();
                                                        },
                                                        child: Text(
                                                          'System',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 20),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            .02,
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 10, right: 10),
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 45,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5)),
                                                      child: ElevatedButton(
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                                primary: Colors
                                                                    .white),
                                                        onPressed: () {
                                                          context.read<ThemeCubit>().saveThemeModeToSharedPref(ThemeMode.light);
                                                          // Provider.of<ThemeProvider>(
                                                          //         context,
                                                          //         listen: false)
                                                          //     .saveThemeModeToSharedPref(
                                                          //         ThemeMode
                                                          //             .light);
                                                        },
                                                        child: Text(
                                                          'Light',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 20),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            .02,
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 10, right: 10),
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 45,
                                                      decoration: BoxDecoration(
                                                          color: Colors.black,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5)),
                                                      child: ElevatedButton(
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                                primary: Colors
                                                                    .black),
                                                        onPressed: () {

                                                          // Provider.of<ThemeProvider>(
                                                          //         context,
                                                          //         listen: false)
                                                          //     .saveThemeModeToSharedPref(
                                                          //         ThemeMode
                                                          //             .dark);
                                                        },
                                                        child: Text(
                                                          'Dark',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 20),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ));
                                },
                              );
                            },
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          CustomProfileButton(
                            padding: const EdgeInsets.only(left: 10),
                            mainAxisAlignment: MainAxisAlignment.start,
                            height: 5.h,
                            width: 90.w,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            text: AppStrings.changeLanguage,
                            radius: 5,
                            iconSize: 30,
                            color: AppColors.secondaryColor,
                            onTap: () {},
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          CustomProfileButton(
                            padding: const EdgeInsets.only(left: 10),
                            mainAxisAlignment: MainAxisAlignment.start,
                            height: 5.h,
                            width: 90.w,
                            fontSize: 14.sp,
                            iconData: Icons.logout,
                            iconColor: Colors.white,
                            fontWeight: FontWeight.w600,
                            text: AppStrings.logOut,
                            radius: 5,
                            color: AppColors.secondaryColor,
                            onTap: () {
                              showAnimatedDialog(
                                alignment: Alignment.center,
                                context: context,
                                barrierDismissible: true,
                                builder: (BuildContext context) {
                                  return ClassicGeneralDialogWidget(
                                    actions: [
                                      ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text(AppStrings.cancel)),
                                      ElevatedButton(
                                          onPressed: () async {
                                            context
                                                .read<SignOutCubit>()
                                                .signOut(context);
                                          },
                                          child: const Text(AppStrings.sure)),
                                    ],
                                    negativeText: AppStrings.cancel,
                                    positiveText: AppStrings.sure,
                                    titleText: AppStrings.logOut,
                                    contentText: AppStrings.areYouSure,
                                  );
                                },
                                animationType: DialogTransitionType.scale,
                                curve: Curves.fastOutSlowIn,
                                duration: const Duration(milliseconds: 350),
                              );
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
