import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:interesting_play_flutter/core/theme/app_colors.dart';

class RegionPickerPracticePage extends StatefulWidget {
  const RegionPickerPracticePage({super.key});

  @override
  State<RegionPickerPracticePage> createState() =>
      _RegionPickerPracticePageState();
}

class _RegionPickerPracticePageState extends State<RegionPickerPracticePage> {
  static const _regions = <String, Map<String, List<String>>>{
    '北京市': {
      '北京市': ['东城区', '西城区', '朝阳区', '海淀区', '丰台区', '石景山区', '通州区', '昌平区'],
    },
    '上海市': {
      '上海市': ['黄浦区', '徐汇区', '长宁区', '静安区', '普陀区', '虹口区', '杨浦区', '浦东新区'],
    },
    '广东省': {
      '广州市': ['天河区', '越秀区', '海珠区', '荔湾区', '白云区', '黄埔区', '番禺区', '花都区'],
      '深圳市': ['南山区', '福田区', '宝安区', '罗湖区', '龙华区', '龙岗区', '坪山区', '光明区'],
      '东莞市': ['莞城区', '南城区', '东城区', '万江区', '长安镇', '虎门镇', '塘厦镇', '凤岗镇'],
    },
    '浙江省': {
      '杭州市': ['西湖区', '上城区', '滨江区', '余杭区', '萧山区', '拱墅区', '钱塘区', '临安区'],
      '宁波市': ['海曙区', '鄞州区', '江北区', '镇海区', '北仑区', '奉化区', '余姚市', '慈溪市'],
      '温州市': ['鹿城区', '龙湾区', '瓯海区', '洞头区', '永嘉县', '平阳县', '苍南县', '文成县'],
    },
    '江苏省': {
      '南京市': ['玄武区', '秦淮区', '建邺区', '鼓楼区', '浦口区', '栖霞区', '雨花台区', '江宁区'],
      '苏州市': ['姑苏区', '虎丘区', '吴中区', '相城区', '吴江区', '昆山市', '太仓市', '常熟市'],
    },
    '四川省': {
      '成都市': ['锦江区', '青羊区', '金牛区', '武侯区', '成华区', '龙泉驿区', '青白江区', '高新区'],
      '绵阳市': ['涪城区', '游仙区', '安州区', '江油市', '梓潼县', '北川县', '平武县', '盐亭县'],
    },
    '湖北省': {
      '武汉市': ['江岸区', '江汉区', '硚口区', '汉阳区', '武昌区', '青山区', '洪山区', '东西湖区'],
      '宜昌市': ['西陵区', '伍家岗区', '点军区', '猇亭区', '夷陵区', '秭归县', '长阳县', '五峰县'],
    },
  };

  String _province = '广东省';
  String _city = '广州市';
  String _district = '天河区';

  // 临时选择（弹窗内部）
  late String _tempProvince;
  late String _tempCity;
  late String _tempDistrict;

  late FixedExtentScrollController _provinceController;
  late FixedExtentScrollController _cityController;
  late FixedExtentScrollController _districtController;

  List<String> get _provinces => _regions.keys.toList();

  List<String> _getCities(String province) =>
      (_regions[province]?.keys.toList()) ?? [];

  List<String> _getDistricts(String province, String city) =>
      (_regions[province]?[city]) ?? [];

