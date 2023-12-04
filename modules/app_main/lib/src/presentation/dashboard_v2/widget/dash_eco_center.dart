import 'package:app_main/src/core/extensions/list_extension.dart';
import 'package:design_system/generated/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';

class DashEcoCenter extends StatelessWidget {
  const DashEcoCenter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14.0),
      ),
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const _Header(),
          const Text(
            'Siêu thị tại gia',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Color(0xff8C8C8C),
            ),
          ),
          Expanded(
            child: GridView.count(
              padding: EdgeInsets.zero,
              crossAxisCount: 3,
              childAspectRatio: 1,
              crossAxisSpacing: 8,
              mainAxisSpacing: 4,
              children: [
                _EcoCard(
                  path: Assets.icons_dashboard_eco_1.path,
                  price: '576.000đ',
                ),
                _EcoCard(
                  path: Assets.icons_dashboard_eco_2.path,
                  price: '5.276.000đ',
                ),
                _EcoCard(
                  path: Assets.icons_dashboard_eco_3.path,
                  price: '264.578đ',
                ),
                _EcoCard(
                  path: Assets.icons_dashboard_eco_4.path,
                  price: '576.000đ',
                ),
                _EcoCard(
                  path: Assets.icons_dashboard_eco_5.path,
                  price: '5.276.000đ',
                ),
                _EcoCard(
                  path: Assets.icons_dashboard_eco_6.path,
                  price: '264.578đ',
                ),
                _EcoCard(
                  path: Assets.icons_dashboard_eco_1.path,
                  price: '576.000đ',
                ),
                _EcoCard(
                  path: Assets.icons_dashboard_eco_2.path,
                  price: '5.276.000đ',
                ),
                _EcoCard(
                  path: Assets.icons_dashboard_eco_3.path,
                  price: '264.578đ',
                ),
              ],
            ),
          ),
        ].separated(const SizedBox(height: 4)),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ImageWidget(Assets.icons_dashboard_shop.path),
        const SizedBox(width: 6),
        const Text(
          'MarketHome',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}

class _EcoCard extends StatelessWidget {
  const _EcoCard({super.key, required this.path, required this.price});

  final String path;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        ImageWidget(path, borderRadius: 8),
        Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
            ),
            margin: const EdgeInsets.all(4),
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
            child: Text(
              price,
              style: const TextStyle(
                fontSize: 9,
                fontWeight: FontWeight.w600,
                color: Colors.black,
                height: 1.2,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
