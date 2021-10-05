import 'package:flutter_test/flutter_test.dart';
import 'package:qrapp/domain/qr_code/provider/qr_code_provider.dart';

//import '../utils/utils_repo_registry.dart';

void main() async {
  //await TestUtils.initRepo();
  group('Test Methods in Provider', () {
    test('Test Timer Method', () async {
      var provider = QRProvider();
      int delayTime = 7;
      provider.startTimer(countDownValue: delayTime);
      await Future.delayed(Duration(seconds: delayTime));
      expect(provider.countdown, 0);
    });

    test('Test Duration Method', () async {
      var provider = QRProvider();
      int expected = 15;
      int duration =
          provider.getDuration(DateTime.now().add(Duration(seconds: expected)));
//await Future.delayed(Duration(seconds: 1));
      expect(duration, expected);
    });
  });

  // group('Test endpoint call in QRCode Provider', () {
  //   test('Test for the successful get request', () async {
  //     var dio = Dio();
  //     var mockRepo = RestClient(dio);
  //     var provider = QRProvider();
  //     var seed =
  //         Seed(seed: 'UGlrYWNodSBJIGNob29zZSB5b3U=', expiresAt: DateTime.now());
  //     when(provider.getSeedValue()).thenAnswer((realInvocation) async => seed);
  //     //await provider.getSeedValue();
  //     expect(provider.decodedString, "Pikachu I choose you");
  //     //  QRProvider? provider;
  //     // provider = QRProvider(onComplete: () {
  //     //expectLater(provider!.decodedString, 'Pikachu I choose you');
  //     // });
  //   });
}
