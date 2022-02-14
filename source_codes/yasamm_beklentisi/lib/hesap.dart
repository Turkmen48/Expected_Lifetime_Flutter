import 'package:yasamm_beklentisi/user_data.dart';

class Hesap {
  UserData _userData;
  Hesap(this._userData);

  double hesaplama() {
    double sonuc;
    sonuc = 90 + _userData.yapilanSpor! - _userData.icilenSigara!;
    sonuc = sonuc + (_userData.boy! / _userData.kilo!);
    if (_userData.butonAktifKadin == true) {
      return sonuc + 3;
    } else {
      return sonuc;
    }
  }
}
