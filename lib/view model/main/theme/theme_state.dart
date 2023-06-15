part of 'theme_cubit.dart';

@immutable
abstract class ThemeState {}

class ThemeInitial extends ThemeState {}
class saveThemeModeToSharedPrefSuccess extends ThemeState {}
class getThemeModeFromSharedPrefSuccess extends ThemeState {}
