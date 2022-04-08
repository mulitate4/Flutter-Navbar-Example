// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'navigation.dart';

void main() {
  runApp(const KeeperAppEntry());
}

class KeeperAppEntry extends StatelessWidget {
  const KeeperAppEntry({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: Navigation(),
    );
  }
}
