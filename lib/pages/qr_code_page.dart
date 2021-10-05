import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qrapp/domain/qr_code/provider/qr_code_provider.dart';

// ignore: must_be_immutable
class QrCodePage extends StatelessWidget {
  //TODO: Make title required and removed ternary from build method
  QrCodePage({Key? key, required this.title}) : super(key: key);
  QRProvider qrProvider = QRProvider();
  final String title;
  @override
  Widget build(BuildContext context) {
    qrProvider = QRProvider();
    qrProvider.getSeedValue();
    return Scaffold(
      appBar: AppBar(
        //TODO: Add back button
        //automaticallyImplyLeading: false,
        title: Row(
          children: [
            Spacer(),
            Text(
              title,
              style: TextStyle(color: Theme.of(context).accentColor),
            ),
            SizedBox(width: 50),
            Spacer()
          ],
        ),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      ),
      body: Center(
        //The change notfier and consumer widget is this instance updates values that changed in the provider
        child: ChangeNotifierProvider.value(
            value: qrProvider,
            builder: (context, _) {
              return Consumer<QRProvider>(builder: (context, provider, _) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    provider.isLoading
                        ? SizedBox.shrink()
                        : QrImage(
                            data: provider.decodedString,
                            version: QrVersions.auto,
                            size: 250,
                            gapless: true,
                            foregroundColor: Theme.of(context).primaryColor,
                          ),
                    SizedBox(height: 20),
                    Text(
                        //Logic to determine what text is shown
                        _textBuilder(provider))
                  ],
                );
              });
            }),
      ),
    );
  }

//TODO: Add text builder method
  String _textBuilder(QRProvider provider) {
    if (provider.isLoading) {
      return 'Loading';
    } else {
      if (provider.countdown == 0) {
        return 'Timer Expired';
      }
    }
    return provider.countdown.toString() + 's';
  }
}
