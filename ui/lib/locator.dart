import 'package:get_it/get_it.dart';
import 'package:ui/data/address.dart';
import 'package:ui/services/dialog_service.dart';
import 'package:ui/services/fraud_detect_service.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerSingletonAsync<FraudDetectService>(() async =>
      FraudDetectService.create(address: Address.defaultLocalhost()));
  locator.registerSingleton<DialogService>(const DialogService());
}
