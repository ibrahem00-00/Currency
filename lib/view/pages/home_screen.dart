import 'package:currency/utilities/app_colors.dart';
import 'package:currency/utilities/app_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../view model/main/home_layout/home_layout_cubit.dart';
import '../widgets/custom_nav_bar_item.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeLayoutCubit, HomeLayoutState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
            body: context
                .read<HomeLayoutCubit>()
                .nav[context.read<HomeLayoutCubit>().currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              showUnselectedLabels: false,
              showSelectedLabels: false,
              onTap: (index) {
                context.read<HomeLayoutCubit>().changeIndex(index);
              },
              currentIndex: context.read<HomeLayoutCubit>().currentIndex,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home, color: AppColors.iconColor),
                    label: "",
                    activeIcon: CustomNavBarItem(
                      txt: AppStrings.home,
                    )),
                BottomNavigationBarItem(
                    icon: Icon(Icons.search, color: AppColors.iconColor),
                    label: "",
                    activeIcon: CustomNavBarItem(
                      txt: AppStrings.search,
                    )),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.person,
                      color: AppColors.iconColor,
                    ),
                    label: "",
                    activeIcon: CustomNavBarItem(txt: AppStrings.profile))
              ],
            ));
      },
    );
  }
}
