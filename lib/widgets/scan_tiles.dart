import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/provider/scan_list_provider.dart';
import 'package:qr_scanner/theme/app_theme.dart';
import 'package:qr_scanner/utils/utils.dart';
import 'package:url_launcher/url_launcher.dart';

class ScanTiles extends StatelessWidget {

  final String tipo;

  const ScanTiles({super.key, required this.tipo});

  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context);
    final scans = scanListProvider.scans;

    return ListView.builder(
      itemCount: scans.length,
      itemBuilder: ( _, i ) => Dismissible(
        key: UniqueKey(),
        background: Container(
          color: AppTheme.darkTheme.primaryColor,
        ),
        onDismissed: (DismissDirection direction) {
          Provider.of<ScanListProvider>(context, listen: false)
          .deleteScansById(scans[i].id!);
        },
        child: ListTile(
          leading: Icon(
            tipo == 'http'
            ? Icons.home_outlined
            : Icons.map_outlined,
             color: AppTheme.darkTheme.primaryColor),
          title: Text(scans[i].valor),
          subtitle: Text(scans[i].id.toString()),
          trailing: Icon(Icons.keyboard_arrow_right_rounded, color: AppTheme.darkTheme.primaryColor, size: 40,),
          onTap: () => launchURL(context, scans[i]),
        ),
      )
    );
  }
}