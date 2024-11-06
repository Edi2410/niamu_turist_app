import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:niamu_project/core/di.dart';
import 'package:niamu_project/core/route_generator.dart';
import 'package:niamu_project/core/style/style_extensions.dart';
import 'package:niamu_project/feature/auth/presentation/widget/sign_in_form.dart';

class SignInScreen extends ConsumerStatefulWidget {
  const SignInScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                child: Image(
                  image: AssetImage('assets/images/login_image.png'),
                ),
              ),
              Text(
                "Please sign in to your account.",
                style: context.textStandard,
              ),
              const SizedBox(height: 20),
              const SignInForm(),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: context.textStandard,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(RouteGenerator.signUpScreen);
                    },
                    child: Text(
                      "Sign up",
                      style: context.textStandard.copyWith(
                        color: context.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}
