import 'package:flutter/material.dart';
import 'package:split_it/core/app_images.dart';
import 'package:split_it/shared/format_helper.dart';

import 'package:split_it/theme/app_theme.dart';

class CardBalanceWidget extends StatelessWidget {
  final double value;
  final TextStyle _style;
  final String _label;
  final String _icon;
  final Color _color;

  CardBalanceWidget.receivable({required double value})
      : this.value = value,
        this._style = AppTheme.textStyles.cardBalanceValueReceivable,
        this._label = "A receber",
        this._icon = AppImages.receivableIcon,
        this._color = AppTheme.colors.cardBalanceValueReceivable;

  CardBalanceWidget.payable({required double value})
      : this.value = value,
        this._style = AppTheme.textStyles.cardBalanceValuePayable,
        this._label = "A pagar",
        this._icon = AppImages.payableIcon,
        this._color = AppTheme.colors.cardBalanceValuePayable;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 168,
        decoration: BoxDecoration(
          color: AppTheme.colors.backgroundPrimary,
          borderRadius: BorderRadius.circular(10),
          border: Border.fromBorderSide(
            BorderSide(
              width: 1,
              color: AppTheme.colors.border,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: _color.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Image.asset(_icon),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _label,
                    style: AppTheme.textStyles.cardBalanceLabel,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    FormatHelper.formatCurrency(value),
                    style: _style,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
