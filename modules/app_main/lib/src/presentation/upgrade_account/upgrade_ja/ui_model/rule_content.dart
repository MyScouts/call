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
    const RuleInformationUIModel(
      title: 'Nội dung Hợp Đồng JA',
      contents: [
        RuleInformationRowUIModel(
          content: TextSpan(
            text:
                'Bên B tự nguyện và đồng ý làm cộng tác viên cho Bên A thực hiện các nhiệm vụ trên ứng dụng VDONE.',
            style: defaultTextStyle,
          ),
        ),
        RuleInformationRowUIModel(
          content: TextSpan(
            text:
                'Công việc của Bên B cụ thể như sau:\nBên B lập tài khoản P-Done trên 18 tuổi (trừ một số ngành, nghề riêng biệt theo quy định của Bộ Luật Lao Động) và là thành viên của một Team cộng đồng (Group hoặc Team) trên ứng dụng VDONE để được cấp mã số (gọi tắt là “Mã JA”) và tham gia các nhiệm vụ của VDONE:',
            style: defaultTextStyle,
          ),
          nestedContents: [
            RuleInformationRowUIModel(
              style: RuleInformationRowLeadingStyle.letter,
              content: TextSpan(
                text: 'a) Cộng tác viên qua làm nhiệm vụ IDOL/KOL...',
                style: defaultTextStyle,
              ),
            ),
            RuleInformationRowUIModel(
              style: RuleInformationRowLeadingStyle.letter,
              content: TextSpan(
                text:
                    'b) Tham gia các hoạt động phát trực tiếp (livestream) tư vấn, giới thiệu bán hàng, quảng cáo sản phẩm; ',
                style: defaultTextStyle,
              ),
            ),
            RuleInformationRowUIModel(
              style: RuleInformationRowLeadingStyle.letter,
              content: TextSpan(
                text:
                    'c) Các hình thức khác do Bên A hoặc đơn vị thứ 3 của VDONE cung cấp dịch vụ, sản phẩm, hàng hóa;',
                style: defaultTextStyle,
              ),
            ),
          ],
        ),
        RuleInformationRowUIModel(
          content: TextSpan(
            text: 'Địa điểm thực hiện công việc: Trên ứng dụng VDONE',
            style: defaultTextStyle,
          ),
        ),
        RuleInformationRowUIModel(
          content: TextSpan(
            text:
                'Bên A đồng ý trả thù lao cộng tác viên cho Bên B theo thỏa thuận tại Hợp Đồng JA này.',
            style: defaultTextStyle,
          ),
        ),
      ],
    ),
    const RuleInformationUIModel(
      title: 'Thời hạn Hợp Đồng JA',
      contents: [
        RuleInformationRowUIModel(
          style: RuleInformationRowLeadingStyle.none,
          content: TextSpan(
            text:
                'Hợp Đồng JA này có thời hạn 12 tháng kể từ ngày được cấp mã JA hoặc khi Bên B nhấn nút đồng ý hoặc được gửi mã OTP về số điện thoại đã đăng ký với Bên A.',
            style: defaultTextStyle,
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
            text: 'Quyền :',
            style: defaultTextStyle,
          ),
          nestedContents: [
            RuleInformationRowUIModel(
              style: RuleInformationRowLeadingStyle.letter,
              content: TextSpan(
                text: 'a)	Yêu cầu Bên B thực hiện công việc theo như thỏa thuận;',
                style: defaultTextStyle,
              ),
            ),
            RuleInformationRowUIModel(
              style: RuleInformationRowLeadingStyle.letter,
              content: TextSpan(
                text:
                    'b)	Đơn phương chấm dứt Hợp Đồng JA/chấm dứt sử dụng tài khoản của Bên B trong trường hợp Bên B vi phạm bất kỳ nghĩa vụ nào theo quy định tại Hợp Đồng JA này và/hoặc vi phạm bất kỳ Điều khoản dịch vụ, các Chính sách, quy định của Bên A trên trên ứng dụng VDONE và/hoặc công việc do Bên B thực hiện không có hiệu quả theo đánh giá của Bên A; đồng thời yêu cầu Bên B bồi thường thiệt hại;',
                style: defaultTextStyle,
              ),
            ),
            RuleInformationRowUIModel(
              style: RuleInformationRowLeadingStyle.letter,
              content: TextSpan(
                text:
                    'c)	Yêu cầu Bên B thực hiện đúng các chính sách, quy định của Bên A tại từng thời điểm và được ghi nhận rõ tại các chính sách chung của VDONE;',
                style: defaultTextStyle,
              ),
            ),
            RuleInformationRowUIModel(
              style: RuleInformationRowLeadingStyle.letter,
              content: TextSpan(
                text: 'd)	Các quyền khác được ghi nhận trên nền tảng VDONE tại từng thời điểm.',
                style: defaultTextStyle,
              ),
            ),
          ],
        ),
        RuleInformationRowUIModel(
          style: RuleInformationRowLeadingStyle.number,
          content: TextSpan(
            text: 'Nghĩa vụ :',
            style: defaultTextStyle,
          ),
          nestedContents: [
            RuleInformationRowUIModel(
              style: RuleInformationRowLeadingStyle.letter,
              content: TextSpan(
                text:
                    'a)	Trả thù lao/hoa hồng/chiết khấu cho Bên B theo như quy định tại Hợp Đồng JA này;',
                style: defaultTextStyle,
              ),
            ),
            RuleInformationRowUIModel(
              style: RuleInformationRowLeadingStyle.letter,
              content: TextSpan(
                text:
                    'b)	Cung cấp thông tin, tài liệu và các phương tiện cần thiết để Bên B thực hiện công việc;',
                style: defaultTextStyle,
              ),
            ),
            RuleInformationRowUIModel(
              style: RuleInformationRowLeadingStyle.letter,
              content: TextSpan(
                text: 'c)	Kê khai, nộp thuế TNCN thay cho Bên A.',
                style: defaultTextStyle,
              ),
            ),
            RuleInformationRowUIModel(
              style: RuleInformationRowLeadingStyle.letter,
              content: TextSpan(text: '\n\n\n\n\n\n\n\n\n\n\n\n\n\n'),
            ),
            RuleInformationRowUIModel(
              style: RuleInformationRowLeadingStyle.letter,
              content: TextSpan(text: '\n\n\n\n\n\n\n\n\n\n\n\n\n\n'),
            ),
            RuleInformationRowUIModel(
              style: RuleInformationRowLeadingStyle.letter,
              content: TextSpan(text: '\n\n\n\n\n\n\n\n\n\n\n\n\n\n'),
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
            text: 'Nghĩa vụ :',
            style: defaultTextStyle,
          ),
          nestedContents: [
            RuleInformationRowUIModel(
              style: RuleInformationRowLeadingStyle.letter,
              content: TextSpan(
                text:
                    'a.	Thực hiện các công việc nêu tại Điều 1 Hợp Đồng JA này đúng theo thỏa thuận;',
                style: defaultTextStyle,
              ),
            ),
            RuleInformationRowUIModel(
              style: RuleInformationRowLeadingStyle.letter,
              content: TextSpan(
                text:
                    'b.	Không được làm Cộng tác viên cho các đơn vị khác có cùng sản phẩm/dịch vụ giống Bên A hoặc kinh doanh cùng ngành, nghề với Bên A.',
                style: defaultTextStyle,
              ),
            ),
            RuleInformationRowUIModel(
              style: RuleInformationRowLeadingStyle.letter,
              content: TextSpan(
                text:
                    'c.	Không được hưởng thù lao/hoa hồng/chiết khấu nếu vi phạm Hợp Đồng JA này hoặc không hoàn thành công việc.',
                style: defaultTextStyle,
              ),
            ),
            RuleInformationRowUIModel(
              style: RuleInformationRowLeadingStyle.letter,
              content: TextSpan(
                text:
                    'd.	Bồi thường thiệt hại cho Bên A nếu làm mất, hư hỏng tài liệu, phương tiện, tài sản của Bên A giao, tiết lộ bí mật thông tin hoặc có hành vi gây thiệt hại hoặc ảnh hưởng đến uy tín, hình ảnh của Bên A.',
                style: defaultTextStyle,
              ),
            ),
            RuleInformationRowUIModel(
              style: RuleInformationRowLeadingStyle.letter,
              content: TextSpan(
                text:
                    'e.	Không được giao cho người khác thực hiện thay công việc nếu không có sự đồng ý của Bên A.',
                style: defaultTextStyle,
              ),
            ),
            RuleInformationRowUIModel(
              style: RuleInformationRowLeadingStyle.letter,
              content: TextSpan(
                text:
                    'f.	Bảo quản và phải giao lại cho Bên A tài liệu và phương tiện được giao sau khi hoàn thành công việc.',
                style: defaultTextStyle,
              ),
            ),
            RuleInformationRowUIModel(
              style: RuleInformationRowLeadingStyle.letter,
              content: TextSpan(
                text:
                    'g.	Báo ngay cho Bên A về việc thông tin, tài liệu không đầy đủ, phương tiện không bảo đảm chất lượng để hoàn thành công việc.',
                style: defaultTextStyle,
              ),
            ),
            RuleInformationRowUIModel(
              style: RuleInformationRowLeadingStyle.letter,
              content: TextSpan(
                text: 'h.	Bảo mật thông tin theo quy định tại Hợp Đồng JA này.',
                style: defaultTextStyle,
              ),
            ),
            RuleInformationRowUIModel(
              style: RuleInformationRowLeadingStyle.letter,
              content: TextSpan(
                text:
                    'i.	Tuân theo Điều khoản dịch vụ, các Chính sách, quy định của Bên A trên trên ứng dụng VDONE.',
                style: defaultTextStyle,
              ),
            ),
            RuleInformationRowUIModel(
              style: RuleInformationRowLeadingStyle.letter,
              content: TextSpan(
                text:
                    'j.	Tự nguyện trích 10% hoặc một tỷ lệ khác theo quy định của pháp luật tùy từng thời điểm từ thù lao được hưởng để Bên A kê khai và nộp thuế thu nhập cá nhân (TNCN) thay cho Bên B; ',
                style: defaultTextStyle,
              ),
            ),
            RuleInformationRowUIModel(
              style: RuleInformationRowLeadingStyle.letter,
              content: TextSpan(
                text:
                    'k.	Tự nộp các khoản thuế, phí, lệ phí khác (trừ thuế TNCN) từ các khoản thù lao hoặc lợi ích khác được nhận khi làm việc tại VDONE trong thời gian Hợp Đồng JA có hiệu lực. ',
                style: defaultTextStyle,
              ),
            ),
            RuleInformationRowUIModel(
              style: RuleInformationRowLeadingStyle.letter,
              content: TextSpan(
                text:
                    'l.	Không được hưởng thù lao/hoa hồng/chiết khấu khi không còn duy trì được tài khoản P-Done và không thuộc thành viên của bất kỳ Team nào.',
                style: defaultTextStyle,
              ),
            ),
            RuleInformationRowUIModel(
              style: RuleInformationRowLeadingStyle.letter,
              content: TextSpan(
                text:
                    'm.	Tự chịu trách nhiệm đối với các hành vi vi phạm pháp luật khi thực hiện công việc (nếu có).',
                style: defaultTextStyle,
              ),
            ),
          ],
        ),
        RuleInformationRowUIModel(
          style: RuleInformationRowLeadingStyle.number,
          content: TextSpan(
            text: 'Quyền:',
            style: defaultTextStyle,
          ),
          nestedContents: [
            RuleInformationRowUIModel(
              style: RuleInformationRowLeadingStyle.letter,
              content: TextSpan(
                text:
                    'a.	Yêu cầu Bên A trả thù lao Cộng tác viên theo thỏa thuận tại Điều 6 Hợp Đồng JA này.',
                style: defaultTextStyle,
              ),
            ),
            RuleInformationRowUIModel(
              style: RuleInformationRowLeadingStyle.letter,
              content: TextSpan(
                text:
                    'b.	Yêu cầu Bên A cung cấp thông tin, tài liệu và các phương tiện cần thiết để thực hiện công việc.',
                style: defaultTextStyle,
              ),
            ),
          ],
        ),
      ],
    ),
    const RuleInformationUIModel(
      title: 'Thù lao và thanh toán',
      description:
          'Bên B được hưởng thù lao quy đổi từ quà tặng hoặc các khoản thù lao được hưởng từ hoa hồng/chiết khấu từ nhà cung cấp, nhà sản xuất hoặc các khoản lợi ích khác có được trong thời gian Hợp Đồng JA có hiệu lực, tùy từng thời điểm theo chính sách của Bên A, cụ thể như sau :',
      contents: [
        RuleInformationRowUIModel(
          style: RuleInformationRowLeadingStyle.number,
          content: TextSpan(
            text:
                'Quy đổi quà tặng: Cộng tác viên (Bên B) sẽ nhận được Quà tặng số (Gifts) từ những người dùng trên nền tảng VDONE.',
            style: defaultTextStyle,
          ),
        ),
        RuleInformationRowUIModel(
          style: RuleInformationRowLeadingStyle.number,
          content: TextSpan(
            text:
                'Quy đổi vật phẩm (tên gọi vật phẩm theo quy định của Bên A tại từng thời điểm- Dù tên gọi vật phẩm là bất kỳ tên gì thì cũng chỉ có ý nghĩa trên nền tảng VDONE, không có ý nghĩa là vật có giá theo quy định của pháp luật): Bên B có thể sử dụng vật phẩm để tạo ra thu nhập bằng cách đặt lệnh đổi vật phẩm từ tài khoản trên ứng dụng VDONE sang tài khoản Việt Nam Đồng. Để rút tiền ra khỏi ứng dụng, Bên B sẽ đặt lệnh rút tiền và sẽ được chuyển tiền từ tài khoản Việt Nam Đồng vào tài khoản ngân hàng đã đăng ký.',
            style: defaultTextStyle,
          ),
        ),
        RuleInformationRowUIModel(
          style: RuleInformationRowLeadingStyle.number,
          content: TextSpan(
            text:
                'Thù lao của Bên B phụ thuộc vào khả năng phát triển, duy trì số lượng người theo dõi trên ứng dụng.',
            style: defaultTextStyle,
          ),
        ),
      ],
    ),
    const RuleInformationUIModel(
      title: 'Bảo mật',
      contents: [
        RuleInformationRowUIModel(
          style: RuleInformationRowLeadingStyle.none,
          content: TextSpan(
            text:
                'Tất cả giấy tờ, tài liệu, thông tin trao đổi giữa Bên A với Bên B và các thông tin, tài liệu của Bên A mà Bên B biết được trong quá trình thực hiện công việc được xem là thuộc quyền sở hữu của Bên A. Bên B có trách nhiệm giữ bí mật các giấy tờ, tài liệu, thông tin đó và chỉ được tiết lộ cho người khác nếu được sự đồng ý trước bằng văn bản của Bên A. Bên B chỉ được sử dụng các thông tin, tài liệu do Bên A cung cấp để thực hiện công việc theo quy định tại Hợp Đồng JA này. Nếu Bên B tiết lộ thông tin, tài liệu và/hoặc sử dụng vào mục đích khác và/hoặc có hành vi khác gây ảnh hưởng đến Bên A thì Bên B bị phạt số tiền là 100.000.000 đồng/lần vi phạm, đồng thời bồi thường toàn bộ thiệt hại cho Bên A. Nếu Bên B vi phạm pháp luật thì Bên B còn phải chịu trách nhiệm theo quy định của pháp luật. Trách nhiệm bảo mật thông tin được áp dụng ngay cả khi Hợp Đồng JA này chấm dứt.',
            style: defaultTextStyle,
          ),
        ),
      ],
    ),
    const RuleInformationUIModel(
      title: 'Chấm dứt Hợp Đồng JA ',
      description: '    Hợp Đồng này chấm dứt khi hiệu lực trong các trường hợp sau:',
      contents: [
        RuleInformationRowUIModel(
          style: RuleInformationRowLeadingStyle.number,
          content: TextSpan(
            text: 'Hết thời hạn của Hợp Đồng;',
            style: defaultTextStyle,
          ),
        ),
        RuleInformationRowUIModel(
          style: RuleInformationRowLeadingStyle.number,
          content: TextSpan(
            text: 'Hai bên thỏa thuận chấm dứt; ',
            style: defaultTextStyle,
          ),
        ),
        RuleInformationRowUIModel(
          style: RuleInformationRowLeadingStyle.number,
          content: TextSpan(
            text:
                'Bên B vi phạm các quy định tại Hợp Đồng hoặc các quy định của Bên A tại nền tảng VDONE hoặc vi phạm quy định của pháp luật; ',
            style: defaultTextStyle,
          ),
        ),
        RuleInformationRowUIModel(
          style: RuleInformationRowLeadingStyle.number,
          content: TextSpan(
            text: 'Theo chính sách của Bên A tại từng thời điểm. ',
            style: defaultTextStyle,
          ),
        ),
      ],
    ),
    const RuleInformationUIModel(
      title: 'Giải quyết tranh chấp',
      description:
          '    Trường hợp trong thời gian thực hiện Hợp Đồng hai bên có mâu thuẫn hoặc tranh chấp các nội dung liên quan, trên tinh thần thiện chí, hợp tác, hai bên tiến hành thương lượng để giải quyết. Trường hợp thương lượng không thành, hai bên đưa vụ việc ra Tòa án nhân dân có thẩm quyền nơi Bên A có trụ sở chính để giải quyết. ',
      contents: [
        RuleInformationRowUIModel(
          style: RuleInformationRowLeadingStyle.letter,
          content: TextSpan(text: '\n\n\n\n'),
        ),
      ],
    ),
    const RuleInformationUIModel(
      title: 'Hiệu lực',
      contents: [
        RuleInformationRowUIModel(
          style: RuleInformationRowLeadingStyle.none,
          content: TextSpan(
            text:
                'Hợp Đồng JA này có hiệu lực kể từ ngày ký được đề tại phần đầu của Hợp Đồng JA hoặc ghi ấn nút đồng ý trên nền tảng VDONE hoặc được gửi mã OTP về điện thoại do Bên B đăng ký với Bên A. ',
            style: defaultTextStyle,
          ),
        ),
        RuleInformationRowUIModel(
          style: RuleInformationRowLeadingStyle.none,
          content: TextSpan(
            text:
                'Hợp Đồng JA này gồm 05 (năm) trang bằng tiếng Việt, được lập thành 02 (hai) bản và có hiệu lực pháp lý như nhau.',
            style: defaultTextStyle,
          ),
        ),
      ],
    ),
  ];
}
