import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:interesting_play_flutter/core/theme/app_colors.dart';
import 'package:interesting_play_flutter/features/profile/viewmodel/profile_viewmodel.dart';
import 'package:lottie/lottie.dart';

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({super.key});

  @override
  ConsumerState<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final state = ref.read(profileViewModelProvider);
      if (state.user == null && !state.isLoading) {
        ref.read(profileViewModelProvider.notifier).loadProfile();
      }
    });
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      color: AppColors.green_300,
      child: SafeArea(
        child: Column(
          children: [
            _header(),
            Expanded(flex: 1, child: _body()),
          ],
        ),
      ),
    );
  }

  /// 头部
  Widget _header() {
    final userInfo = ref.watch(
      profileViewModelProvider.select((state) => state.user),
    );
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 344,
          padding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
          decoration: const BoxDecoration(color: AppColors.green_300),
          child: Column(
            children: [
              SizedBox(
                width: 100,
                height: 100,
                child: CircleAvatar(
                  backgroundImage: userInfo?.avatar?.isNotEmpty == true
                      ? NetworkImage(userInfo!.avatar!)
                      : null,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 2),
                child: Text(
                  userInfo?.username ?? "-",
                  style: const TextStyle(fontSize: 26, color: Colors.white),
                ),
              ),
              const Text(
                "ip地址：广东",
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
              Text(
                userInfo?.introduction ?? "-",
                style: const TextStyle(fontSize: 12, color: Colors.white),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              const Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "99",
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "关注",
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Text(
                          "26",
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "动态",
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Text(
                          "101",
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "粉丝",
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          bottom: -2,
          left: 0,
          right: 0,
          child: Lottie.asset(
            'lib/assets/lottie/wave.json',
            width: double.infinity,
            repeat: true,
            fit: BoxFit.fitWidth,
          ),
        ),
      ],
    );
  }

  /// 内容
  Widget _body() {
    final itemWidth = (MediaQuery.sizeOf(context).width - 24) / 4;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(12, 16, 12, 0),
      decoration: const BoxDecoration(color: Colors.white),
      child: Wrap(
        direction: Axis.horizontal,
        alignment: WrapAlignment.start,
        runAlignment: WrapAlignment.start,
        spacing: 0,
        runSpacing: 16,
        crossAxisAlignment: WrapCrossAlignment.start,
        children: [
          _actionItem(
            width: itemWidth,
            icon: Icons.science,
            title: "实践",
            onTap: () => context.push('/practice'),
          ),
          _actionItem(
            width: itemWidth,
            icon: Icons.logout,
            title: "注销",
            onTap: _logOut,
          ),
        ],
      ),
    );
  }

  Widget _actionItem({
    required double width,
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return SizedBox(
      width: width,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Icon(icon, size: 24), Text(title)],
        ),
      ),
    );
  }

  Future<void> _logOut() async {
    await ref.read(profileViewModelProvider.notifier).logout();
  }
}
