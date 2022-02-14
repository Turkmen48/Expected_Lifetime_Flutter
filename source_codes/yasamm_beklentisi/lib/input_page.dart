import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yasamm_beklentisi/constants.dart';
import 'package:yasamm_beklentisi/icon_cinsiyet.dart';
import 'package:yasamm_beklentisi/my_container.dart';
import 'package:yasamm_beklentisi/result_page.dart';
import 'package:yasamm_beklentisi/user_data.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  bool butonAktifKadin = false;
  bool butonAktifErkek = false;
  double icilenSigara = 15;
  double yapilanSpor = 3;
  int boy = 170;
  int kilo = 70;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'YAŞAM BEKLENTİSİ',
          style: TextStyle(color: Colors.black54),
        ),
        centerTitle: true,
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: MyContainer(
                  child: buildRowOutlineButton(
                      outlineButtonText: "BOY", boyMu: true),
                ),
              ),
              Expanded(
                child: MyContainer(
                    child: buildRowOutlineButton(
                        outlineButtonText: "KİLO", boyMu: false)),
              ),
            ],
          ),
        ),
        Expanded(
            child: Row(
          children: [
            Expanded(
              child: MyContainer(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Haftada Kaç Gün Spor Yapıyorsun?",
                        style: kMetinStili,
                      ),
                      Text(yapilanSpor.toInt().toString(), style: kSayiStili),
                      Slider(
                        divisions: 7,
                        min: 0,
                        max: 7,
                        value: yapilanSpor,
                        onChanged: (double newValue) {
                          setState(() {
                            yapilanSpor = newValue;
                          });
                        },
                      )
                    ]),
              ),
            ),
          ],
        )),
        Expanded(
            child: Row(
          children: [
            Expanded(
              child: MyContainer(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        ("Günde Kaç Sigara İçiyorsun?"),
                        style: kMetinStili,
                      ),
                      Text(
                        icilenSigara.toInt().toString(),
                        style: kSayiStili,
                      ),
                      Slider(
                        min: 0,
                        max: 30,
                        value: icilenSigara,
                        onChanged: (double newValue) {
                          setState(() {
                            icilenSigara = newValue;
                          });
                        },
                      ),
                    ]),
              ),
            ),
          ],
        )),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: MyContainer(
                  onPress: () {
                    setState(() {
                      butonAktifKadin = true;
                      butonAktifErkek = false;
                    });
                  },
                  renk: butonAktifKadin == true
                      ? Colors.lightBlueAccent
                      : Colors.white,
                  child: MyIcon(
                      iconData: FontAwesomeIcons.venus, iconText: "Kadın"),
                ),
              ),
              Expanded(
                child: MyContainer(
                    onPress: () {
                      setState(() {
                        butonAktifErkek = true;
                        butonAktifKadin = false;
                      });
                    },
                    renk:
                        butonAktifErkek ? Colors.lightBlueAccent : Colors.white,
                    child: MyIcon(
                      iconData: FontAwesomeIcons.mars,
                      iconText: "Erkek",
                    )),
              ),
            ],
          ),
        ),
        ButtonTheme(
          height: 50,
          child: FlatButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultPage(UserData(
                          kilo: kilo,
                          boy: boy,
                          butonAktifErkek: butonAktifErkek,
                          butonAktifKadin: butonAktifKadin,
                          icilenSigara: icilenSigara,
                          yapilanSpor: yapilanSpor))));
            },
            child: Text("Hesapla", style: kButonStili),
            color: Colors.white,
          ),
        )
      ]),
    );
  }

  Row buildRowOutlineButton(
      {@required String outlineButtonText = "Default",
      @required boyMu = true}) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      RotatedBox(
          child: Text(
            outlineButtonText,
            style: kMetinStili,
          ),
          quarterTurns: 3),
      SizedBox(
        width: 5,
      ),
      RotatedBox(
        quarterTurns: 3,
        child: Text(
          boyMu == true ? boy.toString() : kilo.toString(),
          style: kSayiStili,
        ),
      ),
      SizedBox(
        width: 30,
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 40,
            width: 40,
            child: OutlineButton(
              borderSide: BorderSide(color: Colors.lightBlue),
              onPressed: () {
                setState(() {
                  boyMu == true ? boy++ : kilo++;
                });
                print("üstteki butona basildi");
              },
              child: Icon(FontAwesomeIcons.plus, size: 10),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 40,
            width: 40,
            child: OutlineButton(
              borderSide: BorderSide(color: Colors.lightBlue),
              onPressed: () {
                setState(() {
                  boyMu == true ? boy-- : kilo--;
                });
                print("alttaki butona basildi ${boy}");
              },
              child: Icon(FontAwesomeIcons.minus, size: 10),
            ),
          )
        ],
      )
    ]);
  }
}
