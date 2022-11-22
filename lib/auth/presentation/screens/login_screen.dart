import 'package:erp/auth/presentation/components/auth_header.dart';
import 'package:erp/components/text_weights.dart';
import 'package:erp/utils/localization/ar.dart';
import 'package:flutter/material.dart';

import '../components/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: CustomScrollView(slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  children: const [
                    Spacer(flex: 3),
                    AuthHeader(
                      child: H1(ArabicLangLoc.loginScreenTitleText),
                    ),
                    SizedBox(height: 32),
                    LoginForm(),
                    Spacer(flex: 3)
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
