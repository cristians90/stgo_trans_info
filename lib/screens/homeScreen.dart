import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stgo_trans_info/providers/predictorInfoProvider.dart';
import 'package:stgo_trans_info/screens/stopInfoScreen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final predictorInfo = Provider.of<PredictorInfoProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Scl Trans Info"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              child: TextFormField(
                  textAlign: TextAlign.center,
                  style: new TextStyle(fontSize: 60.0),
                  onFieldSubmitted: (value) async {
                    var result = await predictorInfo.loadBusStopInfo(value);
                    if (result) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => StopInfoScreen()),
                      );
                    }
                  }),
            ),
            Text("Busca por código de paradero")
          ],
        ),
      ),
    );
  }
}
