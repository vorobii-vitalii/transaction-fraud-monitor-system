//
//  Generated code. Do not modify.
//  source: proto/fraud-detection-service.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ValidationStatus extends $pb.ProtobufEnum {
  static const ValidationStatus SUCCESS = ValidationStatus._(0, _omitEnumNames ? '' : 'SUCCESS');
  static const ValidationStatus BLOCK = ValidationStatus._(1, _omitEnumNames ? '' : 'BLOCK');

  static const $core.List<ValidationStatus> values = <ValidationStatus> [
    SUCCESS,
    BLOCK,
  ];

  static final $core.Map<$core.int, ValidationStatus> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ValidationStatus? valueOf($core.int value) => _byValue[value];

  const ValidationStatus._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
