import 'package:grpc/grpc.dart';
import 'package:grpc/grpc_connection_interface.dart';
import 'package:ui/data/server_data.dart';
import 'package:ui/services/proto/fraud-detection-service.pbgrpc.dart';
//import 'package:grpc/grpc_web.dart';
//import 'package:flutter/foundation.dart' show kIsWeb;

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
    ClientChannelBase channel;
    /*if (kIsWeb)
     channel = GrpcWebClientChannel.xhr(
          Uri.parse('${serverData.baseUrl}:${serverData.port}'));
    }*/
    channel = ClientChannel(
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
