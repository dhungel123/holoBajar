
import 'package:flutter/material.dart';

import '../../../../core/constants/assets.dart';
import '../../../../core/constants/routes.dart';

class SplashWidget extends StatelessWidget {
  const SplashWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        color: Colors.white,
        width: _width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                 MyRoutes.login,
                      (route) => false,
                );
              },
              child: Image.asset(
                Assets.logo,
                height: 260,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
