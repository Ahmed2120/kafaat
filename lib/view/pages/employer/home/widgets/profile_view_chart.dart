import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:kafaat/core/core_exports.dart';
import 'package:kafaat/providers/dashboard_provider.dart';
import 'package:kafaat/view/widgets/main_text.dart';

class ProfileViewChart extends StatefulWidget {
  const ProfileViewChart({
    super.key,
  });

  @override
  State<ProfileViewChart> createState() => _ProfileViewChartState();
}

class _ProfileViewChartState extends State<ProfileViewChart> {
  LineTouchData get lineTouchData1 => const LineTouchData(
        handleBuiltInTouches: true,
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: AppColors.yWhiteColor,
          tooltipBorder: BorderSide(color: AppColors.yGreyColor),
        ),
      );

  SideTitles leftTitles(List<double> values) => SideTitles(
        showTitles: true,
        interval: 1,
        reservedSize: 30,
        getTitlesWidget: (value, meta) {
          if (value / 50 != value ~/ 50) {
            return const SizedBox();
          }
          return MainText(
            text: '${value.toInt()}',
            font: 16,
            weight: FontWeight.w400,
            color: AppColors.yBodyColor,
          );
        },
      );

  SideTitles bottomTitles(List<String> labels) => SideTitles(
        showTitles: true,
        reservedSize: 50,
        interval: 1,
        getTitlesWidget: (value, meta) {
          return SideTitleWidget(
            axisSide: meta.axisSide,
            space: 10,
            child: RotatedBox(
              quarterTurns: 1,
              child: MainText(
                text: value.toInt() >= labels.length
                    ? ''
                    : labels[value.toInt()].substring(0, 5),
                font: 12,
                weight: FontWeight.w400,
                maxLines: 1,
                color: AppColors.yBodyColor,
              ),
            ),
          );
        },
      );

  FlGridData get gridData => FlGridData(
        drawVerticalLine: false,
        horizontalInterval: 50,
        getDrawingHorizontalLine: (value) {
          return const FlLine(
            strokeWidth: 0.75,
            dashArray: [10, 0],
            color: AppColors.yGreyBlckColor,
          );
        },
      );

  FlBorderData get borderData => FlBorderData(
        show: true,
        border: const Border(
          bottom: BorderSide(color: AppColors.yGreyBlckColor, width: 0.5),
          left: BorderSide(color: Colors.transparent),
          right: BorderSide(color: Colors.transparent),
          top: BorderSide(color: Colors.transparent),
        ),
      );

  @override
  Widget build(BuildContext context) {
    final dashboard = DashboardProvider.get(context);
    return SizedBox(
      height: 250,
      width: context.width,
      child: LineChart(
        LineChartData(
          lineTouchData: lineTouchData1,
          gridData: gridData,
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(
              sideTitles: bottomTitles(
                  dashboard.dashboardModel!.viewsChartData!.labels!),
            ),
            rightTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            topTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            leftTitles: AxisTitles(
              sideTitles: leftTitles(
                  dashboard.dashboardModel!.viewsChartData!.datasets![0].data!),
            ),
          ),
          borderData: borderData,
          lineBarsData: [
            LineChartBarData(
              isCurved: true,
              color: AppColors.yPrimaryColor,
              barWidth: 4,
              isStrokeCapRound: true,
              dotData: const FlDotData(show: false),
              belowBarData: BarAreaData(show: false),
              spots: List.generate(
                dashboard.dashboardModel!.viewsChartData!.labels!.length,
                (i) {
                  double y = dashboard
                      .dashboardModel!.viewsChartData!.datasets![0].data![i];
                  return FlSpot(i.toDouble(), y);
                },
              ),
            ),
            // lineChartBarData1_2,
          ],
          minX: 0,
          maxX: 10,
          maxY: dashboard.dashboardModel!.viewsChartData!.datasets![0].data!
                  .reduce(max) +
              100,
          minY: 0,
        ),
        duration: const Duration(milliseconds: 250),
      ),
    );
  }
}
