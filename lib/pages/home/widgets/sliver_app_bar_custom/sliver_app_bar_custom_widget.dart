import 'package:flutter/material.dart';
import 'package:split_it/pages/home/widgets/app_bar/widgets/balance_app_bar/balance_app_bar.dart';
import 'package:split_it/theme/app_theme.dart';

class SliverAppBarCustom extends StatelessWidget {
  const SliverAppBarCustom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: AppTheme.colors.backgroundPrimary,
      expandedHeight: 190,
      pinned: false,
      floating: false,
      forceElevated: false,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.pin,
        stretchModes: [StretchMode.blurBackground],
        background: Stack(
          children: [
            Container(
              height: 90,
              color: AppTheme.colors.backgroundSecondary,
            ),
            BalanceAppBar()
          ],
        ),
      ),
    );
  }
}
