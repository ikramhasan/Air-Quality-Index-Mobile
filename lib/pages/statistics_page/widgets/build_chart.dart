import 'package:aqi/data/data.dart';
import 'package:aqi/models/air_quality_index.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

buildChart({String text, List<O3> list, String labelFormat, AirQualityIndex aqi}) {
    return SfCartesianChart(
      title: ChartTitle(text: text),
      primaryXAxis: NumericAxis(
          interval: 1,
          majorGridLines: MajorGridLines(width: 0),
          labelFormat:
              '{value} \n${DateFormat('MMM').format(aqi.data.time.iso)}',
          edgeLabelPlacement: EdgeLabelPlacement.shift),
      primaryYAxis: NumericAxis(
        labelFormat: labelFormat,
        axisLine: AxisLine(width: 0),
        majorTickLines: MajorTickLines(size: 0),
      ),
      series: getSplieAreaSeries(aqi, list),
      tooltipBehavior: TooltipBehavior(enable: true),
    );
  }