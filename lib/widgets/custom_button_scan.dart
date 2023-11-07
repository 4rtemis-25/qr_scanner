import 'package:flutter/material.dart';
import 'package:qr_scanner/theme/app_theme.dart';

class CustomButtonScan extends StatelessWidget {
  const CustomButtonScan({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      backgroundColor: Colors.red,
      onPressed: () {},
      child: 
      Icon( Icons.filter_center_focus_outlined  )
    );
  }
}