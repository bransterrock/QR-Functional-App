import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qrapp/domain/qr_code/provider/qr_scanner_provider.dart';

class QrScannerPage extends StatefulWidget {
  //TODO: Make title required and remove null checks
  QrScannerPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _QrScannerPageState createState() => _QrScannerPageState();
}

class _QrScannerPageState extends State<QrScannerPage> {
  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  Barcode? result;
  QRViewController? controller;
  String? passToMainScreen;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: BackButton(
              //This pushes back an argument through the route on back button press
              onPressed: () => Navigator.pop(context, passToMainScreen)),
          title: Text(
            widget.title,
            style: TextStyle(color: Theme.of(context).accentColor),
          ),
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        ),
        body:
            //TODO: Remove Column and Expanded
            ChangeNotifierProvider(
                create: (_) => ScannerProvider(),
                builder: (context, snapshot) {
                  return Consumer<ScannerProvider>(
                      builder: (context, provider, snapshot) {
                    return QRView(
                        key: qrKey,
                        overlay: QrScannerOverlayShape(
                            borderColor: Theme.of(context).accentColor,
                            borderRadius: 10,
                            borderLength: 30,
                            borderWidth: 10,
                            cutOutSize: 250),
                        onQRViewCreated: (controller) {
                          controller.scannedDataStream.listen((scanData) {
                            controller.pauseCamera();
                            provider.resolveDataScan(scanData);
                            provider.submitQR();
                            passToMainScreen = provider.result;
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: Theme.of(context).primaryColor,
                                content: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    //Spacer(),
                                    Icon(
                                      Icons.qr_code,
                                      color: Colors.white,
                                    ),
                                    SizedBox(width: 10),

                                    //TODO: Make Yellow-Black stop showing by flexing the widget
                                    Flexible(
                                      child: Text(
                                        //Displays the format of the QR Code and the resuling text.
                                        '${provider.format.toUpperCase()}: ${provider.result.toUpperCase()}',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 5,
                                      ),
                                    ),
                                    //Spacer()
                                  ],
                                ),
                              ),
                            );
                          });
                        },
                        onPermissionSet: (ctrl, setValue) =>
                            _onPermissionSet(context, ctrl, setValue));
                  });
                }));
  }

  //This is used to get the built in permission handler for the camera
  void _onPermissionSet(
      //TODO: Change setValue to hasPermission
      BuildContext context,
      QRViewController ctrl,
      bool hasPermission) {
    if (!hasPermission) {
      ScaffoldMessenger.of(context).showSnackBar(
        //TODO: Capitalize the word NO
        SnackBar(content: Text('NO PERMISSION GRANTED')),
      );
    }
  }
}
