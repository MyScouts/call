import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

export 'package:carousel_slider/carousel_slider.dart';

class CarouselSliderWidget extends StatelessWidget {
  final List<Widget> items;
  final bool autoPlay;
  final Duration autoPlayInterval;
  final int initialIndex;
  final double viewportFraction;
  final bool enlargeCenterPage;
  final double aspectRatio;
  final CenterPageEnlargeStrategy enlargeStrategy;
  final void Function(int, CarouselPageChangedReason)? onPageChanged;
  final CarouselController? controller;

  const CarouselSliderWidget({
    super.key,
    required this.items,
    this.autoPlay = true,
    this.autoPlayInterval = const Duration(
      seconds: 5,
    ),
    this.initialIndex = 0,
    this.viewportFraction = 0.8,
    this.enlargeCenterPage = true,
    this.onPageChanged,
    this.enlargeStrategy = CenterPageEnlargeStrategy.scale,
    this.aspectRatio = 2,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      carouselController: controller,
      options: CarouselOptions(
        initialPage: initialIndex,
        autoPlay: autoPlay,
        autoPlayInterval: autoPlayInterval,
        aspectRatio: aspectRatio,
        enlargeCenterPage: enlargeCenterPage,
        viewportFraction: viewportFraction,
        enlargeStrategy: enlargeStrategy,
        onPageChanged: onPageChanged,
      ),
      items: items,
    );
  }
}
