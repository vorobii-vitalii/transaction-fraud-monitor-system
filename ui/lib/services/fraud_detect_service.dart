import 'package:grpc/grpc.dart';
import 'package:grpc/grpc_connection_interface.dart';
import 'package:ui/data/address.dart';
import 'package:ui/services/proto/fraud-detection-service.pbgrpc.dart';
//import 'package:grpc/grpc_web.dart';
//import 'package:flutter/foundation.dart' show kIsWeb;

class FraudDetectService {
  final Address address;

  final RestrictionRulesServiceClient restrictionRulesServiceClient;
  final TransactionValidationServiceClient transactionValidationServiceClient;

  FraudDetectService._({
    required this.address,
    required this.restrictionRulesServiceClient,
    required this.transactionValidationServiceClient,
  });

  factory FraudDetectService.create({required Address address}) {
    ClientChannelBase channel;
    /*if (kIsWeb)
     channel = GrpcWebClientChannel.xhr(
          Uri.parse('${Address.baseUrl}:${Address.port}'));
    }*/
    channel = ClientChannel(
      address.baseUrl,
      port: address.port,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );
    return FraudDetectService._(
        address: address,
        restrictionRulesServiceClient: RestrictionRulesServiceClient(channel),
        transactionValidationServiceClient:
            TransactionValidationServiceClient(channel));
  }
}
