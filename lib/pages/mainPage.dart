import 'package:flutter/material.dart';
import 'package:survivorship_care_plan_app/pages/survey.dart';
import '../theme.dart'; // Import theme file
import 'second_page.dart'; // Import second_page file

// Main page of app
class MainPage extends StatefulWidget {
  const MainPage({Key? key});
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // Variables
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    FirstTimeSurvey.run(context); //Run first time survey
    return Scaffold(
      // App bar
      appBar: AppBar(
        title: const Text("SCP"),
      ),

      // body of app
      body: <Widget>[
        roadmap(context), // Roadmap page at index 0
        resources(context), // Resources page at index 1
        settings(context), // Settings page at index 2
      ][currentPageIndex],

      // Navigation bar
      bottomNavigationBar: NavigationBar(
        animationDuration: const Duration(seconds: 1),
        selectedIndex: currentPageIndex,
        onDestinationSelected: (index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        destinations: _navBarItems,
      ),
    );
  }
}

// Navigation bar items
const _navBarItems = [
  NavigationDestination(
    icon: Icon(Icons.map),
    selectedIcon: Icon(Icons.map),
    label: 'Roadmap',
  ),
  NavigationDestination(
    icon: Icon(Icons.book),
    selectedIcon: Icon(Icons.book),
    label: 'Resources',
  ),
  NavigationDestination(
    icon: Icon(Icons.settings),
    selectedIcon: Icon(Icons.settings),
    label: 'Settings',
  ),
];

// Roadmap page
Widget roadmap(BuildContext context) {
  return Container(
    width: double.infinity, // max width of app
    height: double.infinity, // max height of app
    color: Color.fromARGB(255, 100, 126, 148),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            onPrimary: Colors.red,
            primary: Colors.orange,
          ),
          onPressed: () {
            // pushes a page on top of the current one
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) => const SecondPage(),
              ),
            );
          },
          child: Text("Stage 1"),
        ),
        ElevatedButton(
          onPressed: () {
            // pushes a page on top of the current one
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) => const SecondPage(),
              ),
            );
          },
          child: Text(
            "Stage 2", // Use the defined variable
            style: myTextStyle, // Use the defined text style
          ),
        )
      ],
    ),
  );
}

// Resources page
Widget resources(BuildContext context) {
  return Center(
    child: Text(
      "Selected Page: Resources",
      style: myTextStyle, // Use the defined text style
    ),
  );
}

// Settings page
Widget settings(BuildContext context) {
  return Center(
    child: Text(
      "Selected Page: Settings",
      style: myTextStyle, // Use the defined text style
    ),
  );
}
