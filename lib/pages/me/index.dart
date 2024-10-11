
import 'package:flutter/material.dart';

class MePage extends StatefulWidget {
  const MePage({super.key});

  @override
  State<StatefulWidget> createState() => _MePageState();

}

class _MePageState extends State<MePage> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Center(child:  Text("个人页"),);
  }
  @override
  bool get wantKeepAlive => true;
}