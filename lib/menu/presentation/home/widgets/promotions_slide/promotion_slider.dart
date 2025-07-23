// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';

import 'package:bom_hamburguer/menu/domain/entities/discount_entity.dart';

import 'promotions_item.dart';

class PromotionSlider extends StatefulWidget {
  const PromotionSlider({super.key, required this.discounts});
  final List<DiscountEntity> discounts;
  @override
  State<PromotionSlider> createState() => _PromotionSliderState();
}

class _PromotionSliderState extends State<PromotionSlider> {
  List<DiscountEntity> get discounts => widget.discounts;

  int currentIndex = 0;
  late Timer _timer;
  @override
  void initState() {
    super.initState();
    _startAutoSlide();
  }

  void _startAutoSlide() {
    _timer = Timer.periodic(const Duration(seconds: 10), (Timer timer) {
      setState(() {
        currentIndex = (currentIndex + 1) % discounts.length;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // sempre cancele o timer para evitar vazamento de memória
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PromotionsItem(actualDiscount: discounts[currentIndex]);
  }
}
