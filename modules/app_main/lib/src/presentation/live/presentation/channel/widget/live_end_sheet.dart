import 'package:design_system/generated/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LiveEndSheet extends StatelessWidget {
  const LiveEndSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(
        top: Radius.circular(8.0),
      ),
      child: Container(
        height: ScreenUtil().screenHeight * 0.8,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(8.0),
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            leading: const CloseButton(),
            centerTitle: true,
            title: const Text(
              'Kết thúc live',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox.square(
                    dimension: 118,
                    child: Assets.icons_lives_avatar.image(),
                  ),
                  const SizedBox(height: 24),
                  const Row(
                    children: [
                      _Header(title: '512', sub: 'Người theo dõi mới'),
                      _Header(title: '124.892', sub: 'Người xem'),
                      _Header(title: '22', sub: 'Số người tặng quà'),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffF4F4F4),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        const Text(
                          'Novice',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                            height: 1.2,
                          ),
                        ),
                        const Spacer(),
                        Assets.icons_lives_chevron_down.svg(),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Thời gian Live',
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xff6E6E6E),
                                height: 1.2,
                              ),
                            ),
                            Spacer(),
                            Text(
                              '+ 20',
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xff00A65F),
                                height: 1.2,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Text(
                              'Số người xem',
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xff6E6E6E),
                                height: 1.2,
                              ),
                            ),
                            Spacer(),
                            Text(
                              '+ 20',
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xff00A65F),
                                height: 1.2,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffF4F4F4),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        const Text(
                          'Chủ đề',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                            height: 1.2,
                          ),
                        ),
                        const Spacer(),
                        Assets.icons_lives_chevron_down.svg(),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Người xem mới',
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xff6E6E6E),
                                height: 1.2,
                              ),
                            ),
                            Spacer(),
                            Text(
                              '+ 20',
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xff00A65F),
                                height: 1.2,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Text(
                              'Người theo dõi mới',
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xff6E6E6E),
                                height: 1.2,
                              ),
                            ),
                            Spacer(),
                            Text(
                              '+ 20',
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xff00A65F),
                                height: 1.2,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
          bottomNavigationBar: ColoredBox(
            color: Colors.white,
            child: SafeArea(
              top: false,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: const Color(0xffF4F4F4),
                        ),
                        child: TextButton(
                          onPressed: Navigator.of(context).pop,
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          child: const Text(
                            'Thoát ra',
                            style: TextStyle(
                              color: Color(0xff6E6E6E),
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xff015CB5),
                              Color(0xff0E86FC),
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          child: const Text(
                            'Đăng bài',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({
    super.key,
    required this.title,
    required this.sub,
  });

  final String title;
  final String sub;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Color(0xff4B84F7),
              height: 1.5,
            ),
          ),
          Text(
            sub,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Color(0xff6E6E6E),
              height: 1.3,
            ),
          ),
        ],
      ),
    );
  }
}
