import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stgo_trans_info/providers/predictorInfoProvider.dart';

class StopInfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final predictorInfo = Provider.of<PredictorInfoProvider>(context);

    final appBar = AppBar(
      title: Text("STOP INFO: " + predictorInfo.stopCode),
      backgroundColor: Colors.transparent,
      elevation: 0,
    );

    final body = Container(
      child: Center(
        child: Column(
          children: <Widget>[
            Text(predictorInfo.stopTitle),
            Text(predictorInfo.datePrediction +
                " " +
                predictorInfo.timePrediccion),
            Expanded(
              child: ListView.builder(
                itemCount: predictorInfo.stopServices.length,
                itemBuilder: (BuildContext context, int index) {
                  final stopServices = predictorInfo.stopServices[index];
                  final busesOnWay = stopServices.comingBuses.isEmpty;

                  String printBusPrediction(BusPrediction bus) =>
                      "${bus.remainingDistance} MTS / ${bus.remainingTime}";

                  final leadingContent = Container(
                      padding: EdgeInsets.only(right: 18.0),
                      decoration: new BoxDecoration(
                          border: new Border(
                              right: new BorderSide(
                                  width: 1.0, color: Colors.white24))),
                      child: Container(
                        width: 40,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.directions_bus, color: Colors.white),
                            Text(stopServices.serviceCode)
                          ],
                        ),
                      ));

                  final subtitleContent = (busesOnWay
                      ? Text(stopServices.serviceResponse)
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: (stopServices.comingBuses.length == 2
                              ? <Widget>[
                                  Text(printBusPrediction(
                                      stopServices.comingBuses[0])),
                                  Text(printBusPrediction(
                                      stopServices.comingBuses[1]))
                                ]
                              : <Widget>[
                                  Text(printBusPrediction(
                                      stopServices.comingBuses[0]))
                                ])));

                  final trailingContent = Icon(
                      (busesOnWay ? Icons.cancel : Icons.check_circle),
                      color: (busesOnWay ? Colors.red : Colors.green),
                      size: 30);

                  return Card(
                    elevation: 8,
                    margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                    child: Container(
                      child: ListTile(
                        leading: leadingContent,
                        title: Text(stopServices.serviceCode),
                        subtitle: subtitleContent,
                        trailing: trailingContent,
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );

    return Scaffold(appBar: appBar, body: body);
  }
}
