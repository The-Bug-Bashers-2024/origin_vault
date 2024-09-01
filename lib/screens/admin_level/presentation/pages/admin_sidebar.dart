// File: sidebar.dart

import 'package:flutter/material.dart';

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
            leading: Icon(Icons.dashboard, color: Colors.cyan),
            title: Text('Dashboard', style: TextStyle(color: Colors.white)),
            onTap: () {
              // Navigate to Dashboard
            },
          ),
          ListTile(
            leading: Icon(Icons.settings, color: Colors.cyan),
            title: Text('Settings', style: TextStyle(color: Colors.white)),
            onTap: () {
              // Navigate to Settings
            },
          ),
          ListTile(
            leading: Icon(Icons.logout, color: Colors.cyan),
            title: Text('Logout', style: TextStyle(color: Colors.white)),
            onTap: () {
              // Perform logout action
            },
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              child: Text('Create Teams'),
              onPressed: () {
                // Action for creating teams
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[800],
                minimumSize: Size(double.infinity, 50),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
