import 'package:flutter_test/flutter_test.dart';
import 'package:ui/data/address.dart';
import 'package:ui/services/fraud_detect_service.dart';
import 'package:ui/services/proto/fraud-detection-service.pb.dart';
import 'package:uuid/uuid.dart';

//Requires a mock backend setup
void main() {
  const address = Address(baseUrl: 'localhost', port: 8000);
  late FraudDetectService fraudDetectService =
      FraudDetectService.create(address: address);
  final String ruleId1 = const Uuid().v4();
  final String ruleId2 = const Uuid().v4();
  setUp(() async {});

  group('FraudDetectService Testing', () {
    test('Create RestrictionRule', () async {
      await fraudDetectService.restrictionRulesServiceClient
          .createNewRestrictionRule(CreateNewRestrictionRule(
              id: ruleId1, name: 'TestRule', predicate: 'context'));

      var listResponse = await fraudDetectService.restrictionRulesServiceClient
          .getRestrictionRules(Empty());

      expect(listResponse.rule.map((e) => e.id).contains(ruleId1), true);
    });

    test('Delete RestrictionRule', () async {
      await fraudDetectService.restrictionRulesServiceClient
          .removeRestrictionRule(RemoveRestrictionRule(id: ruleId1));

      var listResponse = await fraudDetectService.restrictionRulesServiceClient
          .getRestrictionRules(Empty());

      expect(listResponse.rule.map((e) => e.id).contains(ruleId1), false);
    });
  });

  tearDown(() => null);
}
