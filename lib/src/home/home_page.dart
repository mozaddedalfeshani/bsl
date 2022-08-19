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
        title: const Text("Basic Shirts Ltd"),
        actions: [
          IconButton(
            onPressed: () {
              SettingsController.instance.toggleTheme();
            },
            icon: const Icon(Icons.wb_sunny_outlined),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          // Container(),
          // Container(),
          // Container(),
        ],
      ),
      bottomNavigationBar: IntrinsicHeight(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 560),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                color: Colors.transparent,
                shadowColor: Colors.transparent,
                shape: const StadiumBorder(),
                elevation: 10,
                child: BottomNavigationBar(
                  backgroundColor: Colors.transparent,
                  currentIndex: _currentIndex,
                  selectedItemColor: Theme.of(context).colorScheme.primary,
                  unselectedItemColor: Theme.of(context).colorScheme.onSurface,
                  onTap: (value) {
                    setState(() {
                      _currentIndex = value;
                    });
                  },
                  items: const [
                    BottomNavigationBarItem(
                      backgroundColor: Colors.transparent,
                      icon: Icon(Icons.home_outlined),
                      // selectedIcon: Icon(Icons.home),
                      label: "Home",
                    ),
                    BottomNavigationBarItem(
                      backgroundColor: Colors.transparent,
                      icon: Icon(Icons.info_outline),
                      // selectedIcon: Icon(Icons.info),
                      label: "About",
                    ),
                    BottomNavigationBarItem(
                      backgroundColor: Colors.transparent,
                      icon: Icon(Icons.shopping_cart_outlined),
                      // selectedIcon: Icon(Icons.shopping_cart),
                      label: "Products",
                    ),
                    BottomNavigationBarItem(
                      backgroundColor: Colors.transparent,
                      icon: Icon(Icons.pages_outlined),
                      // selectedIcon: Icon(Icons.pages),
                      label: "Objective",
                    ),
                    BottomNavigationBarItem(
                      backgroundColor: Colors.transparent,
                      icon: Icon(Icons.contact_phone_outlined),
                      // selectedIcon: Icon(Icons.contact_phone),
                      label: "Contact us",
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