  void _showRegionPicker() {
    _tempProvince = _province;
    _tempCity = _city;
    _tempDistrict = _district;

    final provinces = _provinces;
    final provinceIdx = provinces.indexOf(_tempProvince).clamp(0, provinces.length - 1);
    final cities = _getCities(_tempProvince);
    final cityIdx = cities.indexOf(_tempCity).clamp(0, cities.length - 1);
    final districts = _getDistricts(_tempProvince, _tempCity);
    final districtIdx = districts.indexOf(_tempDistrict).clamp(0, districts.length - 1);

    _provinceController = FixedExtentScrollController(initialItem: provinceIdx);
    _cityController = FixedExtentScrollController(initialItem: cityIdx);
    _districtController = FixedExtentScrollController(initialItem: districtIdx);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => _RegionPickerSheet(
        regions: _regions,
        initProvince: _tempProvince,
        initCity: _tempCity,
        initDistrict: _tempDistrict,
        provinceController: _provinceController,
        cityController: _cityController,
        districtController: _districtController,
        onConfirm: (province, city, district) {
          setState(() {
            _province = province;
            _city = city;
            _district = district;
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      appBar: AppBar(
        backgroundColor: AppColors.green_300,
        scrolledUnderElevation: 0,
        title: const Text('省市区选择器'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16),
            // 已选地址卡片
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          color: AppColors.green_300.withOpacity(0.12),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(
                          Icons.location_on_rounded,
                          color: AppColors.green_300,
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Text(
                        '当前选择地区',
                        style: TextStyle(
                          fontSize: 13,
                          color: Color(0xFF8A9099),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    '$_province',
                    style: const TextStyle(
                      fontSize: 13,
                      color: Color(0xFF8A9099),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '$_city $_district',
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF1A1D1E),
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            // 选择按钮
            GestureDetector(
              onTap: _showRegionPicker,
              child: Container(
                height: 56,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [AppColors.green_300, Color(0xFF00C87A)],
                  ),
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.green_300.withOpacity(0.35),
                      blurRadius: 16,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.edit_location_alt_rounded, color: Colors.white, size: 20),
                    SizedBox(width: 8),
                    Text(
                      '选择省市区',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── 底部弹窗选择器 ────────────────────────────────────────────────────────────

class _RegionPickerSheet extends StatefulWidget {
  const _RegionPickerSheet({
    required this.regions,
    required this.initProvince,
    required this.initCity,
    required this.initDistrict,
    required this.provinceController,
    required this.cityController,
    required this.districtController,
    required this.onConfirm,
  });

  final Map<String, Map<String, List<String>>> regions;
  final String initProvince;
  final String initCity;
  final String initDistrict;
  final FixedExtentScrollController provinceController;
  final FixedExtentScrollController cityController;
  final FixedExtentScrollController districtController;
  final void Function(String province, String city, String district) onConfirm;

  @override
  State<_RegionPickerSheet> createState() => _RegionPickerSheetState();
}

class _RegionPickerSheetState extends State<_RegionPickerSheet> {
  late String _province;
  late String _city;
  late String _district;

  List<String> get _provinces => widget.regions.keys.toList();
  List<String> get _cities => widget.regions[_province]?.keys.toList() ?? [];
  List<String> get _districts => widget.regions[_province]?[_city] ?? [];

  @override
  void initState() {
    super.initState();
    _province = widget.initProvince;
    _city = widget.initCity;
    _district = widget.initDistrict;
  }

  void _onProvinceChanged(int index) {
    final newProvince = _provinces[index];
    final newCities = widget.regions[newProvince]?.keys.toList() ?? [];
    final newCity = newCities.isNotEmpty ? newCities.first : '';
    final newDistricts = widget.regions[newProvince]?[newCity] ?? [];
    final newDistrict = newDistricts.isNotEmpty ? newDistricts.first : '';

    setState(() {
      _province = newProvince;
      _city = newCity;
      _district = newDistrict;
    });

    // 重置城市和区县滚动到顶部
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.cityController.jumpToItem(0);
      widget.districtController.jumpToItem(0);
    });
  }

  void _onCityChanged(int index) {
    if (index >= _cities.length) return;
    final newCity = _cities[index];
    final newDistricts = widget.regions[_province]?[newCity] ?? [];
    final newDistrict = newDistricts.isNotEmpty ? newDistricts.first : '';

    setState(() {
      _city = newCity;
      _district = newDistrict;
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.districtController.jumpToItem(0);
    });
  }

  void _onDistrictChanged(int index) {
    if (index >= _districts.length) return;
    setState(() {
      _district = _districts[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // 顶部把手
          const SizedBox(height: 12),
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: const Color(0xFFE0E0E0),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          // 标题栏
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  style: TextButton.styleFrom(
                    foregroundColor: const Color(0xFF8A9099),
                    padding: EdgeInsets.zero,
                  ),
                  child: const Text(
                    '取消',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                const Text(
                  '选择省市区',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1A1D1E),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    widget.onConfirm(_province, _city, _district);
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: AppColors.green_300,
                    padding: EdgeInsets.zero,
                  ),
                  child: const Text(
                    '确定',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // 列头标签
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
            child: Row(
              children: [
                _columnLabel('省份', flex: 3),
                _columnLabel('城市', flex: 3),
                _columnLabel('区县', flex: 3),
              ],
            ),
          ),
          const SizedBox(height: 4),
          // 三列滚轮
          SizedBox(
            height: 220,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // 选中高亮条
                Positioned(
                  left: 16,
                  right: 16,
                  child: Container(
                    height: 44,
                    decoration: BoxDecoration(
                      color: AppColors.green_300.withOpacity(0.08),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                Row(
                  children: [
                    _buildWheel(
                      flex: 3,
                      items: _provinces,
                      controller: widget.provinceController,
                      onChanged: _onProvinceChanged,
                    ),
                    _buildDivider(),
                    _buildWheel(
                      flex: 3,
                      items: _cities,
                      controller: widget.cityController,
                      onChanged: _onCityChanged,
                    ),
                    _buildDivider(),
                    _buildWheel(
                      flex: 3,
                      items: _districts,
                      controller: widget.districtController,
                      onChanged: _onDistrictChanged,
                    ),
                  ],
                ),
              ],
            ),
          ),
          // 已选摘要
          Container(
            margin: const EdgeInsets.fromLTRB(16, 8, 16, 0),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: const Color(0xFFF5F6FA),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                const Icon(Icons.location_on_rounded,
                    color: AppColors.green_300, size: 16),
                const SizedBox(width: 6),
                Text(
                  '$_province · $_city · $_district',
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xFF677671),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).padding.bottom + 16),
        ],
      ),
    );
  }

  Widget _columnLabel(String text, {required int flex}) {
    return Expanded(
      flex: flex,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 12,
          color: Color(0xFFAEAEAE),
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      width: 1,
      height: 120,
      color: const Color(0xFFF0F0F0),
    );
  }

  Widget _buildWheel({
    required int flex,
    required List<String> items,
    required FixedExtentScrollController controller,
    required ValueChanged<int> onChanged,
  }) {
    return Expanded(
      flex: flex,
      child: CupertinoPicker.builder(
        scrollController: controller,
        itemExtent: 44,
        onSelectedItemChanged: onChanged,
        selectionOverlay: const SizedBox.shrink(),
        childCount: items.length,
        itemBuilder: (context, index) {
          if (index >= items.length) return null;
          return Center(
            child: Text(
              items[index],
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 15,
                color: Color(0xFF1A1D1E),
                fontWeight: FontWeight.w500,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          );
        },
      ),
    );
  }
}
