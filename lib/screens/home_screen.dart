import 'package:flutter/material.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';

enum _SelectedTab { home, likes, search, profile }

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _selectedTab = _SelectedTab.home;

  void _handleIndexChanged(int i) {
    setState(() {
      _selectedTab = _SelectedTab.values[i];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      endDrawer: Drawer(),
      body: Center(child: Text("Menu de Opciones")),
      bottomNavigationBar: SafeArea(
        child: DotNavigationBar(
          margin: EdgeInsets.symmetric(horizontal: 10),
          currentIndex: _SelectedTab.values.indexOf(_selectedTab),
          dotIndicatorColor: Colors.white,
          unselectedItemColor: Colors.grey[300],
          splashBorderRadius: 50,
          onTap: _handleIndexChanged,
          items: [
            DotNavigationBarItem(
              icon: Icon(Icons.home),
              selectedColor: Color(0xff73544C),
            ),
            DotNavigationBarItem(
              icon: Icon(Icons.favorite),
              selectedColor: Color(0xff73544C),
            ),
            DotNavigationBarItem(
              icon: Icon(Icons.search),
              selectedColor: Color(0xff73544C),
            ),
            DotNavigationBarItem(
              icon: Icon(Icons.person),
              selectedColor: Color(0xff73544C),
            ),
          ],
        ),
      ),
    );
  }
}
