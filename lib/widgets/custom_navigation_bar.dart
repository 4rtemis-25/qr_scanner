import 'package:flutter/material.dart';
import 'package:qr_scanner/theme/app_theme.dart';

class CustomNavigationBarScreen extends StatelessWidget {
   
  const CustomNavigationBarScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: Colors.red,
      elevation: 0,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.map_rounded),
          label: 'Mapa',
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            label: 'Direcciones'
        )
      ],
    );
  }
}