import 'package:mockito/mockito.dart';
import 'package:qrapp/domain/qr_code/repository/qr_code_repo.dart';

class MockRepository extends Mock implements RestClient {}
// static Future<MockRepository> mockApis(MockRepository repo) async {
//    var seed = Seed(seed: 'UGlrYWNodSBJIGNob29zZSB5b3U=', expiresAt: DateTime.now());
//   when(repo.getSeed()).thenAnswer((_) async {
//     return Future.value(seed);
//   });
//  // _getSeed(repo);
//   return repo;
// }

// static void _getSeed(MockRepository repo) {

// }
