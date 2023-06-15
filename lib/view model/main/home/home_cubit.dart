import 'package:bloc/bloc.dart';
import 'package:currency/model/home_model/home_model.dart';
import 'package:currency/view%20model/database/remote/dio_exception.dart';
import 'package:currency/view%20model/database/remote/doi_helper.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

import '../../../utilities/const.dart';
import '../../database/remote/dio.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
List<HomeModel> data= [];


Future getAllCoins()async{
  data.clear();
  emit(HomeLoadingState());
  CoinApi.getAllCoins().then((value) {
    emit(HomeSuccessState());

    value.forEach((element) {
      data.add(element);
    });
  }).catchError((e){
    DioException.fromDioError(e);
    emit(HomeErrorState());
  });

}


Future getCoins()async{
  emit(HomeLoadingState());
  DioHelper.getData(url:baseUrl + allCoinEndPoint ).then((value) {
    data = value.data;
  }).catchError((e){
    DioException.fromDioError(e);
    emit(HomeErrorState());
  });

}
}
