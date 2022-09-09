import 'dart:math';

import 'package:bsl/src/clients/model.dart';
import 'package:flutter/material.dart';

class ClientsView extends StatelessWidget {
  const ClientsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constrains) {
      return GridView.count(
        padding: const EdgeInsets.all(10),
        crossAxisCount: constrains.maxWidth ~/ 350 + 1,
        mainAxisSpacing: 40,
        crossAxisSpacing: 40,
        children: [
          Client(
            "https://github.com/mozaddedalfeshani/bslphotos/raw/main/brand_logo/zara.png",
            "Desciption for zara.",
          ),
          Client(
            "https://github.com/mozaddedalfeshani/bslphotos/raw/main/brand_logo/Calliope.png",
            "Discription for call",
          ),
          // "zara.jpeg",
          // "mango.jpeg",
          // "john_lewis.png",
          // "tn.png",
          // "D&G.jpeg",
          // "JAJU.png",
          // "P_E.png",
          // "lefties.jpeg",
        ].map<Widget>((each) {
          return AnimatedClientCard(
            src: each.src,
            description: each.description,
          );
        }).toList(),
      );
    });
  }
}

class AnimatedClientCard extends StatefulWidget {
  const AnimatedClientCard({
    Key? key,
    required this.src,
    required this.description,
  }) : super(key: key);
  final String src;
  final String description;

  @override
  State<AnimatedClientCard> createState() => _AnimatedClientCardState();
}

class _AnimatedClientCardState extends State<AnimatedClientCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _rotateAnimation;
  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );
    _rotateAnimation = Tween<double>(
      begin: pi * 0.0,
      end: pi * 1,
    ).animate(_controller);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        if (_controller.isCompleted) {
          _controller.reverse();
        } else {
          _controller.forward();
        }
      },
      onHover: (value) {
        if (value) {
          _controller.forward();
        } else {
          _controller.reverse();
        }
      },
      child: AnimatedBuilder(
        animation: _rotateAnimation,
        builder: (context, child) {
          return Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(_rotateAnimation.value),
            alignment: Alignment.center,
            child: Card(
              elevation: 20,
              child: Padding(
                padding: const EdgeInsets.all(0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: (_controller.value > 0.5)
                      ? Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.rotationY(pi),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(widget.description),
                          ),
                        )
                      : Image(
                          image: NetworkImage(
                            widget.src,
                          ),
                          fit: BoxFit.contain,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress != null) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            return child;
                          },
                        ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
