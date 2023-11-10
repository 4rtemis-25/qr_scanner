import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/provider/scan_list_provider.dart';
import 'package:qr_scanner/utils/utils.dart';

class CustomButtonScan extends StatelessWidget {
  const CustomButtonScan({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      backgroundColor: Colors.red,
      onPressed: () async {
        String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode('#960010', 'Cancel', false, ScanMode.QR);

        if(barcodeScanRes == '-1'){
          return;
        }

        final scanlist = Provider.of<ScanListProvider>(context, listen: false);
        
        final nuevoScan = await scanlist.nuevoScan(barcodeScanRes);

        launchURL(context, nuevoScan);
      },
      child: 
      const Icon( Icons.filter_center_focus_outlined  )
    );
  }
}