import 'package:flutter/material.dart';
import 'package:qr_scanner/models/scan_model.dart';
import 'package:url_launcher/url_launcher.dart';

launchURL(BuildContext context, ScanModel scan) async {
  final Uri url = Uri.parse(scan.valor);

  Future launcher() async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
  
  if (scan.tipo == 'http') {
    launcher();
  } else {
    Navigator.pushNamed(context, 'mapa', arguments: scan);
  }
}