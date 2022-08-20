import 'package:flutter/material.dart';

class ClientsView extends StatelessWidget {
  const ClientsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: SizedBox.expand(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Wrap(
              children: const [
                "lefties.jpeg",
                "zara.jpeg",
              ].map<Widget>((e) {
                return IntrinsicWidth(
                  child: SizedBox(
                    height: 120,
                    width: 120,
                    child: Card(
                      elevation: 20,
                      child: Padding(
                        padding: const EdgeInsets.all(0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            "assets/clients_logo/$e",
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
              // children: [
              //   SizedBox(
              //     height: 90,
              //     width: 90,
              //     child: Card(
              //       elevation: 20,
              //     ),
              //   ),
              //   SizedBox(
              //     height: 90,
              //     width: 90,
              //     child: Card(
              //       elevation: 20,
              //     ),
              //   ),
              //   SizedBox(
              //     height: 90,
              //     width: 90,
              //     child: Card(
              //       elevation: 20,
              //     ),
              //   ),
              //   SizedBox(
              //     height: 90,
              //     width: 90,
              //     child: Card(
              //       elevation: 20,
              //     ),
              //   ),
              //   SizedBox(
              //     height: 90,
              //     width: 90,
              //     child: Card(
              //       elevation: 20,
              //     ),
              //   ),
              //   SizedBox(
              //     height: 90,
              //     width: 90,
              //     child: Card(
              //       elevation: 20,
              //     ),
              //   ),
              //   SizedBox(
              //     height: 90,
              //     width: 90,
              //     child: Card(
              //       elevation: 20,
              //     ),
              //   ),
              //   SizedBox(
              //     height: 90,
              //     width: 90,
              //     child: Card(
              //       elevation: 20,
              //     ),
              //   ),
              //   SizedBox(
              //     height: 90,
              //     width: 90,
              //     child: Card(
              //       elevation: 20,
              //     ),
              //   ),
              // ],
            ),
          ),
        ),
      ),
    );
  }
}
