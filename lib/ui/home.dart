import 'package:flutter/material.dart';
import 'package:trulserapp/ui/trulserpage.dart';

class TrulserApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: TrulserPage(),
        ),
      ),
    );
  }
}
