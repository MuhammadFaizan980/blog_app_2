import 'package:blog_app_2/ui/create_post/create_post_vm.dart';
import 'package:blog_app_2/widgets/app_button.dart';
import 'package:blog_app_2/widgets/app_text_field.dart';
import 'package:blog_app_2/widgets/application_app_bar.dart';
import 'package:blog_app_2/widgets/post_image_selector.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class CreatePostScreen extends StatelessWidget {
  static const String routeName = 'create_post';

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CreatePostVm>.reactive(
      viewModelBuilder: () => CreatePostVm(),
      builder: (context, vm, _) => Scaffold(
        appBar: getAppBar(title: 'Create new post'),
        body: SingleChildScrollView(
          child: Column(
            children: [
              PostImageSelector(),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    AppTextField(
                      controller: vm.titleController,
                      label: 'Post title here.....',
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    AppTextField(
                      controller: vm.descriptionController,
                      label: 'Post description here.....',
                    ),
                    const SizedBox(
                      height: 55,
                    ),
                    AppButton.expanded(
                      label: 'Create Post',
                      onTap: vm.validateInputs,
                      isLoading: vm.isLoading,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
