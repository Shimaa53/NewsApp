part of 'news_cubit.dart';

@immutable
abstract class NewsState {}

class NewsInitial extends NewsState {}
class ChangeBottomNavigation extends NewsState {}
class LoadingState extends NewsState {}
class GetBusinessDataSuccess extends NewsState {}
class GetBusinessDataError extends NewsState {}
class GetSportsDataSuccess extends NewsState {}
class GetSportsDataError extends NewsState {}
class GetScienceDataSuccess extends NewsState {}
class GetScienceDataError extends NewsState {}
class ChangeTheme extends NewsState {}
class GetTheme extends NewsState {}
class GetSearchDataSuccess extends NewsState {}
class GetSearchDataError extends NewsState {}


