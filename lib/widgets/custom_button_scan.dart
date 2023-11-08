import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class CustomButtonScan extends StatelessWidget {
  const CustomButtonScan({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      backgroundColor: Colors.red,
      onPressed: () async {
        String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode('#960010', 'Cancel', false, ScanMode.QR);
      },
      child: 
      const Icon( Icons.filter_center_focus_outlined  )
    );
  }
}