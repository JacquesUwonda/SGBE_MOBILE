import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sgbe/core/routes/route_names.dart';
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
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isPasswordVisible = false;

  @override
  void dispose() {
    _nameController.dispose();
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
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Form(
                    key: _registerFormKey,
                    child: Column(
                      children: [
                        CustomTextFormField(
                          controller: _nameController,
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
                          hintText: AppString.nom,
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
                              color: AppColor.secondColor,
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
                        const SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            context.pushNamed(RouteNames.login);
                          },
                          child: RichText(
                            text: const TextSpan(
                              text: AppString.oldUser,
                              style: TextStyle(color: AppColor.greyColor),
                              children: [
                                TextSpan(
                                  text: AppString.login,
                                  style: TextStyle(
                                    color: AppColor.secondColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
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
