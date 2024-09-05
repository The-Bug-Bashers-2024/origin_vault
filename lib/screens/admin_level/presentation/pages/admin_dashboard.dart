import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:origin_vault/core/theme/app_pallete.dart';
import 'package:origin_vault/screens/admin_level/presentation/pages/admin_sidebar.dart';

// Assume you have a SideMenu widget already implemented
// import 'side_menu.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Widget _buildTopBar() {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 40, 10, 0),
      color:
          AppPallete.backgroundColor, // Make the top bar fixed and consistent
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.cyan),
            onPressed: () {
              _scaffoldKey.currentState?.openDrawer(); // Open the sidebar
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.cyan),
            onPressed: () {
              // Handle notification action
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppPallete.backgroundColor,
      drawer: SideMenu(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        height:
            80.h, // Adjust the height to give space for both the icon and text
        width: 80.w, // Adjust the width if necessary
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: AppPallete.secondarybackgroundColor,
          elevation: 0,
          shape: const CircleBorder(),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Iconsax.house_2,
                size: 24, // Icon size
                color: AppPallete.iconColor,
              ),
              SizedBox(height: 5), // Space between icon and text
              Text(
                'Home', // Replace with the text you want
                style: TextStyle(
                  color: AppPallete.iconColor,
                  fontSize: 12, // Font size for the text
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomAppBar(
        notchMargin: 8.0,
        shape: CircularNotchedRectangle(),
        color: AppPallete.secondarybackgroundColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10.0, top: 8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Iconsax.people, color: AppPallete.iconColor),
                  SizedBox(height: 3),
                  Text("Users", style: TextStyle(color: AppPallete.iconColor)),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 20.0, top: 8.0, bottom: 1.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Iconsax.monitor_mobbile, color: AppPallete.iconColor),
                  SizedBox(height: 3),
                  Text("System", style: TextStyle(color: AppPallete.iconColor)),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0, top: 8.0, bottom: 1.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Iconsax.status_up, color: AppPallete.iconColor),
                  SizedBox(height: 3),
                  Text("Reports",
                      style: TextStyle(color: AppPallete.iconColor)),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 10.0, top: 8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Iconsax.document_text, color: AppPallete.iconColor),
                  SizedBox(height: 3),
                  Text("Audits", style: TextStyle(color: AppPallete.iconColor)),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          _buildTopBar(), // Top bar remains fixed
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Hello Admin',
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                    const Text(
                      'Welcome Back!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: _buildDataBox(
                            'User Count',
                            '3877',
                            '+11.75%',
                          ),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: _buildDataBox(
                            'System Status',
                            'ACTIVE',
                            'Up-time Rate: 11.75%',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    _buildRecentActivities(), // Recent Activities Section
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDataBox(String title, String value, String subValue) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppPallete.secondarybackgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(color: AppPallete.textcolor1, fontSize: 20),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            subValue,
            style: const TextStyle(color: Colors.cyan),
          ),
          const SizedBox(height: 16),
          Container(
            height: 50,
          ),
        ],
      ),
    );
  }

  Widget _buildRecentActivities() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppPallete.secondarybackgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Recent Activities',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: _buildActivityCard(
                  'Activity Type',
                  'activity message accessed by username',
                  'Date-Time',
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildActivityCard(
                  'Activity Type',
                  'activity message accessed by username',
                  'Date-Time',
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Align(
            alignment: Alignment.bottomRight,
            child: TextButton(
              onPressed: () {},
              child:
                  const Text('View All', style: TextStyle(color: Colors.cyan)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActivityCard(String title, String description, String date) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppPallete.backgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: AppPallete.textcolor1,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: const TextStyle(color: Colors.white),
          ),
          const SizedBox(height: 8),
          Text(
            date,
            style: const TextStyle(color: Colors.cyan),
          ),
        ],
      ),
    );
  }
}
