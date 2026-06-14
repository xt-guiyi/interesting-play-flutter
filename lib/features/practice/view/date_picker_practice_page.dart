import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:interesting_play_flutter/core/theme/app_colors.dart';

class DatePickerPracticePage extends StatefulWidget {
  const DatePickerPracticePage({super.key});

  @override
  State<DatePickerPracticePage> createState() => _DatePickerPracticePageState();
}

class _DatePickerPracticePageState extends State<DatePickerPracticePage> {
  DateTime _selectedDateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.green_300,
        scrolledUnderElevation: 0,
        title: const Text('时间选择器'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              _formatDateTime(_selectedDateTime),
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () => _selectTime(context),
              child: const Text('选择时间'),
            ),
          ],
        ),
      ),
    );
  }

  void _selectTime(BuildContext context) {
    var selectedDateTime = _selectedDateTime;

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
                            '选择时间',
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
                                _selectedDateTime = selectedDateTime;
                              });
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: CupertinoDatePicker(
                        mode: CupertinoDatePickerMode.dateAndTime,
                        use24hFormat: true,
                        initialDateTime: _selectedDateTime,
                        onDateTimeChanged: (DateTime newTime) {
                          selectedDateTime = newTime;
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

  String _formatDateTime(DateTime dateTime) {
    final year = dateTime.year.toString().padLeft(4, '0');
    final month = dateTime.month.toString().padLeft(2, '0');
    final day = dateTime.day.toString().padLeft(2, '0');
    final hour = dateTime.hour.toString().padLeft(2, '0');
    final minute = dateTime.minute.toString().padLeft(2, '0');
    return '$year-$month-$day $hour:$minute';
  }
}
