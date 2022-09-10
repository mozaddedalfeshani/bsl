import 'package:bsl/src/clients/clients_view.dart';
import 'package:bsl/src/contact_us/contact_us_view.dart';
import 'package:bsl/src/home/home_view.dart';
import 'package:bsl/src/objective/objective_view.dart';
import 'package:bsl/src/products/products_view.dart';
import 'package:bsl/src/settings/settings_controller.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation _docAnimation;
  late final Animation _appBarAnimation;
  int _currentIndex = 0;

  @override
  void initState() {
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _docAnimation = Tween<double>(
      begin: 100,
      end: 0,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.bounceInOut,
        reverseCurve: Curves.easeIn,
      ),
    );
    _appBarAnimation = Tween<double>(
      begin: -100,
      end: 0,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.bounceOut,
        reverseCurve: Curves.easeIn,
      ),
    );
    _animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(55),
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(0, _appBarAnimation.value),
              child: child!,
            );
          },
          child: AppBar(
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
                icon: (SettingsController.instance.themeMode == ThemeMode.dark)
                    ? const Icon(Icons.dark_mode_outlined)
                    : const Icon(Icons.wb_sunny_outlined),
              ),
            ],
          ),
        ),
      ),
      body: SelectionArea(
        child: (_currentIndex == 2)
            ? const Padding(
                padding: EdgeInsets.only(bottom: 85),
                child: ProductsView(),
              )
            : Padding(
                padding: const EdgeInsets.only(
                    top: 25, left: 25, right: 25, bottom: 85),
                child: SizedBox.expand(
                  child: Card(
                    elevation: 10,
                    child: const [
                      HomeView(),
                      ClientsView(),
                      ProductsView(),
                      ObjectiveView(),
                      ContactUsView(),
                    ][_currentIndex],
                  ),
                ),
              ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(0, _docAnimation.value),
            child: child!,
          );
        },
        child: IntrinsicHeight(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 560),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: NavigationBar(
                    selectedIndex: _currentIndex,
                    onDestinationSelected: (value) {
                      if (value == _currentIndex) {
                        return;
                      }
                      // _animationController.reverse().then((value) {
                      //   _animationController.forward();
                      // });
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
                        icon: Icon(Icons.people_outline),
                        selectedIcon: Icon(Icons.people),
                        label: "Clients",
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
