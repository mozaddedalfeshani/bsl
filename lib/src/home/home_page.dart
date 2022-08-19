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
      body: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(),
            Container(),
            Container(),
          ],
        ),
      ),
      bottomNavigationBar: Align(
        alignment: Alignment.bottomCenter,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 400),
          child: SizedBox(
            child: Card(
              elevation: 10,
              child: BottomNavigationBar(
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
                    icon: Icon(Icons.home_outlined),
                    // selectedIcon: Icon(Icons.home),
                    label: "Home",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.info_outline),
                    // selectedIcon: Icon(Icons.info),
                    label: "About",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.shopping_cart_outlined),
                    // selectedIcon: Icon(Icons.shopping_cart),
                    label: "Products",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.pages_outlined),
                    // selectedIcon: Icon(Icons.pages),
                    label: "Objective",
                  ),
                  BottomNavigationBarItem(
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
    );
  }
}
