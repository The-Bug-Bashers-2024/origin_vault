import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:origin_vault/core/theme/app_pallete.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Origin Vault Dashboard',
      theme: ThemeData.dark().copyWith(
        primaryColor: AppPallete.backgroundColor,
        scaffoldBackgroundColor: AppPallete.backgroundColor,
      ),
      home: DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DashboardContent(),
    );
  }
}

class DashboardContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Hello Admin\nWelcome Back!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Icon(Icons.notifications, color: Colors.cyan),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(child: _buildInfoCard('User Count', '3877', '11.75%')),
              SizedBox(width: 16),
              Expanded(
                  child: _buildInfoCard(
                      'System Status', 'ACTIVE', 'Up-time Rate: 11.75%')),
            ],
          ),
          SizedBox(height: 20),
          _buildSectionHeader('Recent Activities'),
          _buildRecentActivities(),
          SizedBox(height: 20),
          _buildSectionHeader('Recent Transactions'),
          _buildRecentTransactions(),
          Spacer(),
          _buildBottomNavBar(),
        ],
      ),
    );
  }

  Widget _buildInfoCard(String title, String mainInfo, String subInfo) {
    return Card(
      color: Colors.grey[800],
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyle(color: Colors.grey)),
            SizedBox(height: 8),
            Text(mainInfo,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(subInfo, style: TextStyle(color: Colors.cyan)),
            SizedBox(height: 16),
            Container(
              height: 50,
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(show: false),
                  titlesData: FlTitlesData(show: false),
                  borderData: FlBorderData(show: false),
                  lineBarsData: [
                    LineChartBarData(
                      spots: [
                        FlSpot(0, 3),
                        FlSpot(2.6, 2),
                        FlSpot(4.9, 5),
                        FlSpot(6.8, 3.1),
                        FlSpot(8, 4),
                        FlSpot(9.5, 3),
                        FlSpot(11, 4),
                      ],
                      isCurved: true,
                      color: Colors.cyan,
                      barWidth: 3,
                      dotData: FlDotData(show: false),
                      belowBarData: BarAreaData(show: false),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        TextButton(
          child: Text('View All', style: TextStyle(color: Colors.cyan)),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildRecentActivities() {
    return Column(
      children: List.generate(2, (index) {
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.cyan,
            child: Icon(Icons.description, color: Colors.white),
          ),
          title: Text('Activity message'),
          subtitle: Text('accessed by username'),
          trailing: Text('Date-Time'),
        );
      }),
    );
  }

  Widget _buildRecentTransactions() {
    return Column(
      children: List.generate(2, (index) {
        return ListTile(
          title: Text('Transaction Type'),
          subtitle: Text('transaction detail'),
          trailing: Text('\$99,284.01', style: TextStyle(color: Colors.cyan)),
        );
      }),
    );
  }

  Widget _buildBottomNavBar() {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildNavBarItem(Icons.home, 'Home', isSelected: true),
          _buildNavBarItem(Icons.person, 'Users'),
          _buildNavBarItem(Icons.computer, 'System'),
          _buildNavBarItem(Icons.bar_chart, 'Reports'),
          _buildNavBarItem(Icons.attach_money, 'Access Control'),
        ],
      ),
    );
  }

  Widget _buildNavBarItem(IconData icon, String label,
      {bool isSelected = false}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: isSelected ? Colors.cyan : Colors.grey),
        Text(label,
            style: TextStyle(
                color: isSelected ? Colors.cyan : Colors.grey, fontSize: 12)),
      ],
    );
  }
}
