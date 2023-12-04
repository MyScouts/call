import 'package:app_main/src/core/extensions/list_extension.dart';
import 'package:design_system/generated/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';

class DashCmCenter extends StatelessWidget {
  const DashCmCenter({super.key});

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
        children: <Widget>[
          const _Header(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  const _NewCard(),
                  const _NewCard2(),
                  const _NewCard(),
                  const _NewCard2(),
                  const _NewCard(),
                  const _NewCard2(),
                  const _NewCard(),
                ].separated(const SizedBox(height: 10)),
              ),
            ),
          ),
        ].separated(const SizedBox(height: 10)),
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
        ImageWidget(Assets.icons_dashboard_fire.path),
        const SizedBox(width: 6),
        const Text(
          'Tin tức nhanh',
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

class _NewCard extends StatelessWidget {
  const _NewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6.0),
            child: SizedBox.square(
              dimension: 50,
              child: ImageWidget(
                Assets.icons_dashboard_news.path,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 4),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    'Một bức ảnh với một phong cảnh thật hoành tráng và n...',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 2,
                  ),
                ),
                Text(
                  '20 phút trước',
                  style: TextStyle(
                    fontSize: 9,
                    height: 1.2,
                    color: Color(0xffACACAC),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _NewCard2 extends StatelessWidget {
  const _NewCard2({super.key});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6.0),
            child: SizedBox.square(
              dimension: 50,
              child: ImageWidget(
                Assets.icons_dashboard_new_2.path,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 4),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    'Mới được đến một đất nước đầy sự lãng mạn và thật sự...',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 2,
                  ),
                ),
                Text(
                  '50 phút trước',
                  style: TextStyle(
                    fontSize: 9,
                    height: 1.2,
                    color: Color(0xffACACAC),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}