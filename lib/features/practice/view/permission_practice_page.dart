import 'package:flutter/material.dart';
import 'package:interesting_play_flutter/core/theme/app_colors.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionPracticePage extends StatefulWidget {
  const PermissionPracticePage({super.key});

  @override
  State<PermissionPracticePage> createState() => _PermissionPracticePageState();
}

class _PermissionPracticePageState extends State<PermissionPracticePage> {
  final _permissions = const [
    _PermissionItem(title: '相机权限', permission: Permission.camera),
    _PermissionItem(title: '相册权限', permission: Permission.photos),
    _PermissionItem(title: '定位权限', permission: Permission.locationWhenInUse),
    _PermissionItem(title: '通知权限', permission: Permission.notification),
  ];

  Map<Permission, PermissionStatus> _statuses = {};

  @override
  void initState() {
    super.initState();
    _loadStatuses();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.green_300,
        scrolledUnderElevation: 0,
        title: const Text('权限管理'),
        centerTitle: true,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: _permissions.length + 1,
        separatorBuilder: (_, _) => const Divider(height: 1),
        itemBuilder: (context, index) {
          if (index == _permissions.length) {
            return Padding(
              padding: const EdgeInsets.only(top: 16),
              child: OutlinedButton(
                onPressed: openAppSettings,
                child: const Text('打开系统设置'),
              ),
            );
          }

          final item = _permissions[index];
          final status = _statuses[item.permission];
          return ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(item.title),
            subtitle: Text(_statusText(status)),
            trailing: ElevatedButton(
              onPressed: () => _requestPermission(item.permission),
              child: const Text('申请'),
            ),
          );
        },
      ),
    );
  }

  Future<void> _loadStatuses() async {
    final entries = await Future.wait(
      _permissions.map((item) async {
        return MapEntry(item.permission, await item.permission.status);
      }),
    );
    if (!mounted) return;
    setState(() {
      _statuses = Map.fromEntries(entries);
    });
  }

  Future<void> _requestPermission(Permission permission) async {
    final status = await permission.request();
    if (!mounted) return;
    setState(() {
      _statuses = {..._statuses, permission: status};
    });
  }

  String _statusText(PermissionStatus? status) {
    return switch (status) {
      null => '读取中',
      PermissionStatus.granted => '已允许',
      PermissionStatus.denied => '已拒绝，可再次申请',
      PermissionStatus.permanentlyDenied => '永久拒绝，需要去系统设置开启',
      PermissionStatus.restricted => '受系统限制',
      PermissionStatus.limited => '部分允许',
      PermissionStatus.provisional => '临时允许',
    };
  }
}

class _PermissionItem {
  const _PermissionItem({required this.title, required this.permission});

  final String title;
  final Permission permission;
}
