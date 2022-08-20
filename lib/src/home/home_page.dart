import 'package:bsl/src/home/home_view.dart';
import 'package:bsl/src/settings/settings_controller.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: RichText(
          text: TextSpan(
            text: "BASIC",
            children: [
              TextSpan(
                text: "\nBASIC SHIRTS LTD",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ],
            style: const TextStyle(
              color: Colors.red,
              fontSize: 22,
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              SettingsController.instance.toggleTheme();
            },
            icon: const Icon(Icons.wb_sunny_outlined),
          ),
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.only(top: 25, left: 25, right: 25, bottom: 85),
        child: HomeView(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: IntrinsicHeight(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 560),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: NavigationBarTheme(
                  data: const NavigationBarThemeData(
                      // indicatorColor:
                      // Theme.of(context).colorScheme.primaryContainer,
                      ),
                  child: NavigationBar(
                    selectedIndex: _currentIndex,
                    onDestinationSelected: (value) {
                      setState(() {
                        _currentIndex = value;
                      });
                    },
                    height: 70,
                    destinations: const [
                      NavigationDestination(
                        icon: Icon(Icons.home_outlined),
                        selectedIcon: Icon(Icons.home),
                        label: "Home",
                      ),
                      NavigationDestination(
                        icon: Icon(Icons.info_outline),
                        selectedIcon: Icon(Icons.info),
                        label: "About",
                      ),
                      NavigationDestination(
                        icon: Icon(Icons.shopping_cart_outlined),
                        selectedIcon: Icon(Icons.shopping_cart),
                        label: "Products",
                      ),
                      NavigationDestination(
                        icon: Icon(Icons.pages_outlined),
                        selectedIcon: Icon(Icons.pages),
                        label: "Objective",
                      ),
                      NavigationDestination(
                        icon: Icon(Icons.contact_phone_outlined),
                        selectedIcon: Icon(Icons.contact_phone),
                        label: "Contact us",
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
