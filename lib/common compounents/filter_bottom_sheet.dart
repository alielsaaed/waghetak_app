import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  _FilterBottomSheetState createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  String? _selectedLocation;
  String? _selectedDestination;
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  RangeValues _costRange = const RangeValues(4500, 9000);
  bool _sortByCheapest = true;

  final List<String> _locations = ['Location 1', 'Location 2', 'Location 3'];
  final List<String> _destinations = [
    'Destination 1',
    'Destination 2',
    'Destination 3'
  ];

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

  void _selectTime(BuildContext context) async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'الفلترة',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 16),
            _buildDropdown('من', _locations, _selectedLocation,
                (String? newValue) {
              setState(() {
                _selectedLocation = newValue;
              });
            }),
            const SizedBox(height: 16),
            _buildDropdown('إلى', _destinations, _selectedDestination,
                (String? newValue) {
              setState(() {
                _selectedDestination = newValue;
              });
            }),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _buildDateTimePicker(
                    context,
                    'التاريخ',
                    _selectedDate == null
                        ? 'ادخل التاريخ هنا'
                        : DateFormat.yMd().format(_selectedDate!),
                    () => _selectDate(context),
                    Icons.calendar_today,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildDateTimePicker(
                    context,
                    'التوقيت',
                    _selectedTime == null
                        ? 'ادخل التوقيت هنا'
                        : _selectedTime!.format(context),
                    () => _selectTime(context),
                    Icons.access_time,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text('التكلفة'),
            RangeSlider(
              values: _costRange,
              min: 0,
              max: 10000,
              divisions: 100,
              labels: RangeLabels(
                _costRange.start.round().toString(),
                _costRange.end.round().toString(),
              ),
              onChanged: (RangeValues values) {
                setState(() {
                  _costRange = values;
                });
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('${_costRange.start.round()} ريال'),
                Text('${_costRange.end.round()} ريال'),
              ],
            ),
            const SizedBox(height: 16),
            Text('ترتيب حسب'),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ChoiceChip(
                  label: Text('من الأغلى إلى الأرخص'),
                  selected: !_sortByCheapest,
                  onSelected: (bool selected) {
                    setState(() {
                      _sortByCheapest = !selected;
                    });
                  },
                ),
                const SizedBox(width: 8),
                ChoiceChip(
                  label: Text('من الأرخص إلى الأغلى'),
                  selected: _sortByCheapest,
                  onSelected: (bool selected) {
                    setState(() {
                      _sortByCheapest = selected;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Apply filter logic here
              },
              child: Text('تطبيق'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdown(String label, List<String> items, String? selectedValue,
      ValueChanged<String?> onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          value: selectedValue,
          hint: Text('اختر $label'),
          onChanged: onChanged,
          items: items.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ],
    );
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

void showFilterBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (context) {
      return FilterBottomSheet();
    },
  );
}
