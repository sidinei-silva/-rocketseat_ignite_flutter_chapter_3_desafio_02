import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:split_it/theme/app_theme.dart';

class SocialButtonWidget extends StatelessWidget {
  final String label;
  final String pathImage;
  final VoidCallback onPressed;

  const SocialButtonWidget({
    Key? key,
    required this.label,
    required this.pathImage,
    required this.onPressed,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.white),
      ),
      onPressed: onPressed,
      child: Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 57,
              child: Row(
                children: [
                  Image.asset(
                    pathImage,
                    width: 24,
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Container(
                    width: 1,
                    color: AppTheme.colors.border,
                  )
                ],
              ),
            ),
            Expanded(
              child: Text(
                label,
                style: AppTheme.textStyles.button,
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
