import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:split_it/pages/home/widgets/app_bar/widgets/button_add/button_add_widget.dart';
import 'package:split_it/pages/home/widgets/app_bar/widgets/card_balance/card_balance_widget.dart';
import 'package:split_it/pages/login/models/user_model.dart';
import 'package:split_it/theme/app_theme.dart';

class AppBarWidget extends PreferredSize {
  final UserModel user;
  final VoidCallback buttonAddOnTap;
  AppBarWidget({required this.user, required this.buttonAddOnTap})
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
                        padding: const EdgeInsets.symmetric(horizontal: 9),
                        child: ListTile(
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              user.photoUrl!,
                              width: 56,
                            ),
                          ),
                          title: Text(
                            "${user.name}",
                            style: AppTheme.textStyles.userNameAppBar,
                          ),
                          trailing: ButtonAddWidget(
                            onTap: buttonAddOnTap,
                          ),
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
