import 'package:flutter/material.dart';
import 'package:interesting_play_flutter/core/theme/app_colors.dart';

class RegionPickerPracticePage extends StatefulWidget {
  const RegionPickerPracticePage({super.key});

  @override
  State<RegionPickerPracticePage> createState() =>
      _RegionPickerPracticePageState();
}

class _RegionPickerPracticePageState extends State<RegionPickerPracticePage> {
  static const _regions = {
    '广东省': {
      '广州市': ['天河区', '越秀区', '海珠区'],
      '深圳市': ['南山区', '福田区', '宝安区'],
    },
    '浙江省': {
      '杭州市': ['西湖区', '上城区', '滨江区'],
      '宁波市': ['海曙区', '鄞州区', '江北区'],
    },
    '四川省': {
      '成都市': ['锦江区', '武侯区', '高新区'],
      '绵阳市': ['涪城区', '游仙区', '安州区'],
    },
  };

  String? _province = '广东省';
  String? _city = '广州市';
  String? _district = '天河区';

  @override
  Widget build(BuildContext context) {
    final cities = _regions[_province]?.keys.toList() ?? [];
    final districts = _regions[_province]?[_city] ?? [];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.green_300,
        scrolledUnderElevation: 0,
        title: const Text('省市区选择器'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _dropdown(
              label: '省份',
              value: _province,
              items: _regions.keys.toList(),
              onChanged: (value) {
                final nextCity = _regions[value]?.keys.first;
                setState(() {
                  _province = value;
                  _city = nextCity;
                  _district = _regions[value]?[nextCity]?.first;
                });
              },
            ),
            const SizedBox(height: 12),
            _dropdown(
              label: '城市',
              value: _city,
              items: cities,
              onChanged: (value) {
                setState(() {
                  _city = value;
                  _district = _regions[_province]?[value]?.first;
                });
              },
            ),
            const SizedBox(height: 12),
            _dropdown(
              label: '区县',
              value: _district,
              items: districts,
              onChanged: (value) {
                setState(() {
                  _district = value;
                });
              },
            ),
            const SizedBox(height: 24),
            Text(
              '当前选择：${_province ?? '-'} ${_city ?? '-'} ${_district ?? '-'}',
            ),
          ],
        ),
      ),
    );
  }

  Widget _dropdown({
    required String label,
    required String? value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return DropdownButtonFormField<String>(
      initialValue: value,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      items: items
          .map((item) => DropdownMenuItem(value: item, child: Text(item)))
          .toList(),
      onChanged: onChanged,
    );
  }
}
