import 'package:freezed_annotation/freezed_annotation.dart';
part 'submission_model.freezed.dart';
part 'submission_model.g.dart';

@freezed
class Submission with _$Submission {
  factory Submission({
    required String subject,
    required String previewText,
    required String from,
    required String email,
    @Default(false) bool runOnlyOncePerCustomer,
    @Default(false) bool customAudience,
  }) = _Submission;

  factory Submission.fromJson(Map<String, dynamic> json) => _$SubmissionFromJson(json);
}

