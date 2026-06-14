import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:interesting_play_flutter/core/theme/app_colors.dart';

class YearMonthDayPickerPracticePage extends StatefulWidget {
  const YearMonthDayPickerPracticePage({super.key});

  @override
  State<YearMonthDayPickerPracticePage> createState() =>
      _YearMonthDayPickerPracticePageState();
}

class _YearMonthDayPickerPracticePageState
    extends State<YearMonthDayPickerPracticePage> {
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.green_300,
        scrolledUnderElevation: 0,
        title: const Text('年月日选择器'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              _formatDate(_selectedDate),
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () => _selectDate(context),
              child: const Text('选择年月日'),
            ),
          ],
        ),
      ),
    );
  }

  void _selectDate(BuildContext context) {
    var selectedDate = _selectedDate;

    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) {
        return Localizations.override(
          context: context,
          locale: const Locale('zh', 'CN'),
          child: ColoredBox(
            color: Colors.white,
            child: SafeArea(
              top: false,
              child: SizedBox(
                height: 320,
                width: double.infinity,
                child: Column(
                  children: [
                    SizedBox(
                      height: 48,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CupertinoButton(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: const Text('取消'),
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                          const Text(
                            '选择年月日',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                              decoration: TextDecoration.none,
                            ),
                          ),
                          CupertinoButton(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: const Text('确定'),
                            onPressed: () {
                              setState(() {
                                _selectedDate = selectedDate;
                              });
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: CupertinoDatePicker(
                        mode: CupertinoDatePickerMode.date,
                        dateOrder: DatePickerDateOrder.ymd,
                        initialDateTime: _selectedDate,
                        onDateTimeChanged: (DateTime newDate) {
                          selectedDate = newDate;
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  String _formatDate(DateTime dateTime) {
    final year = dateTime.year.toString().padLeft(4, '0');
    final month = dateTime.month.toString().padLeft(2, '0');
    final day = dateTime.day.toString().padLeft(2, '0');
    return '$year-$month-$day';
  }
}
