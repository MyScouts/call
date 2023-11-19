import 'package:app_main/src/core/extensions/datetime_ext.dart';
import 'package:pdf/widgets.dart';

import 'contract_ui_model.dart';
import 'default_textstyle.dart';

List<RuleInformationUIModel> getRuleInformation() {
  final currentDate = DateTime.now();
  final endContractDate = currentDate.isLeafYear
      ? currentDate.add(const Duration(days: 366))
      : currentDate.add(const Duration(days: 365));

  return [
    RuleInformationUIModel(
      title: 'Giải thích từ ngữ ',
      contents: [
        RuleInformationRowUIModel(
          style: RuleInformationRowLeadingStyle.number,
          content: TextSpan(
            style: defaultTextStyle,
            children: [
              TextSpan(
                text: '“Ứng dụng VDONE”',
                style: defaultTextStyle.copyWith(fontWeight: FontWeight.bold),
              ),
              const TextSpan(
                text:
                    ' là ứng dụng do Công ty cổ phần tập đoàn VIPTAM xây dựng và hoạt động trên hệ điều hành Android và IOS;',
              ),
            ],
          ),
        ),
        RuleInformationRowUIModel(
          style: RuleInformationRowLeadingStyle.number,
          content: TextSpan(
            style: defaultTextStyle,
            children: [
              TextSpan(
                text: '“Group”',
                style: defaultTextStyle.copyWith(fontWeight: FontWeight.bold),
              ),
              const TextSpan(
                text:
                    ' là cộng đồng các thành viên có tài khoản trên nền tảng ứng dụng Vdone nhằm kết nối, liên kết tham gia vào các hoạt động thương mại, việc làm, chia sẻ thông tin.',
              ),
            ],
          ),
        ),
        RuleInformationRowUIModel(
          style: RuleInformationRowLeadingStyle.number,
          content: TextSpan(
            style: defaultTextStyle,
            children: [
              TextSpan(
                text: '“Team”',
                style: defaultTextStyle.copyWith(fontWeight: FontWeight.bold),
              ),
              const TextSpan(
                text:
                    ' là một nhóm cộng đồng nhỏ nằm trong một Group, có mục tiêu định hướng rõ ràng.',
              ),
            ],
          ),
        ),
        RuleInformationRowUIModel(
          style: RuleInformationRowLeadingStyle.number,
          content: TextSpan(
            style: defaultTextStyle,
            children: [
              TextSpan(
                text: '“Boss Group”',
                style: defaultTextStyle.copyWith(fontWeight: FontWeight.bold),
              ),
              const TextSpan(
                text:
                    ' là người đứng đầu Group chịu trách nhiệm tổ chức hoạt động của Group đó và được hưởng thủ lao trên doanh số, lợi ích của tất cả các thành viên trong Group. Lợi ích được hưởng của Boss Group do Vdone quyết định. Một Bossgroup phải tối thiểu 20 BossTeam và tối đa không quá 200 BossTeam.',
              ),
            ],
          ),
        ),
        RuleInformationRowUIModel(
          style: RuleInformationRowLeadingStyle.number,
          content: TextSpan(
            style: defaultTextStyle,
            children: [
              TextSpan(
                text: '“Boss Team”',
                style: defaultTextStyle.copyWith(fontWeight: FontWeight.bold),
              ),
              const TextSpan(
                text:
                    ' là người đứng đầu Team do Boss Group chỉ định và chịu trách nhiệm tổ chức hoạt động của Team do mình phụ trách và được sự chấp thuận của Vdone. Boss Team phải có tài khoản P-Done và ký hợp đồng JA với Vdone hoặc  các nhóm nhỏ do Boss Group đề xuất và được sự chấp thuận của VDONE. Boss Team thuộc Boss Group quản lý. Mỗi Boss Team phải có tối thiểu 20 thành viên và tối đa 500 thành viên. Người đề nghị thành lập Team sẽ trở thành Boss Team của Team đó.',
              ),
            ],
          ),
        ),
      ],
    ),
    const RuleInformationUIModel(
      title: 'Nội dung Hợp đồng',
      contents: [
        RuleInformationRowUIModel(
          content: TextSpan(
            style: defaultTextStyle,
            text:
                'Bên B tự nguyện và đồng ý làm cộng tác viên cho Bên A với vị trí Boss Team trên ứng dụng VDONE.',
          ),
        ),
        RuleInformationRowUIModel(
          content: TextSpan(
            style: defaultTextStyle,
            text:
                'Công việc của Bên B cụ thể như sau:\nBên B lập tài khoản P-Done trên ứng dụng VDONE và thực hiện các công việc sau :\n……………………….\nĐịa điểm thực hiện công việc: Trên ứng dụng VDONE',
          ),
        ),
        RuleInformationRowUIModel(
          content: TextSpan(
            style: defaultTextStyle,
            text:
                'Bên A đồng ý trả thù lao cộng tác viên cho Bên B theo thỏa thuận tại Điều 5 Hợp Đồng này.',
          ),
        ),
      ],
    ),
    RuleInformationUIModel(
      title: 'Thời hạn Hợp Đồng',
      contents: [
        RuleInformationRowUIModel(
          bullet: ' ',
          content: TextSpan(
            style: defaultTextStyle,
            text:
                'Hợp đồng này có thời hạn ${currentDate.month} tháng/năm ${currentDate.year} (từ ngày ${currentDate.day} tháng ${currentDate.month} năm ${DateTime.now().year} đến ngày ${endContractDate.day} tháng ${endContractDate.month} năm ${endContractDate.year})',
          ),
        ),
      ],
    ),
    const RuleInformationUIModel(
      title: 'Quyền và nghĩa vụ của Bên A',
      contents: [
        RuleInformationRowUIModel(
          style: RuleInformationRowLeadingStyle.number,
          content: TextSpan(
            style: defaultTextStyle,
            text: 'Quyền :',
          ),
          nestedContents: [
            RuleInformationRowUIModel(
              content: TextSpan(
                style: defaultTextStyle,
                text: 'Yêu cầu Bên B thực hiện công việc theo như thỏa thuận;',
              ),
            ),
            RuleInformationRowUIModel(
              content: TextSpan(
                style: defaultTextStyle,
                text:
                    'Đơn phương chấm dứt Hợp đồng/chấm dứt sử dụng tài khoản của Bên B trong trường hợp Bên B vi phạm bất kỳ nghĩa vụ nào theo quy định tại Hợp đồng này và/hoặc vi phạm bất kỳ Điều khoản dịch vụ, các Chính sách, quy định của Bên A trên trên ứng dụng VDONE và/hoặc công việc do Bên B thực hiện không có hiệu quả theo đánh giá của Bên A; đồng thời yêu cầu Bên B bồi thường thiệt hại;',
              ),
            ),
          ],
        ),
        RuleInformationRowUIModel(
          style: RuleInformationRowLeadingStyle.number,
          content: TextSpan(
            style: defaultTextStyle,
            text: 'Nghĩa vụ :',
          ),
          nestedContents: [
            RuleInformationRowUIModel(
              content: TextSpan(
                style: defaultTextStyle,
                text: 'Trả thù lao cho Bên B theo như quy định tại Hợp đồng này;',
              ),
            ),
            RuleInformationRowUIModel(
              content: TextSpan(
                style: defaultTextStyle,
                text:
                    'Cung cấp thông tin, tài liệu và các phương tiện cần thiết để Bên B thực hiện công việc.',
              ),
            ),
          ],
        ),
      ],
    ),
    const RuleInformationUIModel(
      title: 'Quyền và nghĩa vụ của Bên B',
      contents: [
        RuleInformationRowUIModel(
          style: RuleInformationRowLeadingStyle.number,
          content: TextSpan(
            style: defaultTextStyle,
            text: 'Nghĩa vụ :',
          ),
          nestedContents: [
            RuleInformationRowUIModel(
              content: TextSpan(
                style: defaultTextStyle,
                text: 'Thực hiện các công việc nêu tại Điều 2 Hợp đồng này đúng theo thỏa thuận;',
              ),
            ),
            RuleInformationRowUIModel(
              content: TextSpan(
                style: defaultTextStyle,
                text:
                    'Không được làm Cộng tác viên cho các đơn vị khác có cùng sản phẩm/dịch vụ giống Bên A hoặc kinh doanh cùng ngành, nghề với Bên A./hoặc vi phạm bất kỳ Điều khoản dịch vụ, các Chính sách, quy định của Bên A trên trên ứng dụng VDONE và/hoặc công việc do Bên B thực hiện không có hiệu quả theo đánh giá của Bên A; đồng thời yêu cầu Bên B bồi thường thiệt hại;',
              ),
            ),
            RuleInformationRowUIModel(
              content: TextSpan(
                style: defaultTextStyle,
                text:
                    'Không được hưởng thù lao nếu vi phạm Hợp đồng này hoặc không hoàn thành công việc.',
              ),
            ),
            RuleInformationRowUIModel(
              content: TextSpan(
                style: defaultTextStyle,
                text:
                    'Bồi thường thiệt hại cho Bên A nếu làm mất, hư hỏng tài liệu, phương tiện, tài sản của Bên A giao, tiết lộ bí mật thông tin hoặc có hành vi gây thiệt hại hoặc ảnh hưởng đến uy tín, hình ảnh của Bên A.',
              ),
            ),
            RuleInformationRowUIModel(
              content: TextSpan(
                style: defaultTextStyle,
                text:
                    'Không được giao cho người khác thực hiện thay công việc nếu không có sự đồng ý của Bên A.',
              ),
            ),
            RuleInformationRowUIModel(
              content: TextSpan(
                style: defaultTextStyle,
                text:
                    'Bảo quản và phải giao lại cho Bên A tài liệu và phương tiện được giao sau khi hoàn thành công việc.',
              ),
            ),
            RuleInformationRowUIModel(
              content: TextSpan(
                style: defaultTextStyle,
                text:
                    'Báo ngay cho Bên A về việc thông tin, tài liệu không đầy đủ, phương tiện không bảo đảm chất lượng để hoàn thành công việc.',
              ),
            ),
            RuleInformationRowUIModel(
              content: TextSpan(
                style: defaultTextStyle,
                text: 'Bảo mật thông tin theo quy định tại Điều 7 Hợp đồng này.',
              ),
            ),
            RuleInformationRowUIModel(
              content: TextSpan(
                style: defaultTextStyle,
                text:
                    'Tuân theo Điều khoản dịch vụ, các Chính sách, quy định của Bên A trên trên ứng dụng VDONE.',
              ),
            ),
            RuleInformationRowUIModel(
              content: TextSpan(
                style: defaultTextStyle,
                text:
                    'Tự chịu trách nhiệm đối với các hành vi vi phạm pháp luật khi thực hiện công việc (nếu có).',
              ),
            ),
          ],
        ),
        RuleInformationRowUIModel(
          style: RuleInformationRowLeadingStyle.number,
          content: TextSpan(
            style: defaultTextStyle,
            text: 'Quyền :',
          ),
          nestedContents: [
            RuleInformationRowUIModel(
              content: TextSpan(
                style: defaultTextStyle,
                text:
                    'Yêu cầu Bên A trả thù lao Cộng tác viên theo thỏa thuận tại Điều 6 Hợp Đồng này.',
              ),
            ),
            RuleInformationRowUIModel(
              content: TextSpan(
                style: defaultTextStyle,
                text:
                    'Yêu cầu Bên A cung cấp thông tin, tài liệu và các phương tiện cần thiết để thực hiện công việc.',
              ),
            ),
          ],
        ),
      ],
    ),
    const RuleInformationUIModel(
      title: 'Thù lao và thanh toán',
      description: 'Bên B được hưởng thù lao quy đổi từ quà tặng, cụ thể như sau :',
      contents: [
        RuleInformationRowUIModel(
          style: RuleInformationRowLeadingStyle.number,
          content: TextSpan(
            style: defaultTextStyle,
            text:
                'Quy đổi quà tặng: Cộng tác viên (Bên B) sẽ nhận được Quà tặng số (Gifts) từ những người dùng trên nền tảng VDONE, những quà tặng này sẽ được chuyển đổi thành Kim cương (“Diamonds”) trong tài khoản của Cộng tác viên.',
          ),
        ),
        RuleInformationRowUIModel(
          style: RuleInformationRowLeadingStyle.number,
          content: TextSpan(
            style: defaultTextStyle,
            text:
                'Quy đổi kim cương: Kim cương chờ xác nhận và khả dụng sau 10 ngày kể từ lúc nhận Quà tặng số. Cộng tác viên có thể sử dụng Kim cương để tạo ra thu nhập bằng cách đặt lệnh đổi Kim cương từ tài khoản Kim cương sang tài khoản Việt Nam Đồng trên ứng dụng. Để rút tiền ra khỏi ứng dụng, Cộng tác viên sẽ đặt lệnh rút tiền và sẽ được chuyển tiền từ tài khoản Việt Nam Đồng vào tài khoản ngân hàng đã đăng ký.',
          ),
        ),
        RuleInformationRowUIModel(
          style: RuleInformationRowLeadingStyle.number,
          content: TextSpan(
            style: defaultTextStyle,
            text:
                'Thù lao của Cộng tác viên phụ thuộc vào khả năng phát triển, duy trì số lượng người theo dõi trên ứng dụng.',
          ),
        ),
        RuleInformationRowUIModel(
          style: RuleInformationRowLeadingStyle.number,
          content: TextSpan(
            style: defaultTextStyle,
            text:
                'Thuế thu nhập cá nhân: Bên B có nghĩa vụ nộp thuế thu nhập cá nhân theo quy định của pháp luật. Việc khấu trừ thuế được thực hiện theo quy định của pháp luật và Bên A.',
          ),
        ),
      ],
    ),
    const RuleInformationUIModel(
      title: 'Bảo mật',
      contents: [
        RuleInformationRowUIModel(
          bullet: '',
          content: TextSpan(
            style: defaultTextStyle,
            text:
                'Tất cả giấy tờ, tài liệu, thông tin trao đổi giữa Bên A với Bên B và các thông tin, tài liệu của Bên A mà Bên B biết được trong quá trình thực hiện công việc được xem là thuộc quyền sở hữu của Bên A. Bên B có trách nhiệm giữ bí mật các giấy tờ, tài liệu, thông tin đó và chỉ được tiết lộ cho người khác nếu được sự đồng ý trước bằng văn bản của Bên A. Bên B chỉ được sử dụng các thông tin, tài liệu do Bên A cung cấp để thực hiện công việc theo quy định tại Hợp đồng này. Nếu Bên B tiết lộ thông tin, tài liệu và/hoặc sử dụng vào mục đích khác và/hoặc có hành vi khác gây ảnh hưởng đến Bên A thì Bên B bị phạt số tiền là………..đồng/lần vi phạm, đồng thời bồi thường toàn bộ thiệt hại cho Bên A. Nếu Bên B vi phạm pháp luật thì Bên B còn phải chịu trách nhiệm theo quy định của pháp luật. Trách nhiệm bảo mật thông tin được áp dụng ngay cả khi Hợp đồng này chấm dứt.',
          ),
        ),
      ],
    ),
    const RuleInformationUIModel(
      title: 'Hiệu lực',
      contents: [
        RuleInformationRowUIModel(
          bullet: '',
          content: TextSpan(
            style: defaultTextStyle,
            text: 'Hợp Đồng này có hiệu lực kể từ ngày ký được đề tại phần đầu của Hợp Đồng.',
          ),
        ),
        RuleInformationRowUIModel(
          bullet: '',
          content: TextSpan(
            style: defaultTextStyle,
            text:
                'Hợp Đồng này gồm ..... trang bằng tiếng Việt, được lập thành 03 (ba) bản gốc, Bên A giữ 02 (hai) bản, Bên B giữ 01 (một) bản và có hiệu lực pháp lý như nhau.',
          ),
        ),
      ],
    ),
  ];
}
