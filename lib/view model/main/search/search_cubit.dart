import 'package:bloc/bloc.dart';
import 'package:currency/model/search_model/search_model.dart';
import 'package:meta/meta.dart';

import '../../database/remote/dio.dart';
import '../../database/remote/doi_helper.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
  CoinApi coinApi = CoinApi();
  bool isEmpty =true;
  Future searchCoins(String searchValue)async{
    SearchModel.coins.clear();
    emit(SearchLoadingState());
    if(searchValue.isEmpty){
      isEmpty =true;
    }else{
      isEmpty =false;

    }
    coinApi.searchAllCoins(searchValue).then((value) {
      emit(SearchSuccessState(searchModel: SearchModel.fromMap(value.data)));
    }).catchError((e){
      emit(SearchErrorState());
    });

  }


}
