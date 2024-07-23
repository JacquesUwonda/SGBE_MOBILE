import 'package:flutter/material.dart';
import 'package:sgbe/core/theme/app_color.dart';
import 'package:sgbe/core/utils_constants/app_string.dart';
import 'package:sgbe/core/utils_constants/validationsRules.dart';
import 'package:sgbe/core/widgets/custom_text_form_field.dart';
import 'package:sgbe/core/widgets/rounded_elevated_button.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _registerFormKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isPasswordVisible = false;

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backGroundColor,
      body: Center(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 20,
              ),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
                color: AppColor.whiteColor,
              ),
              child: Column(
                children: [
                  const Text(
                    AppString.inscriptionText,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Form(
                    key: _registerFormKey,
                    child: Column(
                      children: [
                        CustomTextFormField(
                          controller: _firstNameController,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return AppString.required;
                            }
                            return null;
                          },
                          keyboardType: TextInputType.name,
                          obscureText: false,
                          prefix: const Icon(Icons.person_2_outlined),
                          suffix: null,
                          hintText: AppString.firstname,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        CustomTextFormField(
                          controller: _lastNameController,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return AppString.required;
                            }
                            return null;
                          },
                          keyboardType: TextInputType.name,
                          obscureText: false,
                          prefix: const Icon(Icons.person_2_outlined),
                          suffix: null,
                          hintText: AppString.lastname,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        CustomTextFormField(
                          controller: _emailController,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return AppString.required;
                            } else if (!ValidationRules.emailValidation
                                .hasMatch(val)) {
                              return AppString.provideValidEmail;
                            }
                            return null;
                          },
                          keyboardType: TextInputType.emailAddress,
                          obscureText: false,
                          prefix: const Icon(Icons.email_outlined),
                          suffix: null,
                          hintText: AppString.email,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextFormField(
                          controller: _passwordController,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return AppString.required;
                            }
                            return null;
                          },
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: !isPasswordVisible,
                          prefix: const Icon(Icons.lock_outline),
                          suffix: InkWell(
                            onTap: () {
                              setState(() {
                                isPasswordVisible = !isPasswordVisible;
                              });
                            },
                            child: Icon(
                              isPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: AppColor.greyColor,
                            ),
                          ),
                          hintText: AppString.password,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        RoundedElevatedButton(
                          buttonText: AppString.register,
                          onPressed: () {
                            if (_registerFormKey.currentState!.validate()) {}
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
