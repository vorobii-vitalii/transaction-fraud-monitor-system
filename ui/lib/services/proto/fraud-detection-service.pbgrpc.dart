//
//  Generated code. Do not modify.
//  source: proto/fraud-detection-service.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'fraud-detection-service.pb.dart' as $0;

export 'fraud-detection-service.pb.dart';

@$pb.GrpcServiceName('fraudDetectionSystem.TransactionValidationService')
class TransactionValidationServiceClient extends $grpc.Client {
  static final _$validateTransaction = $grpc.ClientMethod<$0.Transaction, $0.ValidationResult>(
      '/fraudDetectionSystem.TransactionValidationService/validateTransaction',
      ($0.Transaction value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ValidationResult.fromBuffer(value));

  TransactionValidationServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.ValidationResult> validateTransaction($0.Transaction request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$validateTransaction, request, options: options);
  }
}

@$pb.GrpcServiceName('fraudDetectionSystem.TransactionValidationService')
abstract class TransactionValidationServiceBase extends $grpc.Service {
  $core.String get $name => 'fraudDetectionSystem.TransactionValidationService';

  TransactionValidationServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Transaction, $0.ValidationResult>(
        'validateTransaction',
        validateTransaction_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Transaction.fromBuffer(value),
        ($0.ValidationResult value) => value.writeToBuffer()));
  }

  $async.Future<$0.ValidationResult> validateTransaction_Pre($grpc.ServiceCall call, $async.Future<$0.Transaction> request) async {
    return validateTransaction(call, await request);
  }

  $async.Future<$0.ValidationResult> validateTransaction($grpc.ServiceCall call, $0.Transaction request);
}
@$pb.GrpcServiceName('fraudDetectionSystem.RestrictionRulesService')
class RestrictionRulesServiceClient extends $grpc.Client {
  static final _$getRestrictionRules = $grpc.ClientMethod<$0.Empty, $0.RestrictionRules>(
      '/fraudDetectionSystem.RestrictionRulesService/getRestrictionRules',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.RestrictionRules.fromBuffer(value));
  static final _$createNewRestrictionRule = $grpc.ClientMethod<$0.CreateNewRestrictionRule, $0.Empty>(
      '/fraudDetectionSystem.RestrictionRulesService/createNewRestrictionRule',
      ($0.CreateNewRestrictionRule value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));
  static final _$removeRestrictionRule = $grpc.ClientMethod<$0.RemoveRestrictionRule, $0.Empty>(
      '/fraudDetectionSystem.RestrictionRulesService/removeRestrictionRule',
      ($0.RemoveRestrictionRule value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));

  RestrictionRulesServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.RestrictionRules> getRestrictionRules($0.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getRestrictionRules, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> createNewRestrictionRule($0.CreateNewRestrictionRule request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createNewRestrictionRule, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> removeRestrictionRule($0.RemoveRestrictionRule request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$removeRestrictionRule, request, options: options);
  }
}

@$pb.GrpcServiceName('fraudDetectionSystem.RestrictionRulesService')
abstract class RestrictionRulesServiceBase extends $grpc.Service {
  $core.String get $name => 'fraudDetectionSystem.RestrictionRulesService';

  RestrictionRulesServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Empty, $0.RestrictionRules>(
        'getRestrictionRules',
        getRestrictionRules_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($0.RestrictionRules value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CreateNewRestrictionRule, $0.Empty>(
        'createNewRestrictionRule',
        createNewRestrictionRule_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CreateNewRestrictionRule.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RemoveRestrictionRule, $0.Empty>(
        'removeRestrictionRule',
        removeRestrictionRule_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RemoveRestrictionRule.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
  }

  $async.Future<$0.RestrictionRules> getRestrictionRules_Pre($grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return getRestrictionRules(call, await request);
  }

  $async.Future<$0.Empty> createNewRestrictionRule_Pre($grpc.ServiceCall call, $async.Future<$0.CreateNewRestrictionRule> request) async {
    return createNewRestrictionRule(call, await request);
  }

  $async.Future<$0.Empty> removeRestrictionRule_Pre($grpc.ServiceCall call, $async.Future<$0.RemoveRestrictionRule> request) async {
    return removeRestrictionRule(call, await request);
  }

  $async.Future<$0.RestrictionRules> getRestrictionRules($grpc.ServiceCall call, $0.Empty request);
  $async.Future<$0.Empty> createNewRestrictionRule($grpc.ServiceCall call, $0.CreateNewRestrictionRule request);
  $async.Future<$0.Empty> removeRestrictionRule($grpc.ServiceCall call, $0.RemoveRestrictionRule request);
}
