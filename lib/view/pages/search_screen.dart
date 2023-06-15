import 'package:currency/model/search_model/search_model.dart';
import 'package:currency/utilities/app_string.dart';
import 'package:currency/view%20model/main/search/search_cubit.dart';
import 'package:currency/view/pages/details_screen.dart';
import 'package:currency/view/widgets/default_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../utilities/app_colors.dart';
import '../widgets/custom_search_item.dart';
import '../widgets/default_text_form_field.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  var searchController = TextEditingController();

  @override
  void initState() {
    context.read<SearchCubit>().isEmpty = true;
    SearchModel.coins.clear();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchState>(
      listener: (context, state) {
        if(state is SearchErrorState){
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: DefaultText(text:'Check Your Connection',)));
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            leading: const Icon(Icons.search, color: Colors.grey),
            title: DefaultFormField(
              hintText: AppStrings.search,
              controller: searchController,
              keyboardType: TextInputType.text,
              // onFieldSubmitted: (value) {
              //   context.read<SearchCubit>().searchCoins(value);
              // },
              onChanged: (value) {
                context.read<SearchCubit>().searchCoins(value);
              },
            ),
          ),
          body: context.read<SearchCubit>().isEmpty == true
              ? const Center(
                  child: Icon(
                    Icons.currency_bitcoin_outlined,
                    size: 200,
                  ),
                )
              : state is SearchLoadingState
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      ),
                    )
                  : Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: ListView.separated(
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => DetailsScreen(
                                            id: SearchModel.coins[index].id),
                                      ));
                                },
                                child: CustomSearchItem(
                                  marketCapRank:
                                      SearchModel.coins[index].rank.toString(),
                                  src: SearchModel.coins[index].imageUrl
                                      .toString(),
                                  symbol: SearchModel.coins[index].symbol
                                      .toString(),
                                  name:
                                      SearchModel.coins[index].name.toString(),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) => SizedBox(
                                  height: 3.h,
                                ),
                            itemCount: SearchModel.coins.length),
                      ),
                    ),
        );
      },
    );
  }
}
