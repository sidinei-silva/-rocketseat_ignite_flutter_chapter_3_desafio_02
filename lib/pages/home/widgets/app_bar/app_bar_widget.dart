import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:split_it/pages/home/widgets/app_bar/widgets/button_add/button_add_widget.dart';
import 'package:split_it/pages/home/widgets/app_bar/widgets/card_balance/card_balance_widget.dart';
import 'package:split_it/pages/login/models/user_model.dart';
import 'package:split_it/theme/app_theme.dart';

class AppBarWidget extends PreferredSize {
  final UserModel user;
  AppBarWidget({required this.user})
      : super(
          preferredSize: Size.fromHeight(290),
          child: Container(
            color: AppTheme.colors.backgroundPrimary,
            child: Stack(
              children: [
                Container(
                  height: 244,
                  color: AppTheme.colors.backgroundSecondary,
                ),
                SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        color: AppTheme.colors.backgroundSecondary,
                        padding: const EdgeInsets.symmetric(horizontal: 19),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    user.photoUrl!,
                                    width: 56,
                                  ),
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                Text(
                                  "${user.name}",
                                  style: AppTheme.textStyles.userNameAppBar,
                                )
                              ],
                            ),
                            ButtonAddWidget(
                              onTap: () {},
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 36,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 19),
                        child: Row(
                          children: [
                            CardBalanceWidget.receivable(value: 124),
                            SizedBox(
                              width: 15,
                            ),
                            CardBalanceWidget.payable(value: 48),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
}
