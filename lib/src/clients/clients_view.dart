import 'package:flutter/material.dart';

class ClientsView extends StatelessWidget {
  const ClientsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constrains) {
      return GridView.count(
        padding: const EdgeInsets.all(10),
        crossAxisCount: constrains.maxWidth ~/ 200 + 1,
        children: const [
          "zara.jpeg",
          "mango.jpeg",
          "john_lewis.png",
          "tn.png",
          "D&G.jpeg",
          "JAJU.png",
          "P_E.png",
          "lefties.jpeg",
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
      );
    });
  }
}
