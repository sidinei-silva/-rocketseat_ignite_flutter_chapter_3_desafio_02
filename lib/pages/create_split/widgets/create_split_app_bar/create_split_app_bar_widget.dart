import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:split_it/pages/create_split/create_split_controller.dart';
import 'package:split_it/theme/app_theme.dart';

class CreateSplitAppBarWidget extends PreferredSize {
  final VoidCallback onTapBack;
  final CreateSplitController controller;
  final int lengthPages;

  CreateSplitAppBarWidget({
    required this.onTapBack,
    required this.controller,
    required this.lengthPages,
  }) : super(
          preferredSize: Size.fromHeight(100),
          child: SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Observer(
                      builder: (_) {
                        if (controller.currentPage > 0) {
                          return IconButton(
                            icon: Icon(
                              Icons.arrow_back,
                              color: AppTheme.colors.backButton,
                            ),
                            onPressed: onTapBack,
                          );
                        } else {
                          return BackButton(
                            color: AppTheme.colors.backButton,
                          );
                        }
                      },
                    )),
                Padding(
                    padding: const EdgeInsets.only(right: 24),
                    child: Observer(
                      builder: (_) {
                        return Text.rich(
                          TextSpan(
                            text: "0${controller.currentPage + 1}",
                            style: AppTheme.textStyles.stepIndicatorPrimary,
                            children: [
                              TextSpan(
                                text: "- 0$lengthPages",
                                style:
                                    AppTheme.textStyles.stepIndicatorSecondary,
                              )
                            ],
                          ),
                        );
                      },
                    )),
              ],
            ),
          ),
        );
}
