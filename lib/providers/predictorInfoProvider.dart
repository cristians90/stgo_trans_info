import 'package:flutter/material.dart';
import 'package:stgo_trans_info/models/predictorResponse.dart';
import 'package:stgo_trans_info/services/redApi.dart';

class PredictorInfoProvider with ChangeNotifier {
  String datePrediction;
  String timePrediccion;
  String stopCode;
  String stopTitle;
  List<ServicePrediction> stopServices;

  Future<bool> loadBusStopInfo(String stopCode) async {
    try {
      final stopInfoData = await getStopInfo(stopCode);
      _setData(stopInfoData);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  void _setData(PredictorResponse data) {
    this.datePrediction = data.fechaprediccion;
    this.timePrediccion = data.horaprediccion;
    this.stopCode = data.paradero;
    this.stopTitle = data.nomett;

    this.stopServices = new List<ServicePrediction>();

    data.servicios.item.forEach((servicio) {
      var servicePrediction = new ServicePrediction();
      servicePrediction.serviceCode = servicio.servicio;
      servicePrediction.serviceColor = servicio.color;
      servicePrediction.serviceDestination = servicio.destino;
      servicePrediction.serviceResponse = servicio.respuestaServicio;

      var comingBuses = new List<BusPrediction>();

      if (servicio.ppubus1 != null && servicio.ppubus1.isNotEmpty) {
        var bus = new BusPrediction();
        bus.busPlate = servicio.ppubus1;
        bus.remainingDistance = servicio.distanciabus1;
        bus.remainingTime = servicio.horaprediccionbus1;
        comingBuses.add(bus);
      }

      if (servicio.ppubus2 != null && servicio.ppubus2.isNotEmpty) {
        var bus = new BusPrediction();
        bus.busPlate = servicio.ppubus2;
        bus.remainingDistance = servicio.distanciabus2;
        bus.remainingTime = servicio.horaprediccionbus2;
        comingBuses.add(bus);
      }

      servicePrediction.comingBuses = comingBuses;

      this.stopServices.add(servicePrediction);

      notifyListeners();
    });
  }
}

class ServicePrediction {
  String serviceCode;
  String serviceColor;
  String serviceDestination;
  String serviceResponse;
  List<BusPrediction> comingBuses;
}

class BusPrediction {
  String busPlate;
  String remainingDistance;
  String remainingTime;
}
