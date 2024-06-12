import '../../../model/booking_model.dart';

abstract class BookingInfoState {}

class BookingInfoInitial extends BookingInfoState {}

class BookingInfoLoading extends BookingInfoState {}

class BookingInfoLoaded extends BookingInfoState {
  final List<BookingModel> bookingInfoList;

  BookingInfoLoaded(this.bookingInfoList);
}

class BookingInfoError extends BookingInfoState {
  final String message;

  BookingInfoError(this.message);
}
