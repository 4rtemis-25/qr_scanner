import 'package:flutter/material.dart';
import 'package:qr_scanner/widgets/scan_tiles.dart';

class HistorialPage extends StatelessWidget {
   
  const HistorialPage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return const ScanTiles(tipo: 'geo');
  }
}