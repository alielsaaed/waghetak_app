import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:waghetak_app/common%20compounents/main_button.dart';
import 'package:waghetak_app/constants/constants.dart';
import 'package:waghetak_app/view/core/payments_screen.dart';
import 'package:waghetak_app/view_model/cubits/booking_cubit/booking_cubit.dart';
import 'package:waghetak_app/view_model/cubits/booking_cubit/booking_states.dart';

class BookingInformationScreen extends StatefulWidget {
  static String id = "BookingInformationScreen";
  const BookingInformationScreen({super.key});

  @override
  State<BookingInformationScreen> createState() =>
      _BookingInformationScreenState();
}

class _BookingInformationScreenState extends State<BookingInformationScreen> {
  DateRangePickerController? controller = DateRangePickerController();
  String selectedDate = "";
  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    context.read<BookingInfoCubit>().fetchBookingInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
      ),
      body: BlocBuilder<BookingInfoCubit, BookingInfoState>(
        builder: (context, state) {
          if (state is BookingInfoLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is BookingInfoError) {
            return Center(child: Text('Error: ${state.message}'));
          } else if (state is BookingInfoLoaded) {
            final bookingInfo = state.bookingInfoList.first;

            return SafeArea(
              child: Padding(
                padding: EdgeInsets.all(16.0.sp),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'معلومات الحجز',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      SizedBox(height: constVerticalPadding),
                      Text(
                        'نطلب منك إكمال جميع التفاصيل أدناه لإتمام الحجز',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      SizedBox(height: constVerticalPadding),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'رقم جواز السفر',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                      ),
                      SizedBox(height: constVerticalPadding),
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          labelText: 'الدولة',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        items: ['الدولة 1', 'الدولة 2', 'الدولة 3']
                            .map((label) => DropdownMenuItem(
                          value: bookingInfo.country,
                          child: Text(label),
                        ))
                            .toList(),
                        onChanged: (value) {},
                      ),
                      SizedBox(height: constVerticalPadding),
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          labelText: 'الجنسية',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        items: ['الجنسية 1', 'الجنسية 2', 'الجنسية 3']
                            .map((label) => DropdownMenuItem(
                          value: bookingInfo.nationality,
                          child: Text(label),
                        ))
                            .toList(),
                        onChanged: (value) {},
                      ),
                      SizedBox(height: constVerticalPadding),
                      Text(
                        'صور التأشيرة ',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      SizedBox(height: constVerticalPadding),
                      GestureDetector(
                        onTap: () {
                          // Add image upload logic
                        },
                        child: Image.asset("$imagePath/upload-image.png"),
                      ),
                      SizedBox(height: constVerticalPadding),
                      Text(
                        'صور جواز السفر ',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      SizedBox(height: constVerticalPadding),
                      GestureDetector(
                        onTap: () {
                          // Add image upload logic
                        },
                        child: Image.asset("$imagePath/upload-image.png"),
                      ),
                      SizedBox(height: constVerticalPadding),
                      GestureDetector(
                        onTap: () {
                          _buildDateTimePicker(
                            context,
                            'التاريخ',
                            _selectedDate == null
                                ? 'ادخل التاريخ هنا'
                                : DateFormat.yMd().format(_selectedDate!),
                                () => _selectDate(context),
                            Icons.calendar_today,
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.all(0),
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: ListTile(
                            title: Text(
                              'تاريخ السفر',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            leading: const Icon(Icons.calendar_month),
                          ),
                        ),
                      ),
                      SizedBox(height: constVerticalPadding),
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          labelText: 'مدة الرحلة',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        items: ['7 أيام', '14 يوم', '21 يوم']
                            .map((label) => DropdownMenuItem(
                          value: "${bookingInfo.tripDuration}",
                          child: Text(label),
                        ))
                            .toList(),
                        onChanged: (value) {},
                      ),
                      SizedBox(height: constVerticalPadding),
                      MainButton(
                        text: "تاكيد",
                        backGroundColor: primaryColor,
                        onTap: () => Navigator.of(context)
                            .pushNamed(PaymentsScreen.id),
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return Center(child: Text('Unknown state'));
          }
        },
      ),
    );
  }

  void _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Widget _buildDateTimePicker(BuildContext context, String label, String value,
      VoidCallback onTap, IconData icon) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        const SizedBox(height: 8),
        InkWell(
          onTap: onTap,
          child: InputDecorator(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            ),
            child: Row(
              children: [
                Icon(icon, color: Colors.grey),
                const SizedBox(width: 8),
                Text(value, style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
