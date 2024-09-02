import 'package:flutter/material.dart';
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
        backgroundColor: AppPallete.secondarybackgroundColor,
        foregroundColor: AppPallete.textcolor1,
        elevation: 0,
        shape: CircleBorder(),
        mini: false,
      ),
      bottomNavigationBar: const BottomAppBar(
        notchMargin: 10.0,
        shape: CircularNotchedRectangle(),
        color: AppPallete.secondarybackgroundColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10.0, top: 10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.home, color: Colors.white),
                  Text("Home", style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 20.0, top: 10.0, bottom: 1.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.shopping_cart, color: Colors.white),
                  Text("Shop", style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0, top: 10.0, bottom: 1.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.favorite, color: Colors.white),
                  Text("Fav", style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 10.0, top: 10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.settings, color: Colors.white),
                  Text("Setting", style: TextStyle(color: Colors.white)),
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
}
