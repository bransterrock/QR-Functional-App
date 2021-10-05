import 'package:flutter_test/flutter_test.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qrapp/domain/qr_code/provider/qr_scanner_provider.dart';

void main() async {
  //await TestUtils.initRepo();
  group('Tests on the clear all function in the Scanner Provider', () {
    final scannerProvider = ScannerProvider();
    test('Format Value Test', () {
      final expected = '';
      scannerProvider.format = 'Some Format Value';
      scannerProvider.clearData();
      expect(scannerProvider.format, expected);
    });

    test('Result Value Test', () {
      final expected = '';
      scannerProvider.result = 'Some Result Value';
      scannerProvider.clearData();
      expect(scannerProvider.format, expected);
    });
  });

  group('Tests on the Resolve Data Scan function in the Scanner Provider', () {
    final scannerProvider = ScannerProvider();
    test('Test for the correct format value', () {
      scannerProvider.resolveDataScan(Barcode('', BarcodeFormat.codabar, []));
      final expected = 'codabar';
      expect(scannerProvider.format, expected);
    });

    test('Test for the correct result value', () {
      scannerProvider.resolveDataScan(
          Barcode('This is the result', BarcodeFormat.qrcode, []));
      final expected = 'This is the result';
      expect(scannerProvider.result, expected);
    });
  });

  // group('Test endpoint call in Scanner Provider', () {
  //   final scannerProvider = ScannerProvider();
  //   test('Test for the successful post request', () {
  //     scannerProvider
  //         .resolveDataScan(Barcode('Value', BarcodeFormat.qrcode, []));
  //     final expected = Future.value(true);
  //     when(scannerProvider.submitQR())
  //         .thenAnswer((realInvocation) => Future.value(true));
  //     expect(scannerProvider.submitQR(), expected);
  //   });

  //     //TODO: Test for unsuccessful post call. WIP
  //   test('Test for the unsuccessful post request', (){
  //     var mockRepo = MockRepository();
  //     var mockQrValue = QrValidateModel(qrVal: 'Some String');
  //     scannerProvider
  //         .resolveDataScan(Barcode('Value', BarcodeFormat.qrcode, []));
  //     when(mockRepo.validateQR(mockQrValue))
  //         .thenAnswer((realInvocation) => Future.value(false));
  //     mockRepo.validateQR(mockQrValue);
  //     expect(scannerProvider.submitQR(), false);
  //   });
  // });
}
