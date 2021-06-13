import 'package:flutter/material.dart';
import 'package:split_it/pages/home/widgets/icon_dollar/icon_dollar_widget.dart';
import 'package:split_it/shared/format_helper.dart';
import 'package:split_it/shared/models/event_model.dart';
import 'package:split_it/shared/widgets/loading_shimmer/loading_shimmer_widget.dart';
import 'package:split_it/theme/app_theme.dart';

class EventTileWidget extends StatelessWidget {
  final EventModel data;
  final bool isLoading;

  String get peopleFormatted =>
      data.people > 1 ? '${data.people} pessoas' : '${data.people} pessoa';

  IconDollarType get iconDollarType =>
      data.money >= 0 ? IconDollarType.receive : IconDollarType.send;

  const EventTileWidget({
    this.isLoading = false,
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 24),
            title: LoadingShimmerWidget(
              size: Size(81, 19),
            ),
            subtitle: LoadingShimmerWidget(
              size: Size(10, 18),
            ),
            leading: LoadingShimmerWidget(
              size: Size(40, 40),
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                LoadingShimmerWidget(
                  size: Size(61, 17),
                ),
                LoadingShimmerWidget(
                  size: Size(44, 18),
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 24),
          title: Text(
            data.title,
            style: AppTheme.textStyles.eventTileTitle,
          ),
          subtitle: Text(
            FormatHelper.formatDateToDayAndMonthExtensive(data.date),
            style: AppTheme.textStyles.eventTileDate,
          ),
          leading: IconDollarWidget(
            iconDollarType: iconDollarType,
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                FormatHelper.formatCurrency(data.money),
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
