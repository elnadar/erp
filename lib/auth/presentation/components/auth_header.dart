import 'package:flutter/material.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({
    Key? key,
    required this.child,
    this.backgroundImage,
  }) : super(key: key);
  final Widget child;
  final Widget? backgroundImage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: 250,
        child: Card(
          clipBehavior: Clip.antiAlias,
          child: Stack(
            children: [
              backgroundImage ??
                  Image.asset(
                    "assets/images/mat.jpg",
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
              Center(
                child: child,
              ),
            ],
          ),
        ));
  }
}
