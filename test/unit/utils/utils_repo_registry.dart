import 'package:qrapp/core/service_locator.dart';
import 'package:qrapp/domain/qr_code/repository/qr_code_repo.dart';

import '../mocks/mock_repo.dart';

class TestUtils {
  static Future<void> registerMockRepos() async {
    var locator = ServiceLocator.locator;

    var restClient = MockRepository();
    locator.registerLazySingleton<RestClient>(() => restClient);
  }

  static Future initRepo() async {
    await ServiceLocator.register(testing: true);
    await registerMockRepos();
  }
}
