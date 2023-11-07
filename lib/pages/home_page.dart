import 'package:flutter/material.dart';
import 'package:qr_scanner/pages/direcciones_page.dart';
import 'package:qr_scanner/pages/historial_page.dart';
import 'package:qr_scanner/widgets/custom_button_scan.dart';
import 'package:qr_scanner/widgets/custom_navigation_bar.dart';

class HomePage extends StatelessWidget {
   
  const HomePage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Historial'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon( Icons.delete_forever ))
        ],
      ),
      body: _HomeBody(),
      bottomNavigationBar: const CustomNavigationBarScreen(),
      floatingActionButton: const CustomButtonScan(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomeBody extends StatelessWidget {
  const _HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    
    final currentIndex = 0;

    switch( currentIndex ) {
      case 0:
        return HistorialPage();
      case 1:
        return DireccionesPage();
      default:
        return HistorialPage();
    }

  }
}