import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Collapsible Sidebar Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isSidebarOpen = false;

  void _toggleSidebar() {
    setState(() {
      _isSidebarOpen = !_isSidebarOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Collapsible Sidebar Example'),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: _toggleSidebar,
        ),
      ),
      body: Stack(
        children: [
          Container(
            color: Colors.white,
            child: Center(
              child: Text(
                'Main Content',
                style: TextStyle(fontSize: 24.0),
              ),
            ),
          ),
          if (_isSidebarOpen)
            Container(
              color: Colors.black54,
              width: MediaQuery.of(context).size.width * 0.6,
              child: Drawer(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    DrawerHeader(
                      child: Text(
                        'Sidebar Header',
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                      ),
                    ),
                    ListTile(
                      title: Text('Item 1'),
                      onTap: () {
                        // Handle item 1 tap
                      },
                    ),
                    ListTile(
                      title: Text('Item 2'),
                      onTap: () {
                        // Handle item 2 tap
                      },
                    ),
                    // Add more list items here
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
