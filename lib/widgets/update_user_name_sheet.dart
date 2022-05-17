import 'package:blog_app_2/ui/user_profile/user_profile_vm.dart';
import 'package:blog_app_2/utils/app_colors.dart';
import 'package:blog_app_2/widgets/app_button.dart';
import 'package:blog_app_2/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class UpdateUserNameSheet extends StatelessWidget {
  const UpdateUserNameSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<UserProfileVm>.reactive(
      viewModelBuilder: () => UserProfileVm(),
      builder: (context, vm, _) => Container(
        padding: const EdgeInsets.all(16),
        child: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Update user name',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 21,
                  color: AppColors.primaryColor,
                ),
              ),
              AppTextField(
                controller: vm.nameController,
                label: 'User name',
              ),
              const SizedBox(
                height: 16,
              ),
              AppButton.expanded(
                label: 'Update',
                onTap: vm.validateUserName,
                isLoading: vm.isUpdatingUserName,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
