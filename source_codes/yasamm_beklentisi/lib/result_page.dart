import 'package:flutter/material.dart';
import 'package:yasamm_beklentisi/constants.dart';
import 'package:yasamm_beklentisi/hesap.dart';

import 'user_data.dart';

class ResultPage extends StatelessWidget {
  final UserData _userData;
  ResultPage(this._userData);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sonuç Sayfası"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Center(
                  child: Text(
                "Beklenen Yaşam Süresi: ${Hesap(_userData).hesaplama().toInt()}",
                style: kMetinStili,
              )),
              flex: 8),
          Expanded(
              flex: 1,
              child: FlatButton(
                color: Colors.white,
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Geri Dön",
                  style: kButonStili,
                ),
              )),
        ],
      ),
    );
  }
}
