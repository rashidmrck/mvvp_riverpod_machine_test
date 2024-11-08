// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'submission_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Submission _$SubmissionFromJson(Map<String, dynamic> json) {
  return _Submission.fromJson(json);
}

/// @nodoc
mixin _$Submission {
  String get subject => throw _privateConstructorUsedError;
  String get previewText => throw _privateConstructorUsedError;
  String get from => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  bool get runOnlyOncePerCustomer => throw _privateConstructorUsedError;
  bool get customAudience => throw _privateConstructorUsedError;

  /// Serializes this Submission to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Submission
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SubmissionCopyWith<Submission> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubmissionCopyWith<$Res> {
  factory $SubmissionCopyWith(
          Submission value, $Res Function(Submission) then) =
      _$SubmissionCopyWithImpl<$Res, Submission>;
  @useResult
  $Res call(
      {String subject,
      String previewText,
      String from,
      String email,
      bool runOnlyOncePerCustomer,
      bool customAudience});
}

/// @nodoc
class _$SubmissionCopyWithImpl<$Res, $Val extends Submission>
    implements $SubmissionCopyWith<$Res> {
  _$SubmissionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Submission
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subject = null,
    Object? previewText = null,
    Object? from = null,
    Object? email = null,
    Object? runOnlyOncePerCustomer = null,
    Object? customAudience = null,
  }) {
    return _then(_value.copyWith(
      subject: null == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as String,
      previewText: null == previewText
          ? _value.previewText
          : previewText // ignore: cast_nullable_to_non_nullable
              as String,
      from: null == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      runOnlyOncePerCustomer: null == runOnlyOncePerCustomer
          ? _value.runOnlyOncePerCustomer
          : runOnlyOncePerCustomer // ignore: cast_nullable_to_non_nullable
              as bool,
      customAudience: null == customAudience
          ? _value.customAudience
          : customAudience // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SubmissionImplCopyWith<$Res>
    implements $SubmissionCopyWith<$Res> {
  factory _$$SubmissionImplCopyWith(
          _$SubmissionImpl value, $Res Function(_$SubmissionImpl) then) =
      __$$SubmissionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String subject,
      String previewText,
      String from,
      String email,
      bool runOnlyOncePerCustomer,
      bool customAudience});
}

/// @nodoc
class __$$SubmissionImplCopyWithImpl<$Res>
    extends _$SubmissionCopyWithImpl<$Res, _$SubmissionImpl>
    implements _$$SubmissionImplCopyWith<$Res> {
  __$$SubmissionImplCopyWithImpl(
      _$SubmissionImpl _value, $Res Function(_$SubmissionImpl) _then)
      : super(_value, _then);

  /// Create a copy of Submission
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subject = null,
    Object? previewText = null,
    Object? from = null,
    Object? email = null,
    Object? runOnlyOncePerCustomer = null,
    Object? customAudience = null,
  }) {
    return _then(_$SubmissionImpl(
      subject: null == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as String,
      previewText: null == previewText
          ? _value.previewText
          : previewText // ignore: cast_nullable_to_non_nullable
              as String,
      from: null == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      runOnlyOncePerCustomer: null == runOnlyOncePerCustomer
          ? _value.runOnlyOncePerCustomer
          : runOnlyOncePerCustomer // ignore: cast_nullable_to_non_nullable
              as bool,
      customAudience: null == customAudience
          ? _value.customAudience
          : customAudience // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SubmissionImpl implements _Submission {
  _$SubmissionImpl(
      {required this.subject,
      required this.previewText,
      required this.from,
      required this.email,
      this.runOnlyOncePerCustomer = false,
      this.customAudience = false});

  factory _$SubmissionImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubmissionImplFromJson(json);

  @override
  final String subject;
  @override
  final String previewText;
  @override
  final String from;
  @override
  final String email;
  @override
  @JsonKey()
  final bool runOnlyOncePerCustomer;
  @override
  @JsonKey()
  final bool customAudience;

  @override
  String toString() {
    return 'Submission(subject: $subject, previewText: $previewText, from: $from, email: $email, runOnlyOncePerCustomer: $runOnlyOncePerCustomer, customAudience: $customAudience)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubmissionImpl &&
            (identical(other.subject, subject) || other.subject == subject) &&
            (identical(other.previewText, previewText) ||
                other.previewText == previewText) &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.runOnlyOncePerCustomer, runOnlyOncePerCustomer) ||
                other.runOnlyOncePerCustomer == runOnlyOncePerCustomer) &&
            (identical(other.customAudience, customAudience) ||
                other.customAudience == customAudience));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, subject, previewText, from,
      email, runOnlyOncePerCustomer, customAudience);

  /// Create a copy of Submission
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SubmissionImplCopyWith<_$SubmissionImpl> get copyWith =>
      __$$SubmissionImplCopyWithImpl<_$SubmissionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SubmissionImplToJson(
      this,
    );
  }
}

abstract class _Submission implements Submission {
  factory _Submission(
      {required final String subject,
      required final String previewText,
      required final String from,
      required final String email,
      final bool runOnlyOncePerCustomer,
      final bool customAudience}) = _$SubmissionImpl;

  factory _Submission.fromJson(Map<String, dynamic> json) =
      _$SubmissionImpl.fromJson;

  @override
  String get subject;
  @override
  String get previewText;
  @override
  String get from;
  @override
  String get email;
  @override
  bool get runOnlyOncePerCustomer;
  @override
  bool get customAudience;

  /// Create a copy of Submission
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SubmissionImplCopyWith<_$SubmissionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
