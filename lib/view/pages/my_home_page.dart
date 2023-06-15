import 'package:currency/model/home_model/home_model.dart';
import 'package:currency/utilities/app_colors.dart';
import 'package:currency/utilities/app_string.dart';
import 'package:currency/utilities/routes.dart';
import 'package:currency/view%20model/main/home/home_cubit.dart';
import 'package:currency/view/pages/details_screen.dart';
import 'package:currency/view/widgets/default_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../widgets/custom_home_item.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  HomeModel homeModel = HomeModel();

  @override
  void initState() {
    context.read<HomeCubit>().getAllCoins();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const DefaultText(
            text: AppStrings.cryptoCurrency,
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 20),
      ),
      body: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          // if(state is HomeLoadingState){
          //   return CircularProgressIndicator(color: AppColors.primaryColor,);
          //
          // }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsScreen(
                                id: context.read<HomeCubit>().data[index].id),
                          ));
                    },
                    child: CustomHomeItem(
                      marketCapRank: context
                          .read<HomeCubit>()
                          .data[index]
                          .marketCapRank
                          .toString(),
                      name:
                          context.read<HomeCubit>().data[index].name.toString(),
                      symbol: context
                          .read<HomeCubit>()
                          .data[index]
                          .symbol
                          .toString(),
                      priceChangePercentage: context
                          .read<HomeCubit>()
                          .data[index]
                          .priceChangePercentage
                          .toString(),
                      marketCap: context
                          .read<HomeCubit>()
                          .data[index]
                          .marketCapRank
                          .toString(),
                      currentPrice: context
                          .read<HomeCubit>()
                          .data[index]
                          .price
                          .toString(),
                      src: context
                          .read<HomeCubit>()
                          .data[index]
                          .imageUrl
                          .toString(),
                    ),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(
                      height: 3.h,
                    ),
                itemCount: context.read<HomeCubit>().data.length),
          );
        },
      ),
    );
  }
}
