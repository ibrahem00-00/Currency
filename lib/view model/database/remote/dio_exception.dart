import 'package:dio/dio.dart';

class DioException implements Exception{
  String? message;
  DioException.fromDioError(DioError dioError){

    String handleError(int? status , dynamic error){

      switch(status){
        case 400:
          return error['message'];
        case 401:
          return error['Unauthorized'];
        case 402:
          return error["forbidden"];
        case 404:
          return error["not Found"];
        default:
          return 'oops';
      }

    }
    switch(dioError.type){
      case DioErrorType.cancel:
        message = "Request to Api was canceled";
        break;
      case DioErrorType.connectTimeout:
        message = "Connection Tome Out With Api server";
        break;
      case DioErrorType.receiveTimeout:
        message = "Receive Time Out in connection";
        break;
      case DioErrorType.sendTimeout:
        message = "Send Time Out in connection";
        break;
      case DioErrorType.response:
        message = handleError(dioError.response!.statusCode,dioError.response!.data);
    }




  }

}