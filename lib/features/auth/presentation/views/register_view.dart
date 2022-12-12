import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yabalash_mobile_app/core/widgets/custom_dialog.dart';
import 'package:yabalash_mobile_app/features/auth/presentation/widgets/account_problem_bottom_bar.dart';

import '../../../../core/theme/light/app_colors_light.dart';
import '../widgets/register_body.dart';

final _formKey = GlobalKey<FormBuilderState>();

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: RegisterBody(), bottomNavigationBar: AccountProblemBottomBar());
  }
}
