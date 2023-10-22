//
//  Generated code. Do not modify.
//  source: proto/fraud-detection-service.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use validationStatusDescriptor instead')
const ValidationStatus$json = {
  '1': 'ValidationStatus',
  '2': [
    {'1': 'SUCCESS', '2': 0},
    {'1': 'BLOCK', '2': 1},
  ],
};

/// Descriptor for `ValidationStatus`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List validationStatusDescriptor = $convert.base64Decode(
    'ChBWYWxpZGF0aW9uU3RhdHVzEgsKB1NVQ0NFU1MQABIJCgVCTE9DSxAB');

@$core.Deprecated('Use createNewRestrictionRuleDescriptor instead')
const CreateNewRestrictionRule$json = {
  '1': 'CreateNewRestrictionRule',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'predicate', '3': 3, '4': 1, '5': 9, '10': 'predicate'},
  ],
};

/// Descriptor for `CreateNewRestrictionRule`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createNewRestrictionRuleDescriptor = $convert.base64Decode(
    'ChhDcmVhdGVOZXdSZXN0cmljdGlvblJ1bGUSDgoCaWQYASABKAlSAmlkEhIKBG5hbWUYAiABKA'
    'lSBG5hbWUSHAoJcHJlZGljYXRlGAMgASgJUglwcmVkaWNhdGU=');

@$core.Deprecated('Use removeRestrictionRuleDescriptor instead')
const RemoveRestrictionRule$json = {
  '1': 'RemoveRestrictionRule',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
  ],
};

/// Descriptor for `RemoveRestrictionRule`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List removeRestrictionRuleDescriptor = $convert.base64Decode(
    'ChVSZW1vdmVSZXN0cmljdGlvblJ1bGUSDgoCaWQYASABKAlSAmlk');

@$core.Deprecated('Use validationResultDescriptor instead')
const ValidationResult$json = {
  '1': 'ValidationResult',
  '2': [
    {'1': 'status', '3': 1, '4': 1, '5': 14, '6': '.fraudDetectionSystem.ValidationStatus', '10': 'status'},
    {'1': 'ruleName', '3': 2, '4': 1, '5': 9, '10': 'ruleName'},
  ],
};

/// Descriptor for `ValidationResult`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List validationResultDescriptor = $convert.base64Decode(
    'ChBWYWxpZGF0aW9uUmVzdWx0Ej4KBnN0YXR1cxgBIAEoDjImLmZyYXVkRGV0ZWN0aW9uU3lzdG'
    'VtLlZhbGlkYXRpb25TdGF0dXNSBnN0YXR1cxIaCghydWxlTmFtZRgCIAEoCVIIcnVsZU5hbWU=');

@$core.Deprecated('Use amountDescriptor instead')
const Amount$json = {
  '1': 'Amount',
  '2': [
    {'1': 'amount', '3': 1, '4': 1, '5': 5, '10': 'amount'},
    {'1': 'currency', '3': 2, '4': 1, '5': 9, '10': 'currency'},
  ],
};

/// Descriptor for `Amount`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List amountDescriptor = $convert.base64Decode(
    'CgZBbW91bnQSFgoGYW1vdW50GAEgASgFUgZhbW91bnQSGgoIY3VycmVuY3kYAiABKAlSCGN1cn'
    'JlbmN5');

@$core.Deprecated('Use transactionDescriptor instead')
const Transaction$json = {
  '1': 'Transaction',
  '2': [
    {'1': 'fromAccount', '3': 1, '4': 1, '5': 9, '10': 'fromAccount'},
    {'1': 'toAccount', '3': 2, '4': 1, '5': 9, '10': 'toAccount'},
    {'1': 'amount', '3': 3, '4': 1, '5': 11, '6': '.fraudDetectionSystem.Amount', '10': 'amount'},
    {'1': 'country', '3': 4, '4': 1, '5': 9, '10': 'country'},
  ],
};

/// Descriptor for `Transaction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List transactionDescriptor = $convert.base64Decode(
    'CgtUcmFuc2FjdGlvbhIgCgtmcm9tQWNjb3VudBgBIAEoCVILZnJvbUFjY291bnQSHAoJdG9BY2'
    'NvdW50GAIgASgJUgl0b0FjY291bnQSNAoGYW1vdW50GAMgASgLMhwuZnJhdWREZXRlY3Rpb25T'
    'eXN0ZW0uQW1vdW50UgZhbW91bnQSGAoHY291bnRyeRgEIAEoCVIHY291bnRyeQ==');

@$core.Deprecated('Use restrictionRuleDescriptor instead')
const RestrictionRule$json = {
  '1': 'RestrictionRule',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'ruleName', '3': 2, '4': 1, '5': 9, '10': 'ruleName'},
    {'1': 'predicate', '3': 3, '4': 1, '5': 9, '10': 'predicate'},
  ],
};

/// Descriptor for `RestrictionRule`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List restrictionRuleDescriptor = $convert.base64Decode(
    'Cg9SZXN0cmljdGlvblJ1bGUSDgoCaWQYASABKAlSAmlkEhoKCHJ1bGVOYW1lGAIgASgJUghydW'
    'xlTmFtZRIcCglwcmVkaWNhdGUYAyABKAlSCXByZWRpY2F0ZQ==');

@$core.Deprecated('Use restrictionRulesDescriptor instead')
const RestrictionRules$json = {
  '1': 'RestrictionRules',
  '2': [
    {'1': 'rule', '3': 1, '4': 3, '5': 11, '6': '.fraudDetectionSystem.RestrictionRule', '10': 'rule'},
  ],
};

/// Descriptor for `RestrictionRules`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List restrictionRulesDescriptor = $convert.base64Decode(
    'ChBSZXN0cmljdGlvblJ1bGVzEjkKBHJ1bGUYASADKAsyJS5mcmF1ZERldGVjdGlvblN5c3RlbS'
    '5SZXN0cmljdGlvblJ1bGVSBHJ1bGU=');

@$core.Deprecated('Use emptyDescriptor instead')
const Empty$json = {
  '1': 'Empty',
};

/// Descriptor for `Empty`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List emptyDescriptor = $convert.base64Decode(
    'CgVFbXB0eQ==');

