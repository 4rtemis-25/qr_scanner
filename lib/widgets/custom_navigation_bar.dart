import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/provider/ui_provider.dart';

class CustomNavigationBarScreen extends StatelessWidget {
   
  const CustomNavigationBarScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final uiProvider = Provider.of<UiProvider>(context);

    final currentIndex = uiProvider.selectedMenuOpt;

    return BottomNavigationBar(
      selectedItemColor: Colors.red,
      onTap: ( int i ) => uiProvider.selectedMenuOpt = i,
      currentIndex: currentIndex,
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