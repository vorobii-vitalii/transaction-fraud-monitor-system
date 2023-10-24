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
  setUp(() async {});

  group('FraudDetectService Testing', () {
    test('Create RestrictionRule', () async {
      await fraudDetectService.restrictionRulesServiceClient
          .createNewRestrictionRule(CreateNewRestrictionRule(
              id: ruleId1,
              name: 'TestRule',
              predicate: 'context.transaction.getAmount().getAmount() >= 100'));

      var listResponse = await fraudDetectService.restrictionRulesServiceClient
          .getRestrictionRules(Empty());

      expect(listResponse.rule.map((e) => e.id).contains(ruleId1), true);
    });

    test('Test Transaction validation', () async {
      final response = await fraudDetectService
          .transactionValidationServiceClient
          .validateTransaction(Transaction(
              amount: Amount(amount: 200, currency: 'USD'),
              fromAccount: '12-253',
              toAccount: '24234-54',
              country: 'UA'));
      expect(response.status, ValidationStatus.BLOCK);
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
