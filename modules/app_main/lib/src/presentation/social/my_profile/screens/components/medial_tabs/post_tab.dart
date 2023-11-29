
import 'package:app_main/src/presentation/shared/user/views/user_avatar_widget.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:ui/ui.dart';

import '../../widgets/multiple_image.dart';

class PostTab extends StatefulWidget {
  const PostTab({super.key});

  @override
  State<PostTab> createState() => _PostTabState();
}

class _PostTabState extends State<PostTab> with AutomaticKeepAliveClientMixin {
  // late final _controller = getIt<ManageProtectController>();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return CustomScrollView(
      shrinkWrap: true,
      key: widget.key,
      slivers: [
        SliverToBoxAdapter(
          child: Container(
            color: AppColors.white,
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildPost(),
                _buildPost(),
                _buildPost(),
                _buildPost(),
                _buildPost(),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _buildPost() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 16),
                    child: UserAvatarWidget(size: 42),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildInfoDetail(),
                        const SizedBox(height: 2),
                        _buildPostTime(),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 172,
                child: CommonMultiImageView.multiAsset(
                  listAssetPath: [
                    ImageConstants.banner,
                    ImageConstants.banner,
                    ImageConstants.banner,
                    ImageConstants.banner,
                    ImageConstants.banner,
                  ],
                  width: double.infinity,
                  radius: 12,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Hãy vui cùng tôi 🥰🥰🥰🥰🥰🥰',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const ReadMoreHashtag(
                data:
                    '''Một bức ảnh với phong cảnh thật đẹp phải không ạ? 🤩 Mới được đến một đất nước đầy sự lãng mạn và thật sự ấn tượng bởi những con người ở nơi này Hẹn một ngày gặp lại 🥰🥰🥰\n#likes4like #beautifulview #love''',
                trimMode: TrimModeRM.LINE,
                trimLines: 3,
                expandedText: '',
                collapsedText: '...Xem thêm',
                dataStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                colorHighlightDetectedText: AppColors.blue34,
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        ImageWidget(
                          IconAppConstants.icHeartRd,
                          width: 16,
                          height: 16,
                        ),
                        SizedBox(width: 5),
                        const Text(
                          'Bạn, Linh và 287 người khác',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: AppColors.grey76,
                          ),
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 28),
                    child: Text(
                      '34 bình luận',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: AppColors.grey76,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10),
              _buildInteract(),
              _buildLatestComment(),
            ],
          ),
        ),
        const SizedBox(height: 28),
        const Divider(),
        const SizedBox(height: 28),
      ],
    );
  }

  Widget _buildLatestComment() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 16),
              child: UserAvatarWidget(size: 42),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  const Text(
                                    'Văn Thành',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.black10,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                  ImageWidget(
                                    IconAppConstants.icShopVdone,
                                    width: 24,
                                    height: 24,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 8),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      _buildPostTime(),
                    ],
                  ),
                  const SizedBox(width: 4),
                  const Text(
                    '@VN1234567891',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.grey77,
                    ),
                  ),
                  const Text(
                    'Ôi đẹp ghê :)) Cho xin 1 chuyến đi cùng đi 🥰 Cơ mà không có tiền :<',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 9),
                  Row(
                    children: [
                      ImageWidget(
                        IconAppConstants.icHeartActive,
                        width: 16,
                        height: 16,
                      ),
                      const SizedBox(width: 5),
                      Text('12',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.red70)),
                      const SizedBox(width: 14),
                      ImageWidget(
                        IconAppConstants.icComment,
                        width: 16,
                        height: 16,
                      ),
                      const SizedBox(width: 5),
                      Text('Phản hồi',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600)),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: const VerticalDivider(),
    );
  }

  Widget _buildInteract() {
    return SizedBox(
      height: 56,
      child: Row(
        children: [
          _buildItemInteract(
            text: 'Thích',
            iconName: IconAppConstants.icHeart,
            isLike: true,
          ),
          _buildDivider(),
          _buildItemInteract(
            text: 'Bình luận',
            iconName: IconAppConstants.icHeart,
          ),
          _buildDivider(),
          _buildItemInteract(
            text: 'Chia sẻ',
            iconName: IconAppConstants.icHeart,
          ),
        ],
      ),
    );
  }

  Widget _buildItemInteract(
      {required String text, required String iconName, bool isLike = false}) {
    return Expanded(
      flex: 3,
      child: InkWell(
        onTap: () => print('OnTap interact'),
        child: Container(
          height: 40,
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ImageWidget(iconName, width: 16, height: 16),
              const SizedBox(width: 10),
              Text(
                text,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.grey76,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPostTime() {
    return const Text(
      '2 phút trước',
      style: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: AppColors.grey77,
      ),
    );
  }

  Widget _buildInfoDetail() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Text(
              'Trang Trần',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.black10,
              ),
            ),
            const SizedBox(width: 4),
            ImageWidget(
              IconAppConstants.icShopVdone,
              width: 24,
              height: 24,
            ),
            const SizedBox(width: 8),
            const Text(
              '@VN1234567891',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.grey77,
              ),
            ),
          ],
        ),
        GestureDetector(
          onTap: () => print('setting'),
          child: const Icon(
            Icons.more_vert,
            size: 24,
          ),
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
