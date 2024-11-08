import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mvvp_riverpod_machine_test/const.dart';
import 'package:mvvp_riverpod_machine_test/screens/model/submission_model.dart';
import 'package:mvvp_riverpod_machine_test/screens/view/widgets/custom_button.dart';
import 'package:mvvp_riverpod_machine_test/screens/view/widgets/custom_list_tile.dart';
import 'package:mvvp_riverpod_machine_test/screens/view/widgets/custome_text_field.dart';
import 'package:mvvp_riverpod_machine_test/screens/view/widgets/switch_text.dart';
import 'package:mvvp_riverpod_machine_test/screens/view_model/todo_view_model.dart';
import 'package:mvvp_riverpod_machine_test/service/shared_preference.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    // TODO: implement initState
    await Future.delayed(const Duration(seconds: 1), () {});
    ref.read(submissionViewModelProvider.notifier).loadSubmissions(ref);
  }

  @override
  Widget build(BuildContext context) {
    // Listening to the list of to-dos from the ViewModel.
    final submissionVieew = ref.watch(submissionViewModelProvider);

    return Scaffold(
      backgroundColor: Colors.grey,
      body: submissionVieew.isLoading // Check isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            ) // Show loading indicator
          : Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IntrinsicHeight(
                    child: Row(
                      children: [
                        formSteps[submissionVieew.currentIndex].formWidgetBuilder(ref),
                        SizedBox(
                          width: 400,
                          child: Card(
                            margin: const EdgeInsets.all(18),
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    child: Column(
                                      children: List.generate(
                                        formSteps.length,
                                        (index) => CustomeListTile(
                                          count: "${index + 1}",
                                          title: formSteps[index].title,
                                          subtitle: formSteps[index].label,
                                          selected: index == submissionVieew.currentIndex,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Spacer(),
                                  const Text("Need Help?"),
                                  const Text(
                                    "Get to know how your campaign",
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  const Text(
                                    "Can reach a wide audience",
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  const SizedBox(height: 15),
                                  const CustomButton(
                                    text: "Contact Us",
                                    borderSideColor: Colors.black,
                                    textColor: Colors.black,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

class CampaignForm extends StatefulWidget {
  final VoidCallback? onPressed;
  final WidgetRef ref;

  const CampaignForm({
    required this.ref,
    this.onPressed,
    super.key,
  });

  @override
  State<CampaignForm> createState() => _CampaignFormState();
}

class _CampaignFormState extends State<CampaignForm> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      child: Card(
        margin: const EdgeInsets.all(padding),
        child: Padding(
          padding: const EdgeInsets.all(padding),
          child: Form(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Create New Email Campaign",
                  // style: Theme.of(context).textTheme.headlineMedium,
                ),
                const Text(
                  "Fill out these details to build your brodcast",
                ),
                CustomTextField(
                  label: "Campaign Subject",
                  hintText: "Enter Subject",
                  onChanged: (value) => widget.ref.watch(campaignSubjectProvider.notifier).state = value,
                  controller: widget.ref.watch(submissionViewModelProvider.notifier).subjectController,
                ),
                const SizedBox(height: padding),
                CustomTextField(
                  label: "Preview Text",
                  hintText: "Enter Preview Text",
                  helperText: "Keep this simple of 50 characters",
                  onChanged: (value) => widget.ref.watch(previewTextProvider.notifier).state = value,
                  maxLines: 3,
                  maxLength: 50,
                  controller: widget.ref.watch(submissionViewModelProvider.notifier).previewTextController,
                ),
                const SizedBox(height: padding),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        label: "\"From\" Name",
                        hintText: "From Anne",
                        onChanged: (value) => widget.ref.watch(fromNameProvider.notifier).state = value,
                        controller: widget.ref.watch(submissionViewModelProvider.notifier).fromNameController,
                      ),
                    ),
                    const SizedBox(width: padding - 5),
                    Expanded(
                      child: CustomTextField(
                        label: "\"From\" Email",
                        hintText: "Anne@example.com",
                        maxLines: 1,
                        controller: widget.ref.watch(submissionViewModelProvider.notifier).emailController,
                        onChanged: (value) => widget.ref.watch(emailProvider.notifier).state = value,
                        validator: (value) {
                          final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                          return emailRegExp.hasMatch(value!) ? null : 'Enter a valid email';
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: padding),
                const Divider(),
                const SizedBox(height: padding),
                SwitchWithText(
                  label: "Run only once per customer",
                  value: widget.ref.watch(readOnlyOncePerCustomer),
                  onChanged: (value) => widget.ref.watch(readOnlyOncePerCustomer.notifier).state = value,
                ),
                SwitchWithText(
                  label: "Custom audience",
                  value: widget.ref.watch(customAudience),
                  onChanged: (value) => widget.ref.watch(customAudience.notifier).state = value,
                ),
                const SizedBox(height: padding),
                FittedBox(
                  child: Row(
                    children: [
                      const Text("You can set up a "),
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                        ),
                        child: const Text("custome domain or connect your email service provider "),
                      ),
                      const Text("to changethis."),
                    ],
                  ),
                ),
                const SizedBox(height: padding),
                Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        text: "Save Draft",
                        onPressed: () {
                          final formValidation = widget.ref.read(submissionViewModelProvider.notifier).validate();
                          if (formValidation) {
                            final submissionsJson = widget.ref
                                .read(submissionViewModelProvider)
                                .submissions
                                .map((e) => e.toJson())
                                .toList();
                            SharedPreferenceService.setToken(jsonEncode(submissionsJson));
                          } else {
                            ScaffoldMessenger.of(context).clearSnackBars();
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  "Please fill out all the fields",
                                ),
                                behavior: SnackBarBehavior.floating,
                                width: 300,
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
                        },
                      ),
                    ),
                    const SizedBox(width: padding),
                    Expanded(
                      flex: 2,
                      child: CustomButton(
                        text: "Next Step",
                        filled: true,
                        onPressed: () {
                          final formValidation = widget.ref.read(submissionViewModelProvider.notifier).validate();
                          if (formValidation) {
                            final currentIndex = widget.ref.read(submissionViewModelProvider).currentIndex;
                            if (currentIndex != formSteps.length - 1) {
                              widget.ref.read(submissionViewModelProvider.notifier).addSubmission(Submission(
                                    email: widget.ref.read(emailProvider),
                                    from: widget.ref.read(fromNameProvider),
                                    subject: widget.ref.read(campaignSubjectProvider),
                                    previewText: widget.ref.read(previewTextProvider),
                                    runOnlyOncePerCustomer: widget.ref.read(readOnlyOncePerCustomer),
                                    customAudience: widget.ref.read(customAudience),
                                  ));

                              widget.ref.read(submissionViewModelProvider.notifier).clearData();

                              widget.ref.read(campaignSubjectProvider.notifier).state = '';
                              widget.ref.read(previewTextProvider.notifier).state = '';
                              widget.ref.read(fromNameProvider.notifier).state = '';
                              widget.ref.read(emailProvider.notifier).state = '';
                              widget.ref.read(readOnlyOncePerCustomer.notifier).state = false;
                              widget.ref.read(customAudience.notifier).state = false;
                              widget.ref.read(submissionViewModelProvider.notifier).updateCuttentIndex();
                            }
                          } else {
                            ScaffoldMessenger.of(context).clearSnackBars();
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  "Please fill out all the fields",
                                ),
                                behavior: SnackBarBehavior.floating,
                                width: 300,
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
                        },
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
