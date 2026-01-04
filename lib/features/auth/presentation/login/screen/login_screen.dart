import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/core/app_theme/colors.dart';
import 'package:flutter_template/core/app_theme/theme_context_extensions.dart';
import 'package:flutter_template/core/injection/injection.dart';
import 'package:flutter_template/core/routes/app_routes.gr.dart';
import 'package:flutter_template/core/utils/extensions/context_extension.dart';
import 'package:flutter_template/core/utils/extensions/ui_extension.dart';
import 'package:flutter_template/core/validations/string_validation_extension.dart';
import 'package:flutter_template/core/widgets/custom_button.dart' hide TextButton;
import 'package:flutter_template/core/widgets/custom_textfield.dart';
import 'package:flutter_template/features/auth/presentation/login/cubit/login_cubit.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final loginFormKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LoginCubit>(),
      child: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          state.maybeWhen(
            orElse: () {},
            success: (authEntity) async {
              context.router.replaceAll([const DashboardRoute()]);
            },
            error: (error) {
              context.snack(message: error, backgroundColor: AppColors.errorDark);
            },
          );
        },
        child: Form(
          key: loginFormKey,
          child: Column(
            spacing: 16,
            crossAxisAlignment: .center,
            mainAxisSize: .min,
            children: [
              Text(
                context.l10n.login,
                style: context.textTheme.displayMedium?.copyWith(color: AppColors.black),
              ),
              RichText(
                text: TextSpan(
                  text: context.l10n.dontHaveAnAccount,
                  style: context.textTheme.bodyLarge?.copyWith(color: AppColors.black),
                  children: [
                    WidgetSpan(child: 5.horizontalBox),
                    TextSpan(
                      text: context.l10n.signup,
                      style: context.textTheme.bodyLarge?.copyWith(
                        color: AppColors.secondary,
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.secondary,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // Navigate to Signup Screen
                        },
                    ),
                  ],
                ),
              ),
              CustomTextField(
                controller: emailController..text = 'example@example.com',
                titleLabel: context.l10n.email,
                hintText: context.l10n.enterEmail,
                keyboardType: TextInputType.emailAddress,
                fillColor: AppColors.white,
                validator: (value) => value.emailValidationError,
              ),
              CustomTextField(
                controller: passwordController..text = 'Example@123',
                titleLabel: context.l10n.password,
                hintText: "******",
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                fillColor: AppColors.white,
                validator: (value) => value.passwordValidationError,
              ),

              Row(
                mainAxisAlignment: .start,
                children: [
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      // Navigate to Forgot Password Screen
                    },
                    child: Text(
                      context.l10n.forgetPassword,
                      style: context.textTheme.bodyMedium?.copyWith(color: AppColors.secondary),
                    ),
                  ),
                ],
              ),
              BlocBuilder<LoginCubit, LoginState>(
                builder: (context, state) {
                  return CustomButton.primary(
                    text: context.l10n.login,
                    isLoading: state.maybeWhen(loading: () => true, orElse: () => false),
                    onPressed: () async {
                      if (loginFormKey.currentState?.validate() ?? false) {
                        await context.read<LoginCubit>().login(
                          email: emailController.text.trim(),
                          password: passwordController.text.trim(),
                        );
                      }
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    ).pad(20);
  }
}
