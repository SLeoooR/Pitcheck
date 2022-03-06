import 'package:flutter/material.dart';
import 'package:pitcheck/lessons_tab/lessons.dart';
import 'package:pitcheck/pitches_tab/pitches.dart';
import 'package:pitcheck/profile_tab/profile.dart';

class Dashboard extends StatefulWidget {
  final int pageNumber;

  const Dashboard({Key? key, required this.pageNumber, }) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndexTab = 0;
  final List _screens = const [Pitches(), Lessons(), Profile()];

  @override
  void initState() {
    _selectedIndexTab = widget.pageNumber;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: _screens[_selectedIndexTab],
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.grey,
                blurRadius: 10,
              ),
            ],
          ),
          child: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(Icons.campaign_outlined),
                  label: 'Pitches'
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.lightbulb_outline),
                  label: 'Lessons'
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline),
                  label: 'Profile'
              ),
            ],
            currentIndex: _selectedIndexTab,
            selectedItemColor: Colors.red,
            onTap: (index) => setState(() => _selectedIndexTab = index),
          ),
        ),
        floatingActionButton: _selectedIndexTab == 0 ? FloatingActionButton(
          child: const Icon(Icons.post_add_outlined),
          onPressed: () {
            Navigator.pushNamed(context, '/createPitch');
          }
        ) : _selectedIndexTab == 2 ? FloatingActionButton(
          child: const Icon(Icons.edit),
          onPressed: () {
            Navigator.pushNamed(context, '/editProfile');
          }
        ) : null,
      ),
    );
  }
}