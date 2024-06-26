import 'dart:convert';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class ScanModel {
    int? id;
    String? tipo;
    String valor;

    ScanModel({
        this.id,
        this.tipo,
        required this.valor,
    }) {
      if(valor.contains('http') ){
        tipo = 'http';
      } else {
        tipo = 'geo';
      }
    }

    LatLng getLatLng() {
      final latLng = valor.substring(4).split(',');
      final lat = double.parse(latLng[0]);
      final lng = double.parse(latLng[1]);

      return LatLng( lat , lng);
    }

    factory ScanModel.fromRawJson(String str) => ScanModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ScanModel.fromJson(Map<String, dynamic> json) => ScanModel(
        id: json["id"],
        tipo: json["tipo"],
        valor: json["valor"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "tipo": tipo,
        "valor": valor,
    };
}
