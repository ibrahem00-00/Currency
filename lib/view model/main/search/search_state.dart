part of 'search_cubit.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}
class SearchLoadingState extends SearchState {}
class SearchSuccessState extends SearchState {
  SearchModel searchModel;
  SearchSuccessState({required this.searchModel });

}
class SearchErrorState extends SearchState {}
