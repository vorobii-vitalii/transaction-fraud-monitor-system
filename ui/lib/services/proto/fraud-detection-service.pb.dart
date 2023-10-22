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

import 'fraud-detection-service.pbenum.dart';

export 'fraud-detection-service.pbenum.dart';

class CreateNewRestrictionRule extends $pb.GeneratedMessage {
  factory CreateNewRestrictionRule({
    $core.String? id,
    $core.String? name,
    $core.String? predicate,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (name != null) {
      $result.name = name;
    }
    if (predicate != null) {
      $result.predicate = predicate;
    }
    return $result;
  }
  CreateNewRestrictionRule._() : super();
  factory CreateNewRestrictionRule.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateNewRestrictionRule.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateNewRestrictionRule', package: const $pb.PackageName(_omitMessageNames ? '' : 'fraudDetectionSystem'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'predicate')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateNewRestrictionRule clone() => CreateNewRestrictionRule()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateNewRestrictionRule copyWith(void Function(CreateNewRestrictionRule) updates) => super.copyWith((message) => updates(message as CreateNewRestrictionRule)) as CreateNewRestrictionRule;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateNewRestrictionRule create() => CreateNewRestrictionRule._();
  CreateNewRestrictionRule createEmptyInstance() => create();
  static $pb.PbList<CreateNewRestrictionRule> createRepeated() => $pb.PbList<CreateNewRestrictionRule>();
  @$core.pragma('dart2js:noInline')
  static CreateNewRestrictionRule getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateNewRestrictionRule>(create);
  static CreateNewRestrictionRule? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get predicate => $_getSZ(2);
  @$pb.TagNumber(3)
  set predicate($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPredicate() => $_has(2);
  @$pb.TagNumber(3)
  void clearPredicate() => clearField(3);
}

class RemoveRestrictionRule extends $pb.GeneratedMessage {
  factory RemoveRestrictionRule({
    $core.String? id,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    return $result;
  }
  RemoveRestrictionRule._() : super();
  factory RemoveRestrictionRule.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RemoveRestrictionRule.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RemoveRestrictionRule', package: const $pb.PackageName(_omitMessageNames ? '' : 'fraudDetectionSystem'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RemoveRestrictionRule clone() => RemoveRestrictionRule()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RemoveRestrictionRule copyWith(void Function(RemoveRestrictionRule) updates) => super.copyWith((message) => updates(message as RemoveRestrictionRule)) as RemoveRestrictionRule;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RemoveRestrictionRule create() => RemoveRestrictionRule._();
  RemoveRestrictionRule createEmptyInstance() => create();
  static $pb.PbList<RemoveRestrictionRule> createRepeated() => $pb.PbList<RemoveRestrictionRule>();
  @$core.pragma('dart2js:noInline')
  static RemoveRestrictionRule getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RemoveRestrictionRule>(create);
  static RemoveRestrictionRule? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
}

class ValidationResult extends $pb.GeneratedMessage {
  factory ValidationResult({
    ValidationStatus? status,
    $core.String? ruleName,
  }) {
    final $result = create();
    if (status != null) {
      $result.status = status;
    }
    if (ruleName != null) {
      $result.ruleName = ruleName;
    }
    return $result;
  }
  ValidationResult._() : super();
  factory ValidationResult.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ValidationResult.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ValidationResult', package: const $pb.PackageName(_omitMessageNames ? '' : 'fraudDetectionSystem'), createEmptyInstance: create)
    ..e<ValidationStatus>(1, _omitFieldNames ? '' : 'status', $pb.PbFieldType.OE, defaultOrMaker: ValidationStatus.SUCCESS, valueOf: ValidationStatus.valueOf, enumValues: ValidationStatus.values)
    ..aOS(2, _omitFieldNames ? '' : 'ruleName', protoName: 'ruleName')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ValidationResult clone() => ValidationResult()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ValidationResult copyWith(void Function(ValidationResult) updates) => super.copyWith((message) => updates(message as ValidationResult)) as ValidationResult;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ValidationResult create() => ValidationResult._();
  ValidationResult createEmptyInstance() => create();
  static $pb.PbList<ValidationResult> createRepeated() => $pb.PbList<ValidationResult>();
  @$core.pragma('dart2js:noInline')
  static ValidationResult getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ValidationResult>(create);
  static ValidationResult? _defaultInstance;

  @$pb.TagNumber(1)
  ValidationStatus get status => $_getN(0);
  @$pb.TagNumber(1)
  set status(ValidationStatus v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get ruleName => $_getSZ(1);
  @$pb.TagNumber(2)
  set ruleName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRuleName() => $_has(1);
  @$pb.TagNumber(2)
  void clearRuleName() => clearField(2);
}

class Amount extends $pb.GeneratedMessage {
  factory Amount({
    $core.int? amount,
    $core.String? currency,
  }) {
    final $result = create();
    if (amount != null) {
      $result.amount = amount;
    }
    if (currency != null) {
      $result.currency = currency;
    }
    return $result;
  }
  Amount._() : super();
  factory Amount.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Amount.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Amount', package: const $pb.PackageName(_omitMessageNames ? '' : 'fraudDetectionSystem'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'amount', $pb.PbFieldType.O3)
    ..aOS(2, _omitFieldNames ? '' : 'currency')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Amount clone() => Amount()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Amount copyWith(void Function(Amount) updates) => super.copyWith((message) => updates(message as Amount)) as Amount;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Amount create() => Amount._();
  Amount createEmptyInstance() => create();
  static $pb.PbList<Amount> createRepeated() => $pb.PbList<Amount>();
  @$core.pragma('dart2js:noInline')
  static Amount getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Amount>(create);
  static Amount? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get amount => $_getIZ(0);
  @$pb.TagNumber(1)
  set amount($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAmount() => $_has(0);
  @$pb.TagNumber(1)
  void clearAmount() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get currency => $_getSZ(1);
  @$pb.TagNumber(2)
  set currency($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCurrency() => $_has(1);
  @$pb.TagNumber(2)
  void clearCurrency() => clearField(2);
}

class Transaction extends $pb.GeneratedMessage {
  factory Transaction({
    $core.String? fromAccount,
    $core.String? toAccount,
    Amount? amount,
    $core.String? country,
  }) {
    final $result = create();
    if (fromAccount != null) {
      $result.fromAccount = fromAccount;
    }
    if (toAccount != null) {
      $result.toAccount = toAccount;
    }
    if (amount != null) {
      $result.amount = amount;
    }
    if (country != null) {
      $result.country = country;
    }
    return $result;
  }
  Transaction._() : super();
  factory Transaction.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Transaction.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Transaction', package: const $pb.PackageName(_omitMessageNames ? '' : 'fraudDetectionSystem'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'fromAccount', protoName: 'fromAccount')
    ..aOS(2, _omitFieldNames ? '' : 'toAccount', protoName: 'toAccount')
    ..aOM<Amount>(3, _omitFieldNames ? '' : 'amount', subBuilder: Amount.create)
    ..aOS(4, _omitFieldNames ? '' : 'country')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Transaction clone() => Transaction()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Transaction copyWith(void Function(Transaction) updates) => super.copyWith((message) => updates(message as Transaction)) as Transaction;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Transaction create() => Transaction._();
  Transaction createEmptyInstance() => create();
  static $pb.PbList<Transaction> createRepeated() => $pb.PbList<Transaction>();
  @$core.pragma('dart2js:noInline')
  static Transaction getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Transaction>(create);
  static Transaction? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get fromAccount => $_getSZ(0);
  @$pb.TagNumber(1)
  set fromAccount($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFromAccount() => $_has(0);
  @$pb.TagNumber(1)
  void clearFromAccount() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get toAccount => $_getSZ(1);
  @$pb.TagNumber(2)
  set toAccount($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasToAccount() => $_has(1);
  @$pb.TagNumber(2)
  void clearToAccount() => clearField(2);

  @$pb.TagNumber(3)
  Amount get amount => $_getN(2);
  @$pb.TagNumber(3)
  set amount(Amount v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasAmount() => $_has(2);
  @$pb.TagNumber(3)
  void clearAmount() => clearField(3);
  @$pb.TagNumber(3)
  Amount ensureAmount() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.String get country => $_getSZ(3);
  @$pb.TagNumber(4)
  set country($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasCountry() => $_has(3);
  @$pb.TagNumber(4)
  void clearCountry() => clearField(4);
}

class RestrictionRule extends $pb.GeneratedMessage {
  factory RestrictionRule({
    $core.String? id,
    $core.String? ruleName,
    $core.String? predicate,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (ruleName != null) {
      $result.ruleName = ruleName;
    }
    if (predicate != null) {
      $result.predicate = predicate;
    }
    return $result;
  }
  RestrictionRule._() : super();
  factory RestrictionRule.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RestrictionRule.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RestrictionRule', package: const $pb.PackageName(_omitMessageNames ? '' : 'fraudDetectionSystem'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'ruleName', protoName: 'ruleName')
    ..aOS(3, _omitFieldNames ? '' : 'predicate')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RestrictionRule clone() => RestrictionRule()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RestrictionRule copyWith(void Function(RestrictionRule) updates) => super.copyWith((message) => updates(message as RestrictionRule)) as RestrictionRule;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RestrictionRule create() => RestrictionRule._();
  RestrictionRule createEmptyInstance() => create();
  static $pb.PbList<RestrictionRule> createRepeated() => $pb.PbList<RestrictionRule>();
  @$core.pragma('dart2js:noInline')
  static RestrictionRule getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RestrictionRule>(create);
  static RestrictionRule? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get ruleName => $_getSZ(1);
  @$pb.TagNumber(2)
  set ruleName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRuleName() => $_has(1);
  @$pb.TagNumber(2)
  void clearRuleName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get predicate => $_getSZ(2);
  @$pb.TagNumber(3)
  set predicate($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPredicate() => $_has(2);
  @$pb.TagNumber(3)
  void clearPredicate() => clearField(3);
}

class RestrictionRules extends $pb.GeneratedMessage {
  factory RestrictionRules({
    $core.Iterable<RestrictionRule>? rule,
  }) {
    final $result = create();
    if (rule != null) {
      $result.rule.addAll(rule);
    }
    return $result;
  }
  RestrictionRules._() : super();
  factory RestrictionRules.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RestrictionRules.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RestrictionRules', package: const $pb.PackageName(_omitMessageNames ? '' : 'fraudDetectionSystem'), createEmptyInstance: create)
    ..pc<RestrictionRule>(1, _omitFieldNames ? '' : 'rule', $pb.PbFieldType.PM, subBuilder: RestrictionRule.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RestrictionRules clone() => RestrictionRules()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RestrictionRules copyWith(void Function(RestrictionRules) updates) => super.copyWith((message) => updates(message as RestrictionRules)) as RestrictionRules;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RestrictionRules create() => RestrictionRules._();
  RestrictionRules createEmptyInstance() => create();
  static $pb.PbList<RestrictionRules> createRepeated() => $pb.PbList<RestrictionRules>();
  @$core.pragma('dart2js:noInline')
  static RestrictionRules getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RestrictionRules>(create);
  static RestrictionRules? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<RestrictionRule> get rule => $_getList(0);
}

class Empty extends $pb.GeneratedMessage {
  factory Empty() => create();
  Empty._() : super();
  factory Empty.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Empty.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Empty', package: const $pb.PackageName(_omitMessageNames ? '' : 'fraudDetectionSystem'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Empty clone() => Empty()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Empty copyWith(void Function(Empty) updates) => super.copyWith((message) => updates(message as Empty)) as Empty;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Empty create() => Empty._();
  Empty createEmptyInstance() => create();
  static $pb.PbList<Empty> createRepeated() => $pb.PbList<Empty>();
  @$core.pragma('dart2js:noInline')
  static Empty getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Empty>(create);
  static Empty? _defaultInstance;
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
