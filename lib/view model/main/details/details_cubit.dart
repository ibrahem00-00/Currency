import 'package:bloc/bloc.dart';
import 'package:currency/model/details_model/details_model.dart';
import 'package:flutter/material.dart';

import '../../database/remote/dio.dart';

part 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  DetailsCubit() : super(DetailsInitial());
  DetailsModel detailsModel=DetailsModel();
  Future getCoinDetails(String id)async{
    emit(DetailsLoadingState());
    CoinApi.getAllDetails(id).then((value) {
      detailsModel = DetailsModel.fromMap(value.data);
      //print(detailsModel.percentChange_24h);
      emit(DetailsSuccessState());
    }).catchError((onError){

      emit(DetailsErrorState());
    });

  }
}
