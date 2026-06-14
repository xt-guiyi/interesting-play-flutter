import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:interesting_play_flutter/core/theme/app_colors.dart';

class LocationPracticePage extends StatefulWidget {
  const LocationPracticePage({super.key});

  @override
  State<LocationPracticePage> createState() => _LocationPracticePageState();
}

class _LocationPracticePageState extends State<LocationPracticePage> {
  Position? _position;
  String? _message;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final position = _position;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.green_300,
        scrolledUnderElevation: 0,
        title: const Text('定位'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: _isLoading ? null : _getCurrentLocation,
              child: Text(_isLoading ? '定位中...' : '获取当前位置'),
            ),
            const SizedBox(height: 16),
            if (_message != null) Text(_message!),
            if (position != null) ...[
              Text('纬度：${position.latitude}'),
              Text('经度：${position.longitude}'),
              Text('精度：${position.accuracy.toStringAsFixed(2)} 米'),
              Text('时间：${position.timestamp}'),
            ],
          ],
        ),
      ),
    );
  }

  Future<void> _getCurrentLocation() async {
    setState(() {
      _isLoading = true;
      _message = null;
    });

    try {
      final serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        throw Exception('定位服务未开启，请先打开系统定位服务');
      }

      var permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }
      if (permission == LocationPermission.denied) {
        throw Exception('定位权限被拒绝');
      }
      if (permission == LocationPermission.deniedForever) {
        throw Exception('定位权限已永久拒绝，请到系统设置开启');
      }

      final position = await Geolocator.getCurrentPosition();
      if (!mounted) return;
      setState(() {
        _position = position;
        _message = '定位成功';
      });
    } catch (error) {
      if (!mounted) return;
      setState(() {
        _message = error.toString();
      });
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }
}
