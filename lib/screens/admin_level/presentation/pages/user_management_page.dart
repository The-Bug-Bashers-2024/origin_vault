import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:origin_vault/core/theme/app_pallete.dart';
import 'package:origin_vault/screens/admin_level/presentation/pages/admin_sidebar.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Usermanagement extends StatefulWidget {
  const Usermanagement({Key? key}) : super(key: key);

  @override
  _UsermanagementState createState() => _UsermanagementState();
}

class _UsermanagementState extends State<Usermanagement> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final supabase =
      SupabaseClient(dotenv.env['SUPABASE_URL']!, dotenv.env['SUPABASE_KEY']!);
  List<Map<String, dynamic>> _users = [];
  List<Map<String, dynamic>> _filteredUsers = [];
  bool _isLoading = true;
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fetchUsers();
  }

  Future<void> _fetchUsers() async {
    try {
      final response = await supabase.from('user_table').select();
      setState(() {
        _users = List<Map<String, dynamic>>.from(response);
        _filteredUsers = _users;
        _isLoading = false;
      });
    } catch (e) {
      print('Error fetching users: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _filterUsers(String query) {
    setState(() {
      _filteredUsers = _users
          .where((user) => user['name']
              .toString()
              .toLowerCase()
              .contains(query.toLowerCase()))
          .toList();
    });
  }

  Widget _buildTopBar() {
    return Container(
      padding: EdgeInsets.fromLTRB(10.w, 40.h, 10.w, 0),
      color: AppPallete.backgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Iconsax.candle_2, color: Colors.cyan),
            onPressed: () {
              _scaffoldKey.currentState?.openDrawer();
            },
          ),
          IconButton(
            icon: const Icon(Iconsax.notification, color: Colors.cyan),
            onPressed: () {
              // Handle notification action
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: TextField(
        controller: _searchController,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: 'User Name',
          hintStyle: TextStyle(color: Colors.grey),
          prefixIcon: Icon(Iconsax.search_normal, color: Colors.cyan),
          filled: true,
          fillColor: AppPallete.secondarybackgroundColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.r),
            borderSide: BorderSide.none,
          ),
        ),
        onChanged: _filterUsers,
      ),
    );
  }

  Widget _buildUserList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: _filteredUsers.length + 1,
      itemBuilder: (context, index) {
        if (index == _filteredUsers.length) {
          return _buildAddEditButton();
        }
        return _buildUserCard(_filteredUsers[index]);
      },
    );
  }

  Widget _buildUserCard(Map<String, dynamic> user) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppPallete.secondarybackgroundColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('User ID: ${user['user_id'] ?? 'N/A'}',
                    style: TextStyle(color: Colors.white)),
                Text('User Name: ${user['name'] ?? 'N/A'}',
                    style: TextStyle(color: Colors.white)),
                Text('User Role: ${user['role'] ?? 'N/A'}',
                    style: TextStyle(color: Colors.white)),
                Text('Status: ${user['status'] ?? 'N/A'}',
                    style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
          IconButton(
            icon: Icon(Iconsax.edit, color: Colors.cyan),
            onPressed: () {
              // Handle edit action
            },
          ),
        ],
      ),
    );
  }

  Widget _buildAddEditButton() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.r),
          ),
        ),
        onPressed: () {
          // Handle add/edit users action
        },
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 12.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Iconsax.add_circle, color: Colors.white),
              SizedBox(width: 8.w),
              Text('Add/Edit Users',
                  style: TextStyle(color: Colors.white, fontSize: 16.sp)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNavItem(IconData icon, String label, EdgeInsets padding) {
    return Padding(
      padding: padding,
      child: InkWell(
        onTap: () {
          print("$label button tapped");
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: AppPallete.iconColor, size: 24.sp),
            SizedBox(height: 3.h),
            Text(label,
                style: TextStyle(color: AppPallete.iconColor, fontSize: 12.sp)),
          ],
        ),
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
      floatingActionButton: SizedBox(
        height: 80.h,
        width: 80.w,
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: AppPallete.secondarybackgroundColor,
          elevation: 0,
          shape: const CircleBorder(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Iconsax.house_2,
                size: 24.sp,
                color: AppPallete.iconColor,
              ),
              SizedBox(height: 5.h),
              Text(
                'Home',
                style: TextStyle(
                  color: AppPallete.iconColor,
                  fontSize: 12.sp,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 8.0,
        shape: const CircularNotchedRectangle(),
        color: AppPallete.secondarybackgroundColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 8.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Usermanagement()),
                  );
                },
                child: const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Iconsax.people, color: AppPallete.iconColor),
                    SizedBox(height: 3),
                    Text("Users",
                        style: TextStyle(color: AppPallete.iconColor)),
                  ],
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(right: 20.0, top: 8.0, bottom: 1.0),
              child: InkWell(
                onTap: () {
                  // Handle tap on "System" button
                  print("System button tapped");
                },
                child: const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Iconsax.monitor_mobbile, color: AppPallete.iconColor),
                    SizedBox(height: 3),
                    Text("System",
                        style: TextStyle(color: AppPallete.iconColor)),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 8.0, bottom: 1.0),
              child: InkWell(
                onTap: () {
                  // Handle tap on "Reports" button
                  print("Reports button tapped");
                },
                child: const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Iconsax.status_up, color: AppPallete.iconColor),
                    SizedBox(height: 3),
                    Text("Reports",
                        style: TextStyle(color: AppPallete.iconColor)),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10.0, top: 8.0),
              child: InkWell(
                onTap: () {
                  // Handle tap on "Audits" button
                  print("Audits button tapped");
                },
                child: const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Iconsax.document_text, color: AppPallete.iconColor),
                    SizedBox(height: 3),
                    Text("Audits",
                        style: TextStyle(color: AppPallete.iconColor)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          _buildTopBar(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(16.w),
                    child: Text(
                      'User Management',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  _buildSearchBar(),
                  _isLoading
                      ? Center(child: CircularProgressIndicator())
                      : _buildUserList(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
