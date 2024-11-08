// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submission_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SubmissionImpl _$$SubmissionImplFromJson(Map<String, dynamic> json) =>
    _$SubmissionImpl(
      subject: json['subject'] as String,
      previewText: json['previewText'] as String,
      from: json['from'] as String,
      email: json['email'] as String,
      runOnlyOncePerCustomer: json['runOnlyOncePerCustomer'] as bool? ?? false,
      customAudience: json['customAudience'] as bool? ?? false,
    );

Map<String, dynamic> _$$SubmissionImplToJson(_$SubmissionImpl instance) =>
    <String, dynamic>{
      'subject': instance.subject,
      'previewText': instance.previewText,
      'from': instance.from,
      'email': instance.email,
      'runOnlyOncePerCustomer': instance.runOnlyOncePerCustomer,
      'customAudience': instance.customAudience,
    };
