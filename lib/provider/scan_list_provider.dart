import 'package:flutter/foundation.dart';
import 'package:qr_scanner/models/scan_model.dart';
import 'package:qr_scanner/provider/db_provider.dart';

class ScanListProvider extends ChangeNotifier {
  List<ScanModel> scans = [];
  String tipoSeleccionado = 'http';

  Future<ScanModel> nuevoScan ( String valor ) async {
    final nuevoScan = ScanModel(valor: valor);
    final id = await DBProvider.db.nuevoScan(nuevoScan);
    nuevoScan.id = id;

    if(tipoSeleccionado == nuevoScan.tipo){
      scans.add(nuevoScan);
      notifyListeners();
    }

    return nuevoScan;
  }

  cargarScans() async {
    final lista = await DBProvider.db.getAllScans();
    scans = [...lista!];
    notifyListeners();
  }

  cargarScansByTipo(String tipo) async {
  final lista = await DBProvider.db.getScansByType(tipo);
  if (lista != null) {
    scans = [...lista];
  } else {
    scans = [];
  }
  tipoSeleccionado = tipo;
  notifyListeners();
}


  deleteAllScans() async {
    await DBProvider.db.deleteAllScans();
    scans = [];
    notifyListeners();
  }

  deleteScansById( int id ) async {
    await DBProvider.db.deleteScan(id);
  }

}