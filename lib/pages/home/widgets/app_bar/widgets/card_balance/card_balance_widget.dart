import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:split_it/pages/home/widgets/icon_dollar/icon_dollar_widget.dart';
import 'package:split_it/shared/format_helper.dart';
import 'package:split_it/theme/app_theme.dart';

class CardBalanceWidget extends StatelessWidget {
  final double value;
  final bool isLoading;

  const CardBalanceWidget({
    Key? key,
    required this.value,
    this.isLoading = false,
  }) : super(key: key);

  TextStyle get textStyle => value >= 0
      ? AppTheme.textStyles.cardBalanceValueReceivable
      : AppTheme.textStyles.cardBalanceValuePayable;

  String get label => value >= 0 ? 'A receber' : 'A pagar';

  IconDollarWidget get iconDollar => value >= 0
      ? IconDollarWidget(
          iconDollarType: IconDollarType.receive,
        )
      : IconDollarWidget(
          iconDollarType: IconDollarType.send,
        );

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
              iconDollar,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: AppTheme.textStyles.cardBalanceLabel,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  if (isLoading) ...[
                    Opacity(
                      opacity: 0.5,
                      child: Shimmer.fromColors(
                        baseColor: Colors.grey.shade300,
                        highlightColor: Colors.grey.shade100,
                        child: Container(
                          height: 24,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ] else ...[
                    Text(
                      FormatHelper.formatCurrency(value),
                      style: textStyle,
                    )
                  ],
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
