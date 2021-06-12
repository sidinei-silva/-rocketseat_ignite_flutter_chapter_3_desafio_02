import 'package:flutter/material.dart';
import 'package:split_it/pages/home/widgets/icon_dollar/icon_dollar_widget.dart';
import 'package:split_it/shared/format_helper.dart';
import 'package:split_it/theme/app_theme.dart';

class EventTileWidget extends StatelessWidget {
  final String title;
  final DateTime date;
  final double money;
  final int people;

  String get peopleFormatted =>
      people > 1 ? '$people pessoas' : '$people pessoa';

  const EventTileWidget({
    Key? key,
    required this.title,
    required this.date,
    required this.money,
    required this.people,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 24),
          title: Text(
            title,
            style: AppTheme.textStyles.eventTileTitle,
          ),
          subtitle: Text(
            FormatHelper.formatDateToDayAndMonthExtensive(date),
            style: AppTheme.textStyles.eventTileDate,
          ),
          leading: IconDollarWidget(
            iconDollarType: IconDollarType.receive,
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                FormatHelper.formatCurrency(money),
                style: AppTheme.textStyles.eventTileMoney,
              ),
              Text(
                peopleFormatted,
                style: AppTheme.textStyles.eventTilePeople,
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.only(right: 24),
          width: MediaQuery.of(context).size.width - 90,
          child: Divider(
            thickness: 1,
            color: AppTheme.colors.eventTileDivider.withOpacity(0.2),
          ),
        ),
      ],
    );
  }
}
