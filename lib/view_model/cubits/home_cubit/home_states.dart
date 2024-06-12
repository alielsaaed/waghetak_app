import 'package:flutter/cupertino.dart';
import '../../../model/home_model.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<HomeModel> homeInfoList;
  HomeLoaded(this.homeInfoList);
}

class HomeError extends HomeState {
  final String message;

  HomeError(this.message);
}