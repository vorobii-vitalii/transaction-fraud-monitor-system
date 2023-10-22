import 'package:get_it/get_it.dart';
import 'package:ui/data/server_data.dart';
import 'package:ui/services/fraud_detect_service.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerSingletonAsync<FraudDetectService>(() async =>
      FraudDetectService.create(serverData: ServerData.defaultLocalhost()));
}
