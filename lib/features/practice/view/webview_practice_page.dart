import 'package:flutter/material.dart';
import 'package:interesting_play_flutter/core/theme/app_colors.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPracticePage extends StatefulWidget {
  const WebViewPracticePage({super.key});

  @override
  State<WebViewPracticePage> createState() => _WebViewPracticePageState();
}

class _WebViewPracticePageState extends State<WebViewPracticePage> {
  late final WebViewController _controller;
  var _progress = 0;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (progress) {
            setState(() {
              _progress = progress;
            });
          },
        ),
      )
      ..loadRequest(Uri.parse('https://flutter.dev'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.green_300,
        scrolledUnderElevation: 0,
        title: const Text('WebView'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => _controller.reload(),
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: Column(
        children: [
          if (_progress < 100) LinearProgressIndicator(value: _progress / 100),
          Expanded(child: WebViewWidget(controller: _controller)),
        ],
      ),
    );
  }
}
