import 'package:grpc/grpc.dart';
import 'package:ui/data/server_data.dart';
import 'package:ui/services/proto/fraud-detection-service.pbgrpc.dart';

class FraudDetectService {
  final ServerData serverData;

  final RestrictionRulesServiceClient restrictionRulesServiceClient;
  final TransactionValidationServiceClient transactionValidationServiceClient;

  FraudDetectService._({
    required this.serverData,
    required this.restrictionRulesServiceClient,
    required this.transactionValidationServiceClient,
  });

  factory FraudDetectService.create({required ServerData serverData}) {
    final channel = ClientChannel(
      serverData.baseUrl,
      port: serverData.port,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );
    return FraudDetectService._(
        serverData: serverData,
        restrictionRulesServiceClient: RestrictionRulesServiceClient(channel),
        transactionValidationServiceClient:
            TransactionValidationServiceClient(channel));
  }
}
