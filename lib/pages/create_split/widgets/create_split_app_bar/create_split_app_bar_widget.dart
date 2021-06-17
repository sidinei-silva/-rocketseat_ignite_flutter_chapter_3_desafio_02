import 'package:flutter/material.dart';
import 'package:split_it/theme/app_theme.dart';

class CreateSplitAppBarWidget extends PreferredSize {
  final VoidCallback onTapBack;
  final int actualPage;
  final int lengthPages;

  CreateSplitAppBarWidget({
    required this.actualPage,
    required this.lengthPages,
    required this.onTapBack,
  }) : super(
          preferredSize: Size.fromHeight(100),
          child: SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: AppTheme.colors.backButton,
                    ),
                    onPressed: onTapBack,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 24),
                  child: Text.rich(
                    TextSpan(
                      text: "0$actualPage",
                      style: AppTheme.textStyles.stepIndicatorPrimary,
                      children: [
                        TextSpan(
                          text: "- 0$lengthPages",
                          style: AppTheme.textStyles.stepIndicatorSecondary,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
}
