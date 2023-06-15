import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../view/pages/my_home_page.dart';
import '../../../view/pages/profile_screen.dart';
import '../../../view/pages/search_screen.dart';

part 'home_layout_state.dart';

class HomeLayoutCubit extends Cubit<HomeLayoutState> {
  HomeLayoutCubit() : super(HomeLayoutInitial());
  List nav =  [MyHomePage(), SearchScreen(), ProfileScreen()];
  int currentIndex =0;
  changeIndex(index) {
    currentIndex = index;
    emit(HomeLayoutSuccessState());
  }
}
