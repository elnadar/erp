import 'package:erp/components/custom_buttons.dart';
import 'package:erp/utils/localization/ar.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: [
        TextFormField(
          textDirection: TextDirection.ltr,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.email_outlined),
            hintText: ArabicLangLoc.loginScreenEmailFieldHint,
            labelText: ArabicLangLoc.loginScreenEmailFieldLabel,
          ),
        ),
        const SizedBox(height: 24),
        TextFormField(
          textDirection: TextDirection.ltr,
          keyboardType: TextInputType.visiblePassword,
          textInputAction: TextInputAction.done,
          obscureText: true,
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.lock),
            hintText: ArabicLangLoc.loginScreenPasswordFieldHint,
            labelText: ArabicLangLoc.loginScreenPasswordFieldLabel,
          ),
        ),
        const SizedBox(height: 24),
        SizedBox(
          width: double.infinity,
          child: FilledButton(
            onPressed: () {},
            child: const Text(ArabicLangLoc.loginScreenButtonText),
          ),
        )
      ],
    ));
  }
}
