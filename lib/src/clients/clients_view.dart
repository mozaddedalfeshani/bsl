import 'dart:math';

import 'package:bsl/src/clients/model.dart';
import 'package:bsl/utils/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
          //#1 position
          Client(
            "https://$imageUrl/brand_logo/zara.png",
            "ZARA is a Spanish multi-national retail clothing chain. It specialises in fast fashion, and sells clothing, accessories, shoes, beauty products and perfumes",
          ),
          //#2 postion
          Client(
            "https://$imageUrl/brand_logo/Mango.png",
            "Italian multinational clothing-retail company",
          ),
          //#3 postion
          // Client(
          //   "https://$imageUrl/brand_logo/Calliope.png",
          //   "Italian multinational clothing-retail company",
          // ),
          //#4 position
          Client(
            "https://$imageUrl/brand_logo/Terranova.png",
            "Italian multinational clothing-retail company",
          ),
          // #5 postion
          Client(
            "https://$imageUrl/brand_logo/jaju.png",
            "Italian multinational clothing-retail company",
          ),
          // #6 positon
          Client(
            "https://$imageUrl/brand_logo/ms.png",
            "Italian multinational clothing-retail company",
          ),
          //#7 position
          Client(
            "https://$imageUrl/brand_logo/jaju.png",
            "Italian multinational clothing-retail company",
          ),

          //#8 position
          Client(
            "https://$imageUrl/brand_logo/HENBURY.png",
            "Italian multinational clothing-retail company",
          ),
          // #9 position

          Client(
            "https://$imageUrl/brand_logo/PE.png",
            "Italian multinational clothing-retail company",
          ),

          // #10 position
          Client("https://$imageUrl/brand_logo/jl.png", "description"),
          // #11 position
          Client("https://$imageUrl/brand_logo/DS.jpeg", "description"),
          // #12 position
          Client("https://$imageUrl/brand_logo/engle.png", "description"),
          // #13 position
          Client("https://$imageUrl/brand_logo/trutex.jpg", "description"),

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
                      : CachedNetworkImage(
                          imageUrl: widget.src,
                          fit: BoxFit.contain,
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) {
                            return Center(
                              child: CircularProgressIndicator(
                                  value: downloadProgress.progress),
                            );
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
