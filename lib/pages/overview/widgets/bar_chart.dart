/// Bar chart example
import 'package:flutter/material.dart';

import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

// class SimpleBarChart extends StatelessWidget {
//   final List<charts.Series> seriesList;
//   final bool animate;
//
//   SimpleBarChart(this.seriesList, {this.animate});
//
//   /// Creates a [BarChart] with sample data and no transition.
//   factory SimpleBarChart.withSampleData() {
//     return new SimpleBarChart(
//       _createSampleData(),
//       // Disable animations for image tests.
//       animate: false,
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return new charts.BarChart(
//       seriesList,
//       animate: animate,
//     );
//   }
//
//   /// Create one series with sample hard coded data.
//   static List<charts.Series<OrdinalSales, String>> _createSampleData() {
//     final data = [
//       new OrdinalSales('Today', 55),
//       new OrdinalSales('Yesterday', 25),
//       new OrdinalSales('2 days', 100),
//       new OrdinalSales('24 Jun', 75),
//       new OrdinalSales('23 Jun', 15),
//       new OrdinalSales('22 Jun', 85),
//       new OrdinalSales('21 Jun', 45),
//     ];
//
//     return [
//       new charts.Series<OrdinalSales, String>(
//         id: 'Sales',
//         colorFn: (_, __) => charts.ColorUtil.fromDartColor(active),
//         domainFn: (OrdinalSales sales, _) => sales.year,
//         measureFn: (OrdinalSales sales, _) => sales.sales,
//         data: data,
//       )
//     ];
//   }
// }

/// Sample ordinal data type.
class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}

class GraphView extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  GraphView({Key? key}) : super(key: key);

  @override
  _GraphViewState createState() => _GraphViewState();
}

class _GraphViewState extends State<GraphView> {
  List<_SalesData> data = [
    _SalesData('1', 35),
    _SalesData('2', 28),
    _SalesData('3', 34),
    _SalesData('4', 32),
    _SalesData('5', 40)
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      width: 600,
      child: SfCartesianChart(
          primaryXAxis: CategoryAxis(),

          // Chart title
          // title: ChartTitle(text: 'Half yearly sales analysis'),
          // Enable legend
          // legend: Legend(isVisible: true),
          // Enable tooltip
          tooltipBehavior: TooltipBehavior(enable: true),
          series: <ChartSeries<_SalesData, String>>[
            SplineSeries<_SalesData, String>(
                dataSource: data,
                xValueMapper: (_SalesData sales, _) => sales.year,
                yValueMapper: (_SalesData sales, _) => sales.sales,
                name: 'Sales',
                // Enable data label
                dataLabelSettings: DataLabelSettings(isVisible: true))
          ]),
    );
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
