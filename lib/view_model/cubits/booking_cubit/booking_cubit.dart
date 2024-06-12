import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../model/booking_model.dart';
import '../../services/home_api.dart';
import 'booking_states.dart';

class BookingInfoCubit extends Cubit<BookingInfoState> {
  final HomeApi bookingApi;

  BookingInfoCubit(this.bookingApi) : super(BookingInfoInitial());

  Future<void> fetchBookingInfo() async {
    try {
      emit(BookingInfoLoading());
      final List<BookingModel> bookingInfo = await bookingApi.bookingOrder();
      emit(BookingInfoLoaded(bookingInfo));
    } catch (e) {
      emit(BookingInfoError(e.toString()));
    }
  }
}
