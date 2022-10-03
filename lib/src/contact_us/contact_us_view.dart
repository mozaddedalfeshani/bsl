import 'package:bsl/utils/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ContactUsView extends StatefulWidget {
  const ContactUsView({super.key});

  @override
  State<ContactUsView> createState() => _ContactUsViewState();
}

class _ContactUsViewState extends State<ContactUsView> {
  @override
  Widget build(BuildContext context) {
    // final List<Widget> profiles = [
    //   Padding(
    //     padding: const EdgeInsets.all(10),
    //     child: IntrinsicHeight(
    //       child: Row(
    //         children: [
    //           Container(
    //             width: 2,
    //             color: Theme.of(context).colorScheme.onSurface,
    //           ),
    //           const SizedBox(
    //             width: 10,
    //           ),
    //           Expanded(
    //             child: Column(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               mainAxisSize: MainAxisSize.min,
    //               children: const [
    //                 Icon(
    //                   Icons.person,
    //                   size: 50,
    //                 ),
    //                 Text(
    //                   "Md. Nurul Islam, FCMA Chairman",
    //                   // style: Theme.of(context).textTheme.titleMedium,
    //                 ),
    //                 Text(
    //                   "Basic Shirts Limited.",
    //                   // style: Theme.of(context).textTheme.titleMedium,
    //                 ),
    //                 Text(
    //                   "Phone No:- +88-01775300619",
    //                   // style: Theme.of(context).textTheme.titleMedium,
    //                 ),
    //                 Text(
    //                   "+88-01190000131",
    //                   // style: Theme.of(context).textTheme.titleMedium,
    //                 ),
    //                 Text(
    //                   "E-mail: nurulislam@basicshirts.net ",
    //                   // style: Theme.of(context).textTheme.titleMedium,
    //                 ),
    //               ],
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    //   Padding(
    //     padding: const EdgeInsets.all(10),
    //     child: IntrinsicHeight(
    //       child: Row(
    //         children: [
    //           Container(
    //             width: 2,
    //             color: Theme.of(context).colorScheme.onSurface,
    //           ),
    //           const SizedBox(
    //             width: 10,
    //           ),
    //           Expanded(
    //             child: Column(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               mainAxisSize: MainAxisSize.min,
    //               children: const [
    //                 Icon(
    //                   Icons.person,
    //                   size: 50,
    //                 ),
    //                 Text(
    //                   "Nurul Haque Mia",
    //                   // style: Theme.of(context).textTheme.titleMedium,
    //                 ),
    //                 Text(
    //                   "Managing Director",
    //                   // style: Theme.of(context).textTheme.titleMedium,
    //                 ),
    //                 Text(
    //                   "Basic Shirts Limited.",
    //                   // style: Theme.of(context).textTheme.titleMedium,
    //                 ),
    //                 Text(
    //                   "Phone No:-+88-01729098851",
    //                   // style: Theme.of(context).textTheme.titleMedium,
    //                 ),
    //                 Text(
    //                   "E-mail: info@basicshirts.net",
    //                   // style: Theme.of(context).textTheme.titleMedium,
    //                 ),
    //               ],
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // ];
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListView(
        children: [
          // Text(
          //   "Contacts",
          //   style: Theme.of(context)
          //       .textTheme
          //       .displayMedium
          //       ?.copyWith(color: Theme.of(context).colorScheme.onSurface),
          // ),
          // const SizedBox(
          //   height: 5,
          // ),
          // Text(
          //   "For further information and enquiries please contact:",
          //   style: Theme.of(context)
          //       .textTheme
          //       .titleLarge
          //       ?.copyWith(fontWeight: FontWeight.bold),
          // ),
          // LayoutBuilder(builder: (context, constraints) {
          //   if (constraints.maxWidth >= 600) {
          //     return Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //       children: [
          //         Expanded(child: profiles[0]),
          //         Expanded(child: profiles[1]),
          //       ],
          //     );
          //   }
          //   return Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: profiles,
          //   );
          // }),
          // const SizedBox(
          //   height: 16,
          // ),
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
                          "BASIC SHIRTS LTD.",
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
    return GestureDetector(
      onTap: () async {
        bool launched = await launchUrlString(
          "https://goo.gl/maps/ChzGLqEQCah3cp77A",
          // mode: LaunchMode.inAppWebView,
        );
        if (!launched) {
          // ignore: use_build_context_synchronously
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Cant launched!"),
            ),
          );
        }
      },
      child: Card(
        elevation: 2,
        surfaceTintColor: Theme.of(context).colorScheme.surfaceTint,
        color: Theme.of(context).colorScheme.surface,
        child: Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: CachedNetworkImage(
              imageUrl: "https://$imageUrl/maps/location.png",
              progressIndicatorBuilder: (context, url, progress) {
                return Center(
                  child: CircularProgressIndicator(
                    value: progress.progress,
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class ContactFormView extends StatefulWidget {
  const ContactFormView({
    Key? key,
  }) : super(key: key);

  @override
  State<ContactFormView> createState() => _ContactFormViewState();
}

class _ContactFormViewState extends State<ContactFormView> {
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  bool change = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      surfaceTintColor: Theme.of(context).colorScheme.surfaceTint,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _form,
          child: Column(
            children: [
              Text(
                "Contact Form",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return "Name field is empty.";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Name"),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value?.trim().isEmpty ?? true) {
                    return "Email cant be empty.";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Email"),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 300,
                child: TextFormField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  expands: true,
                  textAlignVertical: TextAlignVertical.top,
                  textInputAction: TextInputAction.newline,
                  validator: (value) {
                    if (value?.trim().isEmpty ?? true) {
                      return "message cant be empty.";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    alignLabelWithHint: true,
                    label: Text("Message"),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              AnimatedSendButton(
                onPressed: () {
                  if (!(_form.currentState?.validate() ?? false)) {
                    return;
                  }
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Not Implemented yet."),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                },
              ),
              // Align(
              //   alignment: Alignment.centerRight,
              //   child: ElevatedButton.icon(
              //     onPressed: () {},
              //     style: ElevatedButton.styleFrom(
              //       primary: Theme.of(context).colorScheme.primary,
              //       onPrimary: Theme.of(context).colorScheme.onPrimary,
              //     ),
              //     icon: const Icon(Icons.send),
              //     label: const Text("Send"),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class AnimatedSendButton extends StatefulWidget {
  const AnimatedSendButton({super.key, required this.onPressed});
  final VoidCallback? onPressed;

  @override
  State<AnimatedSendButton> createState() => _AnimatedSendButtonState();
}

class _AnimatedSendButtonState extends State<AnimatedSendButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<Size?> _sizeAnimation;
  @override
  void initState() {
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );
    _sizeAnimation = SizeTween(
      begin: const Size(130, 40),
      end: const Size(55, 55),
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeIn,
      ),
    );
    super.initState();
    _animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (widget.onPressed != null) {
          widget.onPressed!();
        }
        if (_animationController.isCompleted) {
          _animationController.reverse();
        } else {
          _animationController.forward();
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
        foregroundColor: Theme.of(context).colorScheme.onSecondaryContainer,
        fixedSize: _sizeAnimation.value,
      ).copyWith(
        elevation: ButtonStyleButton.allOrNull(0),
      ),
      child: (_animationController.value == 1)
          ? const Icon(Icons.check)
          : const Icon(Icons.send),
    );
  }
}
