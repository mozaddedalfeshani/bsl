import 'package:flutter/material.dart';

class ContactUsView extends StatefulWidget {
  const ContactUsView({super.key});

  @override
  State<ContactUsView> createState() => _ContactUsViewState();
}

class _ContactUsViewState extends State<ContactUsView> {
  String location = "23.91910270106795, 90.43303905025736";
  @override
  Widget build(BuildContext context) {
    final List<Widget> _profiles = [
      Padding(
        padding: const EdgeInsets.all(10),
        child: IntrinsicHeight(
          child: Row(
            children: [
              Container(
                width: 2,
                color: Theme.of(context).colorScheme.onSurface,
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(
                      Icons.person,
                      size: 50,
                    ),
                    Text(
                      "Md. Nurul Islam, FCMA Chairman",
                      // style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      "Basic Shirts Limited.",
                      // style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      "Phone No:- +88-01775300619",
                      // style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      "+88-01190000131",
                      // style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      "E-mail: nurulislam@basicshirts.net video youtube",
                      // style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(10),
        child: IntrinsicHeight(
          child: Row(
            children: [
              Container(
                width: 2,
                color: Theme.of(context).colorScheme.onSurface,
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(
                      Icons.person,
                      size: 50,
                    ),
                    Text(
                      "Nurul Haque Mia",
                      // style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      "Managing Director",
                      // style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      "Basic Shirts Limited.",
                      // style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      "Phone No:-+88-01729098851",
                      // style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      "E-mail: info@basicshirts.net",
                      // style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ];
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListView(
        children: [
          Text(
            "Contacts",
            style: Theme.of(context)
                .textTheme
                .displayMedium
                ?.copyWith(color: Theme.of(context).colorScheme.onSurface),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "For further information and enquiries please contact:",
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          LayoutBuilder(builder: (context, constraints) {
            if (constraints.maxWidth >= 600) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(child: _profiles[0]),
                  Expanded(child: _profiles[1]),
                ],
              );
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: _profiles,
            );
          }),
          const SizedBox(
            height: 16,
          ),
          Text(
            "Address",
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: IntrinsicHeight(
              child: Row(
                children: [
                  Container(
                    width: 2,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text(
                          "1) BASIC SHIRTS LTD.",
                          // style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Text(
                          "Basic Tower, Majukhan, Harbaid, Gazipur Sadar, Gazipur. Dhaka, Bangladesh.",
                          // style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Text(
                          "Phone : 04478333301-7",
                          // style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Text(
                          "Fax :+88-02-9011415",
                          // style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          LayoutBuilder(builder: (context, constraints) {
            if (constraints.maxWidth >= 650) {
              return IntrinsicHeight(
                child: Row(
                  children: const [
                    Expanded(child: ContactFormView()),
                    Expanded(child: LocationMapView()),
                  ],
                ),
              );
            }
            return Column(
              children: const [
                ContactFormView(),
                AspectRatio(aspectRatio: 1, child: LocationMapView()),
              ],
            );
          }),
        ],
      ),
    );
  }
}

class LocationMapView extends StatelessWidget {
  const LocationMapView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      surfaceTintColor: Theme.of(context).colorScheme.surfaceTint,
      color: Theme.of(context).colorScheme.surface,
      child: const Center(
        child: Text("Location Map..."),
      ),
    );
  }
}

class ContactFormView extends StatelessWidget {
  const ContactFormView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      surfaceTintColor: Theme.of(context).colorScheme.surfaceTint,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              "Contact Form",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(
              height: 10,
            ),
            const TextField(
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Name"),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const TextField(
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Email"),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 300,
              child: TextField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                expands: true,
                textAlignVertical: TextAlignVertical.top,
                textInputAction: TextInputAction.newline,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  alignLabelWithHint: true,
                  label: Text("Message"),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).colorScheme.primary,
                  onPrimary: Theme.of(context).colorScheme.onPrimary,
                ),
                icon: const Icon(Icons.send),
                label: const Text("Send"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}