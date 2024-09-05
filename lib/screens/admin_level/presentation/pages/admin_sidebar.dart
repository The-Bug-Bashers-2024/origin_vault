// File: sidebar.dart

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      color: Colors.black,
      child: Column(
        children: [
          SizedBox(height: 50),
          Text(
            'Origin Vault',
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
          SizedBox(height: 20),
          CircleAvatar(
            radius: 40,
            backgroundColor: Colors.orange,
            child: Icon(Icons.person, size: 40, color: Colors.white),
          ),
          SizedBox(height: 10),
          Text('ADMIN', style: TextStyle(color: Colors.white)),
          SizedBox(height: 30),
          ListTile(
            leading: Icon(Iconsax.element_equal),
            title: Text('Dashboard', style: TextStyle(color: Colors.white)),
            onTap: () {
              // Navigate to Dashboard
            },
          ),
          ListTile(
            leading: Icon(Iconsax.setting_2),
            title: Text('Settings', style: TextStyle(color: Colors.white)),
            onTap: () {
              // Navigate to Settings
            },
          ),
          ListTile(
            leading: Icon(Iconsax.logout),
            title: Text('Logout', style: TextStyle(color: Colors.white)),
            onTap: () {
              // Perform logout action
            },
          ),
        ],
      ),
    );
  }
}
