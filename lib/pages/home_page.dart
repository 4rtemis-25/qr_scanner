import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/models/scan_model.dart';
import 'package:qr_scanner/pages/direcciones_page.dart';
import 'package:qr_scanner/pages/historial_page.dart';
import 'package:qr_scanner/provider/db_provider.dart';
import 'package:qr_scanner/provider/ui_provider.dart';
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
  const _HomeBody();

  @override
  Widget build(BuildContext context) {

    final uiProvider = Provider.of<UiProvider>(context);
    
    final currentIndex = uiProvider.selectedMenuOpt;

    // final tempScan = ScanModel(valor: 'http://google.com');
    DBProvider.db.getAllScans().then(print);

    switch( currentIndex ) {
      case 0:
        return const HistorialPage();
      case 1:
        return const DireccionesPage();
      default:
        return const HistorialPage();
    }

  }
}