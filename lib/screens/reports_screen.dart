import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ReportScreen extends StatefulWidget {
  @override
  _ReportScreenState createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen>
    with SingleTickerProviderStateMixin {
  // Segment Control
  int _selectedValue = 0; // 0 for income, 1 for expense
  String _chartType = 'Bar'; // Initial chart type

  // Tab Control
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Report'),
        backgroundColor: const Color(0xFF429690),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          tabs: const [
            Tab(text: 'Daily'),
            Tab(text: 'Weekly'),
            Tab(text: 'Monthly'),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Segment Control for Income and Expense
            Container(
              decoration: BoxDecoration(
                // color: Color.fromARGB(255, 156, 222, 216),
                borderRadius: BorderRadius.circular(8.0),
                // make edge softer
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(47, 125, 121, 0.3),
                    offset: Offset(0, 6),
                    blurRadius: 8,
                    spreadRadius: 6,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() => _selectedValue = 0),
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 12.0),
                          decoration: BoxDecoration(
                            color: _selectedValue == 0 ? Colors.white : null,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Center(
                            child: Text(
                              'Income',
                              style: TextStyle(
                                color: _selectedValue == 0
                                    ? const Color(0xFF429690)
                                    : Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() => _selectedValue = 1),
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 12.0),
                          decoration: BoxDecoration(
                            color: _selectedValue == 1 ? Colors.white : null,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Center(
                            child: Text(
                              'Expense',
                              style: TextStyle(
                                color: _selectedValue == 1
                                    ? const Color(0xFF429690)
                                    : Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]), // Buttons to select chart type
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () => setState(() => _chartType = 'Bar'),
                        child: Text('Bar Chart'),
                        style: ElevatedButton.styleFrom(
                          primary: _chartType == 'Bar'
                              ? Color(0xFF429690)
                              : Colors.grey,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () => setState(() => _chartType = 'Line'),
                        child: Text('Line Chart'),
                        style: ElevatedButton.styleFrom(
                          primary: _chartType == 'Line'
                              ? Color(0xFF429690)
                              : Colors.grey,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () => setState(() => _chartType = 'Pie'),
                        child: Text('Pie Chart'),
                        style: ElevatedButton.styleFrom(
                          primary: _chartType == 'Pie'
                              ? Color(0xFF429690)
                              : Colors.grey,
                        ),
                      ),
                    ],
                  ),

                  // Conditional rendering of charts
                  if (_chartType == 'Bar') _buildBarChart(),
                  if (_chartType == 'Line') _buildLineChart(),
                  if (_chartType == 'Pie') _buildPieChart(),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const SizedBox(height: 20),
            // Top Income/Expense Indicator
            ListTile(
              title: Text(
                _selectedValue == 0 ? 'Top Income' : 'Top Expense',
                style: const TextStyle(
                    color: Color(0xFF429690), fontWeight: FontWeight.bold),
              ),
              subtitle: const Text('Placeholder Data'), // Placeholder data
              leading: Icon(
                _selectedValue == 0 ? Icons.arrow_upward : Icons.arrow_downward,
                color: const Color(0xFF429690),
              ),
            ),
            // Expanded(
            //   child: TabBarView(
            //     controller: _tabController,
            //     children: [
            //       _buildDailyView(),
            //       _buildWeeklyView(),
            //       _buildMonthlyView(),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  List<BarChartGroupData> getBarGroups() {
    return List.generate(7, (index) {
      return BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
            y: index % 2 == 0 ? 5.0 + index : 7.0 + index,
            colors: [Color(0xFF429690)],
          ),
        ],
      );
    });
  }

  Widget _buildBarChart() {
    return Container(
        height: 220, // Adjusted size
        child: BarChart(
          BarChartData(
            barGroups: getBarGroups(),
            titlesData: FlTitlesData(
              leftTitles: SideTitles(showTitles: false),
              bottomTitles: SideTitles(
                showTitles: true,
                getTextStyles: (BuildContext context, double value) =>
                    const TextStyle(
                        color: Color(0xFF429690),
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                getTitles: (double value) {
                  switch (value.toInt()) {
                    case 0:
                      return 'M';
                    case 1:
                      return 'T';
                    case 2:
                      return 'W';
                    case 3:
                      return 'T';
                    case 4:
                      return 'F';
                    case 5:
                      return 'S';
                    case 6:
                      return 'S';
                    default:
                      return '';
                  }
                },
              ),
            ),
            borderData: FlBorderData(
              show: false,
            ),
            barTouchData: BarTouchData(
              touchTooltipData: BarTouchTooltipData(
                tooltipBgColor: Colors.blueAccent,
              ),
              touchCallback: (barTouchResponse) {},
              handleBuiltInTouches: true,
            ),
          ),
        ));
  }

  Widget _buildLineChart() {
    return Container(
      height: 220,
      child: LineChart(
        LineChartData(
          gridData: FlGridData(show: false),
          titlesData: FlTitlesData(show: false),
          borderData: FlBorderData(
            show: true,
            border: const Border(
              bottom: BorderSide(
                color: Color(0xFF429690),
                width: 2,
              ),
              left: BorderSide(color: Colors.transparent),
              right: BorderSide(color: Colors.transparent),
              top: BorderSide(color: Colors.transparent),
            ),
          ),
          minX: 0,
          maxX: 6,
          minY: 0,
          maxY: 15,
          lineBarsData: [
            LineChartBarData(
              spots: [
                FlSpot(0, 3),
                FlSpot(1, 1),
                FlSpot(2, 5),
                FlSpot(3, 7),
                FlSpot(4, 5),
                FlSpot(5, 3),
                FlSpot(6, 4),
              ],
              isCurved: true,
              colors: [Color(0xFF429690)],
              barWidth: 4,
              isStrokeCapRound: true,
              belowBarData: BarAreaData(show: false),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPieChart() {
    return Container(
      height: 220,
      child: PieChart(
        PieChartData(
          sectionsSpace: 0,
          centerSpaceRadius: 40,
          sections: [
            PieChartSectionData(
              color: const Color(0xFF429690),
              value: 40,
              title: '40%',
              radius: 50,
              titleStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xffffffff)),
            ),
            PieChartSectionData(
              color: Colors.orange,
              value: 30,
              title: '30%',
              radius: 50,
              titleStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xffffffff)),
            ),
            PieChartSectionData(
              color: Colors.blue,
              value: 15,
              title: '15%',
              radius: 50,
              titleStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xffffffff)),
            ),
            PieChartSectionData(
              color: Colors.green,
              value: 15,
              title: '15%',
              radius: 50,
              titleStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xffffffff)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDailyView() {
    // Use your existing chart widgets (_buildBarChart, _buildLineChart, or _buildPieChart)
    // Or create different charts specific to the daily view
    if (_chartType == 'Bar') return _buildBarChart();
    if (_chartType == 'Line') return _buildLineChart();
    if (_chartType == 'Pie') return _buildPieChart();
    return Container(); // Default empty container, should never reach here.
  }

  Widget _buildWeeklyView() {
    // Create charts specific to the weekly view.
    // This could be a different implementation or using different data for the chart.
    // For simplicity, returning the same as daily.
    if (_chartType == 'Bar') return _buildBarChart();
    if (_chartType == 'Line') return _buildLineChart();
    if (_chartType == 'Pie') return _buildPieChart();
    return Container(); // Default empty container, should never reach here.
  }

  Widget _buildMonthlyView() {
    // Create charts specific to the monthly view.
    // This could be a different implementation or using different data for the chart.
    // For simplicity, returning the same as daily.
    if (_chartType == 'Bar') return _buildBarChart();
    if (_chartType == 'Line') return _buildLineChart();
    if (_chartType == 'Pie') return _buildPieChart();
    return Container(); // Default empty container, should never reach here.
  }
}
