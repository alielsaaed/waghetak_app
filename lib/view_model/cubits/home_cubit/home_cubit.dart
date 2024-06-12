import 'package:flutter_bloc/flutter_bloc.dart';
import '../../services/home_api.dart';
import 'home_states.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeApi homeApi;

  HomeCubit(this.homeApi) : super(HomeLoading());

  Future<void> fetchHomeInfo() async {
    try {
      emit(HomeLoading());
      final homeInfoList = await homeApi.getHomeInfo();
      emit(HomeLoaded(homeInfoList));
    } catch (e) {
      emit(HomeError("Failed to load data: $e"));
    }
  }
}
