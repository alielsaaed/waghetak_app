import 'package:flutter/material.dart';
import 'package:waghetak_app/common%20compounents/main_button.dart';

import '../../common compounents/custom_textformfield.dart';
import '../../constants/constants.dart';

class EditAccount extends StatefulWidget {
  static const String id = 'edit account screen';

  const EditAccount({super.key});

  @override
  State<EditAccount> createState() => _EditAccountState();
}

class _EditAccountState extends State<EditAccount> {
  TextEditingController firstName = TextEditingController();
  TextEditingController secondName = TextEditingController();
  TextEditingController dateController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text("تعديل الحساب"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: constVerticalPadding),
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 50,
                    child: Image.asset(
                      "$imagePath/Profile-Male-PNG.png",
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: Image.asset(
                      "assets/icons/edit_icon.png",
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: constVerticalPadding * 2),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("الاسم الأول"),
                Text("اسم العائلة"),
              ],
            ),
            SizedBox(height: constVerticalPadding),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: mediaQuery.width * 0.42,
                  child: TextFormFieldCustom(
                    hintText: "أحمد",
                    context: context,
                    controller: firstName,
                    onChanged: (p0) {
                      
                    },
                  ),
                ),
                SizedBox(
                  width: mediaQuery.width * 0.42,
                  child: TextFormFieldCustom(
                    hintText: "محمود",
                    context: context,
                    controller: secondName,
                    onChanged: (p0) {}
                  ),
                ),
              ],
            ),
            SizedBox(height: constVerticalPadding),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text("الجنس"),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  filled: true,
                  contentPadding: const EdgeInsets.all(15),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide.none,
                  ),
                ),
                value: "ذكر",
                items: [
                  'ذكر',
                  'أنثى',
                ]
                    .map((label) => DropdownMenuItem(
                          value: label,
                          child: Text(label),
                        ))
                    .toList(),
                onChanged: (value) {},
              ),
            ),
            SizedBox(height: constVerticalPadding),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text("تاريخ الميلاد (اختياري)"),
            ),
            SizedBox(height: constVerticalPadding),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                readOnly: true,
                controller: dateController,
                onTap: () {
                  showCalender(context);
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none),
                  contentPadding: const EdgeInsets.all(15),
                  hintText: "1999-08-12",
                  filled: true,
                  suffixIcon: const Icon(Icons.calendar_month),
                ),
              ),
            ),
            SizedBox(height: constVerticalPadding * 7.5),
            MainButton(
              text: "حفظ التعديلات",
              backGroundColor: primaryColor,
              textColor: Colors.white,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  void showCalender(BuildContext context) async {
    var dateSelected = await showDatePicker(
      context: context,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (dateSelected == null) return;
    selectedDate = dateSelected;
    dateController.text =
        '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}';
    setState(() {});
  }
}
