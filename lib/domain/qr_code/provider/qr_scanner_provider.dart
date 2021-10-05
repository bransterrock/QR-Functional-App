import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qrapp/core/service_locator.dart';
import 'package:qrapp/domain/qr_code/model/validator_model.dart';
import 'package:qrapp/domain/qr_code/repository/qr_code_repo.dart';

class ScannerProvider extends ChangeNotifier {
  final RestClient client = ServiceLocator.locator<RestClient>();

  //ScannerProvider();

  String result = '';
  String format = '';

  ///computes the values of the Barcode data and assign them accordingly
  //TODO: Change to async method and remove empty return
  void resolveDataScan(Barcode data) {
    format = describeEnum(data.format);
    result = data.code;
    notifyListeners();
  }

  void clearData() {
    //TODO: default variables in this class to empty strings rather than nulls
    format = '';
    result = '';
    notifyListeners();
  }

//posts the value of the scanned QR to the endpoint
  Future<bool> submitQR() async {
    var validateQR = QrValidateModel(qrVal: result);
    try {
      await client.validateQR(validateQR); //.then((response) {});
      return true;
    } on Exception {
      return false;
    }
    //catch (e) {return false;}
  }
}
