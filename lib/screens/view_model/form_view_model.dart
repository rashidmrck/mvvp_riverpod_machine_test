import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mvvp_riverpod_machine_test/screens/model/form_steo_model.dart';
import 'package:mvvp_riverpod_machine_test/screens/model/submission_model.dart';
import 'package:mvvp_riverpod_machine_test/screens/view/form_view.dart';
import 'package:mvvp_riverpod_machine_test/service/shared_preference.dart';

final submissionViewModelProvider = StateNotifierProvider<SubmissionViewModel, SubmissionState>((ref) {
  return SubmissionViewModel();
});


class SubmissionViewModel extends StateNotifier<SubmissionState> {
  SubmissionViewModel() : super(SubmissionState(submissions: [], isLoading: true));
  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _previewTextController = TextEditingController();
  final TextEditingController _fromNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  int get submissionCount => state.submissions.length;
  TextEditingController get subjectController => _subjectController;
  TextEditingController get previewTextController => _previewTextController;
  TextEditingController get fromNameController => _fromNameController;
  TextEditingController get emailController => _emailController;

  Future<void> loadSubmissions(WidgetRef ref) async {
    // Set loading state to true
    state = SubmissionState(submissions: state.submissions, isLoading: true);

    bool hasToken = await SharedPreferenceService.containsToken();
    if (hasToken) {
      String? token = await SharedPreferenceService.getToken();
      if (token != null) {
        List<dynamic> jsonData = jsonDecode(token);
        if (jsonData.isNotEmpty) {
          List<Submission> loadedSubmissions = jsonData.map((item) => Submission.fromJson(item)).toList();
          // Update state with the loaded submissions and set isLoading to false
          state = SubmissionState(
            submissions: loadedSubmissions,
            isLoading: false,
            currentIndex: loadedSubmissions.length - 1,
            customAudience: loadedSubmissions[loadedSubmissions.length - 1].customAudience,
            runOnlyOncePerCustomer: loadedSubmissions[loadedSubmissions.length - 1].runOnlyOncePerCustomer,
          );

          _subjectController.text = state.submissions[state.currentIndex].subject;
          _previewTextController.text = state.submissions[state.currentIndex].previewText;
          _fromNameController.text = state.submissions[state.currentIndex].from;
          _emailController.text = state.submissions[state.currentIndex].email;
        } else {
          state = SubmissionState(
              submissions: state.submissions,
              isLoading: false,
              currentIndex: state.currentIndex,
              customAudience: false,
              runOnlyOncePerCustomer: false);
        }
      } else {
        // No token, set loading to false without changing submissions
        state = SubmissionState(
            submissions: state.submissions,
            isLoading: false,
            currentIndex: state.currentIndex,
            customAudience: false,
            runOnlyOncePerCustomer: false);
      }
    } else {
      // No token, set loading to false without changing submissions
      state = SubmissionState(
          submissions: state.submissions,
          isLoading: false,
          currentIndex: state.currentIndex,
          customAudience: false,
          runOnlyOncePerCustomer: false);
    }
  }

  bool validate() {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

    return _subjectController.text.length >= 6 &&
        _previewTextController.text.length >= 6 &&
        _fromNameController.text.length >= 6 &&
        emailRegExp.hasMatch(_emailController.text);
  }

  void clearData() {
    _subjectController.clear();
    _previewTextController.clear();
    _emailController.clear();
    _fromNameController.clear();
  }

  void updateCuttentIndex() {
    state = SubmissionState(
      submissions: state.submissions,
      isLoading: state.isLoading,
      currentIndex: state.currentIndex + 1,
      customAudience: state.customAudience,
      runOnlyOncePerCustomer: state.runOnlyOncePerCustomer,
    );
  }

  void addSubmission(Submission submission) {
    final updatedSubmissions = List<Submission>.from(state.submissions)..add(submission);
    state = SubmissionState(
      submissions: updatedSubmissions,
      isLoading: state.isLoading,
      currentIndex: state.currentIndex,
      runOnlyOncePerCustomer: state.runOnlyOncePerCustomer,
      customAudience: state.customAudience,
    );
  }

  void updatedSubmission(int index, Submission submission) {
    final updatedSubmissions = List<Submission>.from(state.submissions);
    updatedSubmissions[index] = submission;
    state = SubmissionState(
      submissions: updatedSubmissions,
      isLoading: state.isLoading,
      currentIndex: state.currentIndex,
      runOnlyOncePerCustomer: state.runOnlyOncePerCustomer,
      customAudience: state.customAudience,
    );
  }

  updateRunOnlyOncePerCustomer(bool value) {
    state = SubmissionState(
      submissions: state.submissions,
      isLoading: state.isLoading,
      runOnlyOncePerCustomer: value,
      currentIndex: state.currentIndex,
      customAudience: state.customAudience,
    );
  }

  updateCustomAudience(bool value) {
    state = SubmissionState(
      submissions: state.submissions,
      isLoading: state.isLoading,
      runOnlyOncePerCustomer: state.runOnlyOncePerCustomer,
      currentIndex: state.currentIndex,
      customAudience: value,
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _subjectController.dispose();
    _previewTextController.dispose();
    _fromNameController.dispose();
    _emailController.dispose();
    super.dispose();
  }
}

final List<FormStepsModel> formSteps = [
  FormStepsModel(
    title: 'Create New Campaign',
    label: 'Fill out these details to build and get your campaign ready',
    formWidgetBuilder: (ref) => CampaignForm(ref: ref),
    status: false,
  ),
  FormStepsModel(
    title: 'Create Segments',
    label: 'Get full control over your audience',
    formWidgetBuilder: (ref) => CampaignForm(ref: ref),
    status: false,
  ),
  FormStepsModel(
    title: 'Bidding Strategy',
    label: 'Optimize your campaign reach with adsense',
    formWidgetBuilder: (ref) => CampaignForm(ref: ref),
    status: false,
  ),
  FormStepsModel(
    title: 'Site Links',
    label: 'Setup your customer journey flow',
    formWidgetBuilder: (ref) => CampaignForm(ref: ref),
    status: false,
  ),
  FormStepsModel(
    title: 'Review Campaign',
    label: 'Double check your campaign is ready to go!',
    formWidgetBuilder: (ref) => CampaignForm(ref: ref),
    status: false,
  ),
];

enum Status { pending, completed }

class SubmissionState {
  final List<Submission> submissions;
  final bool isLoading;
  final int currentIndex;
  bool runOnlyOncePerCustomer;
  bool customAudience;

  SubmissionState(
      {required this.submissions,
      required this.isLoading,
      this.currentIndex = 0,
      this.runOnlyOncePerCustomer = false,
      this.customAudience = false});
}
