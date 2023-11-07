//
//  ICEkycCameraViewController.h
//  ICSdkEKYC
//
//  Created by MinhMinh on 08/12/2022.
//  Copyright © 2022 iOS Team IC - VNPT IT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ICEkycCameraProtocols.h"
#import "ICEkycCameraPresenter.h"
#import "ICEkycBaseViewController.h"


NS_ASSUME_NONNULL_BEGIN


@protocol ICEkycCameraDelegate <NSObject>

@required
// Phương thức delegate SDK trả dữ liệu ra phía ngoài ứng dụng
- (void) icEkycGetResult;

@optional
// Phương thức delegate khi SDK đóng do người dùng hoặc khi thực hiện xong eKYC
- (void) icEkycCameraClosedWithType:(ScreenType)type;

@end


@interface ICEkycCameraViewController : ICEkycBaseViewController<ICEkycCameraViewProtocol>

@property (nonatomic) ICEkycCameraPresenter *presenter;


// THUỘC TÍNH CẦN THIẾT ĐỂ ỨNG DỤNG CÓ THỂ NHẬN DỮ LIỆU SAU KHI THỰC HIỆN EKYC
@property (weak, nonatomic) id<ICEkycCameraDelegate> cameraDelegate;


/*========== CÁC THUỘC TÍNH CƠ BẢN CÀI ĐẶT CHUNG SDK ==========*/

// Giá trị này xác định phiên bản khi sử dụng Máy ảnh tại bước chụp ảnh chân dung luồng full. Mặc định là Normal
// - Normal: chụp ảnh chân dung 1 hướng
// - ProOval: chụp ảnh chân dung xa gần
@property (nonatomic) VersionSdk versionSdk;

// Giá trị này xác định kiểu giấy tờ để sử dụng. Mặc định là IdentityCard (Chứng minh nhân dân)
// - IdentityCard: Chứng minh thư nhân dân, Căn cước công dân
// - IDCardChipBased: Căn cước công dân gắn Chip
// - Passport: Hộ chiếu
// - DriverLicense: Bằng lái xe
// - MilitaryIdCard: Chứng minh thư quân đội
@property (nonatomic) TypeDocument documentType;

// Giá trị xác định luồng thực hiện eKYC. Mặc định là none, sử dụng khi gọi các phương thức trong SDK
// - none: không thực hiện luồng nào cả
// - full: thực hiện eKYC đầy đủ các bước: chụp mặt trước, chụp mặt sau và chụp ảnh chân dung
// - ocrFront: thực hiện OCR giấy tờ một bước: chụp mặt trước
// - ocrBack: thực hiện OCR giấy tờ một bước: chụp mặt trước
// - ocr: thực hiện OCR giấy tờ đầy đủ các bước: chụp mặt trước, chụp mặt sau
// - face: thực hiện so sánh khuôn mặt với mã ảnh chân dung được truyền từ bên ngoài
@property (nonatomic) FlowType flowType;

// Giá trị này xác định ngôn ngữ được sử dụng trong SDK. Mặc định là icekyc_vi
// - icekyc_vi: Tiếng Việt
// - icekyc_en: Tiếng Anh
@property (nonatomic) NSString *languageSdk;

// Giá trị này dùng để đảm bảo mỗi yêu cầu (request) từ phía khách hàng sẽ không bị thay đổi.
// Sau mỗi request, dữ liệu trả về sẽ bao gồm giá trị challengeCode. Mặc định là "11111"
@property (nonatomic) NSString *challengeCode;

// Giá trị này được truyền vào để xác định nhiều luồng giao dịch trong cùng một phiên. Mặc định ""
// Trường hợp ClientSession rỗng, SDK sẽ tạo mới ClientSession
@property (nonatomic) NSString *inputClientSession;

// Bật chức năng so sánh ảnh chân dung với ảnh chân dung hoặc ảnh giấy tờ chứa chân dung. Mặc định false
@property (nonatomic) BOOL isEnableCompare;

// Giá trị mã ảnh (ảnh chân dung hoặc ảnh giấy tờ chứa chân dung) được truyền vào để thực hiện so sánh khuôn mặt. Mặc định ""
@property (nonatomic) NSString *hashImageCompare;

// Bật chức năng so sánh ảnh chụp chân dung với ảnh chân dung (dạng ảnh thẻ hoặc ảnh khuôn mặt). Mặc định false
// SDK sẽ thực hiện chức năng này khi đã bật chức năng so sánh (isEnableCompare = YES)
@property (nonatomic) BOOL isCompareFaces;

// Giá trị quy định ngưỡng so sánh ảnh chụp chân dung với ảnh chân dung (dạng ảnh thẻ hoặc ảnh khuôn mặt). Mặc định "normal"
// Thuộc tính này được sử dụng khi đã bật chức năng so sánh "ảnh chụp chân dung" với "ảnh chân dung" (isEnableCompare = YES) và (isCompareFaces = YES)
@property (nonatomic) NSString *thresLevel;

// Giá trị này xác định việc có hiển thị màn hình trợ giúp hay không. Mặc định là false
@property (nonatomic) BOOL isShowTutorial;

// Giá trị xác định việc sử dụng màn hình hướng dẫn "chụp ảnh giấy tờ" dạng mặc định hoặc chỉnh sửa nâng cao. Mặc định là HelpV1
// - HelpV1: V1 là giá trị cho bản hướng dẫn mặc định của SDK
// - HelpV2: V1 là giá trị cho bản hướng dẫn nâng cao của SDK
@property (nonatomic) ModelHelp modelHelpCard;

// Giá trị xác định việc sử dụng màn hình hướng dẫn "chụp ảnh khuôn mặt" dạng mặc định hoặc chỉnh sửa nâng cao. Mặc định là HelpV1
// - HelpV1: V1 là giá trị cho bản hướng dẫn mặc định của SDK
// - HelpV2: V1 là giá trị cho bản hướng dẫn nâng cao của SDK
@property (nonatomic) ModelHelp modelHelpFace;

// Giá trị này xác định việc hiển thị nút bấm chức năng xoay máy ảnh trước sang máy ảnh sau ở phiên bản chụp chân dung cơ bản. Mặc định false
@property (nonatomic) BOOL isShowSwitchCamera;

// Giá trị này xác định việc sử dụng máy ảnh phía trước hoặc phía sau khi chụp ảnh mặt người. Mặc định PositionFront
// - PositionFront: Máy ảnh phía trước tại bước chụp chân dung
// - PositionBack: Máy ảnh phía sau tại bước chụp chân dung
@property (nonatomic) CameraPosition cameraPositionForPortrait;

// Giá trị này xác định việc có xác thực số ID với mã tỉnh thành, quận huyện, xã phường tương ứng hay không. Kiểm tra quy tắc của số ID. Mặc định là false
@property (nonatomic) BOOL isValidatePostcode;

// Giá trị xác định cơ chế kiểm tra ảnh chụp chân dung
// - NoneCheckFace: Không thực hiện kiểm tra ảnh chân dung chụp trực tiếp hay không
// - IBeta: Kiểm tra ảnh chân dung chụp trực tiếp hay không iBeta (phiên bản hiện tại)
// - Standard: Kiểm tra ảnh chân dung chụp trực tiếp hay không Standard (phiên bản mới)
@property (nonatomic) ModeCheckLivenessFace checkLivenessFace;

// Bật chức năng kiểm tra "ảnh giấy tờ" chụp trực tiếp hay không. Mặc định false
@property (nonatomic) BOOL isCheckLivenessCard;

// Bật chức năng kiểm tra "ảnh chân dung" có bị che mặt hay không. Mặc định false
@property (nonatomic) BOOL isCheckMaskedFace;

// Bật chức năng "WaterMark", áp dụng đối với luồng v2. Mặc định false
@property (nonatomic) BOOL isEnableWaterMark;

// Bật chức năng quét mã QR. Hiển thị màn hình quét mã trước màn hình chụp giấy tờ mặt trước. Mặc định false
@property (nonatomic) BOOL isEnableScanQRCode;

// Giá trị này xác định thời gian hết hạn quét mã QR, hết thời gian, SDK sẽ cảnh báo để thử lại hoặc bỏ qua. Mặc định là 30 (đơn vị giây)
@property (nonatomic) NSInteger timeOutScanQRCode;

// Bật chức năng hiển thị nút bấm "Bỏ qua hướng dẫn" tại các màn hình hướng dẫn bằng video. Mặc định false
@property (nonatomic) BOOL isEnableGotIt;

// Giá trị quy định mức kiểm tra giấy tờ ở SDK, sử dụng Model AI Offline
// - None: Không thực hiện kiểm tra ảnh khi chụp ảnh giấy tờ
// - Basic: Kiểm tra sau khi chụp ảnh
// - MediumFlip: Kiểm tra ảnh hợp lệ trước khi chụp (lật giấy tờ thành công → hiển thị nút chụp)
// - Advance: Kiểm tra ảnh hợp lệ trước khi chụp (hiển thị nút chụp)
@property (nonatomic) TypeValidateDocument validateDocumentType;

// Giá trị quy định thời gian để đóng SDK khi thực hiện eKYC không thành công. Mặc định 60 giây
@property (nonatomic) NSInteger expiresTime;

// Tắt chức năng gửi yêu cầu (call API) thực hiện eKYC. Mặc định false
@property (nonatomic) BOOL isTurnOffCallService;

// Giá trị quy định các bước của từng luồng eKYC trong cùng 1 phiên. Mặc định 0
@property (nonatomic) NSInteger stepId;



/*========== CÁC THUỘC TÍNH VỀ VIỆC QUAY VIDEO LẠI QUÁ TRÌNH THỰC HIỆN OCR VÀ FACE TRONG SDK ==========*/

// Bật chức năng quay lại video thao tác chụp ảnh chân dung Oval. Mặc định false
@property (nonatomic) BOOL isRecordVideoFace;

// Giá trị quy định thời gian tối đa thực hiện quay lại video thao tác chụp ảnh chân dung Oval. Mặc định 60 giây
@property (nonatomic) NSInteger timeoutRecordVideoFace;

// Bật chức năng quay lại video thao tác chụp ảnh giấy tờ. Mặc định false
@property (nonatomic) BOOL isRecordVideoDocument;

// Giá trị quy định thời gian tối đa thực hiện quay lại video thao tác chụp ảnh giấy tờ. Mặc định 60 giây
@property (nonatomic) NSInteger timeoutRecordVideoDocument;

// Thuộc tính chiều rộng của video. Mặc định là
@property (nonatomic) int videoRecordWidth;

// Thuộc tính chiều cao của video. Mặc định là
@property (nonatomic) int videoRecordHeight;

// Thuộc tính xác định giá trị số khung hình trên giây. Mặc định là 24
@property (nonatomic) int videoRecordFPS;

// Thuộc tính xác định việc giảm kích thước video. Mặc định là 0.6
@property (nonatomic) float videoScale;



/*========== CÁC THUỘC TÍNH VỀ MÔI TRƯỜNG PHÁT TRIỂN - URL TÁC VỤ TRONG SDK ==========*/

// Giá trị tên miền chính của SDK. Mặc định ""
@property (nonatomic) NSString *baseUrl;

// Đường dẫn đầy đủ thực hiện tải ảnh lên phía máy chủ để nhận mã ảnh. Mặc định ""
@property (nonatomic) NSString *urlUploadImage;

// Đường dẫn đầy đủ thực hiện bóc tách thông tin giấy tờ. Mặc định ""
@property (nonatomic) NSString *urlOcr;

// Đường dẫn đầy đủ thực hiện bóc tách thông tin mặt trước giấy tờ. Mặc định ""
@property (nonatomic) NSString *urlOcrFront;

// Đường dẫn đầy đủ thực hiện bóc tách thông tin mặt sau giấy tờ. Mặc định ""
@property (nonatomic) NSString *urlOcrBack;

// Đường dẫn đầy đủ thực hiện so sánh ảnh chụp khuôn mặt và ảnh giấy tờ chứa ảnh đại diện. Mặc định ""
@property (nonatomic) NSString *urlCompare;

// Đường dẫn đầy đủ thực hiện so sánh ảnh chụp khuôn mặt và ảnh chân dung (dạng ảnh thẻ hoặc ảnh khuôn mặt). Mặc định ""
@property (nonatomic) NSString *urlCompareGeneral;

// Đường dẫn đầy đủ thực hiện xác thực khuôn mặt và số giấy tờ. Mặc định ""
@property (nonatomic) NSString *urlVerifyFace;

// Đường dẫn đầy đủ thực hiện đăng ký thông tin khuôn mặt. Mặc định ""
@property (nonatomic) NSString *urlAddFace;

// Đường dẫn đầy đủ thực hiện đăng ký thông tin định danh thẻ. Mặc định ""
@property (nonatomic) NSString *urlAddCardId;

// Đường dẫn đầy đủ thực hiện kiểm tra ảnh giấy tờ chụp trực tiếp. Mặc định ""
@property (nonatomic) NSString *urlCheckLivenessCard;

// Đường dẫn đầy đủ thực hiện kiểm tra ảnh chụp khuôn mặt có bị che hay không. Mặc định ""
@property (nonatomic) NSString *urlCheckMaskFace;

// Đường dẫn đầy đủ thực hiện tìm kiếm khuôn mặt. Mặc định ""
@property (nonatomic) NSString *urlSearchFace;

// Đường dẫn đầy đủ thực hiện kiểm tra ảnh chân dung chụp trực tiếp (phiên bản chụp ảnh chân dung Cơ bản). Mặc định ""
@property (nonatomic) NSString *urlLivenessFace;

// Đường dẫn đầy đủ thực hiện kiểm tra ảnh chân dung chụp trực tiếp (phiên bản chụp ảnh chân dung Nâng cao Oval). Mặc định ""
@property (nonatomic) NSString *urlLivenessFace3D;

// Thông tin KEY truyền vào Header. Mặc định ""
@property (nonatomic) NSString *keyHeaderRequest;

// Thông tin VALUE truyền vào Header. Mặc định ""
@property (nonatomic) NSString *valueHeaderRequest;



/*========== CHỈNH SỬA TÊN CÁC TỆP TIN HIỆU ỨNG - VIDEO HƯỚNG DẪN ==========*/

// Tên hiệu ứng xoay quanh khung Oval ở màn hình chụp chân dung. Mặc định ""
@property (nonatomic) NSString *nameOvalAnimation;

// Tên hiệu ứng nhấp nháy cảnh báo trạng thái xác định ảnh ở màn hình chụp chân dung. Mặc định ""
@property (nonatomic) NSString *nameFeedbackAnimation;

// Tên hiệu ứng quét lên xuống ở màn hình quét mã QR. Mặc định ""
@property (nonatomic) NSString *nameScanQRCodeAnimation;

// Tên hiệu ứng xoay quanh khung viền ở màn hình hiển thị giấy tờ đã chụp. Mặc định ""
@property (nonatomic) NSString *namePreviewDocumentAnimation;

// Tên hiệu ứng nhấp nháy tròn ở màn hình Xử lý dũ liệu. Mặc định ""
@property (nonatomic) NSString *nameLoadSuccessAnimation;

// Tên video hướng dẫn chụp ảnh khuôn mặt Oval. Mặc định ""
@property (nonatomic) NSString *nameHelpVideoFace;

// Tên video hướng dẫn chụp ảnh giấy tờ. Sử dụng với bản hướng dẫn nâng cao của SDK. Mặc định ""
@property (nonatomic) NSString *nameHelpVideoDocument;



/*========== CÁC THUỘC TÍNH VỀ CÀI ĐẶT MÀU SẮC GIAO DIỆN TRONG SDK ==========*/

// Thanh header: PA 1 nút đóng bên phải. PA 2 nút đóng bên trái. mặc định là 1
@property (nonatomic) NSInteger styleHeader;

// Họa tiết dưới nền mặc định có hiện
@property (nonatomic) BOOL isUsingUnderBackground;

// màu nội dung Thanh header: Màu chữ và màu nút đóng. mặc định là FFFFFF
@property (nonatomic) UIColor *colorContentHeader;

// màu nen Thanh header. mặc định là trong suốt
@property (nonatomic) UIColor *colorBackgroundHeader;

// Màu văn bản chính - Tiêu đề & Văn bản phụ. mặc định là FFFFFF
@property (nonatomic) UIColor *colorContentMain;

// Màu nền: dùng cho màn help + preview
@property (nonatomic) UIColor *colorBackgroundMain;

// Đường line trên hướng dẫn chụp GTTT. mặc định D9D9D9
@property (nonatomic) UIColor *colorLine;

// Button và Thanh hướng dẫn khi đưa mặt vào khung oval. mặc định 18D696. hiện đang thừa (Thanh hướng dẫn khi đưa mặt vào khung oval)
@property (nonatomic) UIColor *colorBackgroundButton;

//Màu text cho button và thanh hướng dẫn khi đưa mặt vào khung oval. mặc định 142730
@property (nonatomic) UIColor *colorEkycTextButton;

// Màu nền chụp. document thì alpha = 0.5. face thì alpha = 1.0. mặc định 142730
@property (nonatomic) UIColor *colorEkycCaptureBackground;

// Màu hiệu ứng hiện đang thiếu (Thanh hướng dẫn khi đưa mặt vào khung oval). mặc định 18D696
@property (nonatomic) UIColor *colorEkycEffect;

// Màu nút chụp ảnh. mặc định là FFFFFF
@property (nonatomic) UIColor *colorEkycButtonCapture;

// Màu đường viền khung chụp mặt Oval. mặc định là FFFFFF
@property (nonatomic) UIColor *colorEkycOval;

// màu Họa tiết dưới nền. mặc định 18D696
@property (nonatomic) UIColor *colorEkycUnderBackgound;

// hiển thị logo
@property (nonatomic) BOOL isShowTrademark;

// Logo mặc định là logo vnpt
@property (nonatomic) UIImage *imageTrademark;

// Kích thước logo mặc định 38x12
@property (nonatomic) CGSize sizeImageTrademark;

// Màu nền cho pop up mặc định FFFFFF
@property (nonatomic) UIColor *colorBackgroundPopup;

// Màu văn bản trên popup. mặc định 142730
@property (nonatomic) UIColor *colorEkycTextPopup;



#pragma mark - Các phương thức gọi trực tiếp từ ICEkycCameraViewController

/**
 * Phương thức ĐĂNG KÝ THÔNG TIN KHUÔN MẶT
 * Phương thực được gọi từ phía ngoài ứng dụng.
 * Sử dụng đối tượng của ICEkycCameraViewController để gọi vào thực hiện đăng ký dữ liệu khuôn mặt
 *
 * @param information   Thông tin được dùng để đăng ký dữ liệu khuôn mặt lên phía máy chủ.
 * Dữ liệu sau khi ĐĂNG KÝ THÔNG TIN KHUÔN MẶT được trả về ở phương thức icEkycGetResult
 */
- (void) addFaceWithInformation:(NSDictionary *)information;


/**
 * Phương thức ĐĂNG KÝ THÔNG TIN THẺ
 * Phương thực được gọi từ phía ngoài ứng dụng.
 * Sử dụng đối tượng của ICEkycCameraViewController để gọi vào thực hiện đăng ký dữ liệu thẻ
 *
 * @param information  Thông tin được dùng để đăng ký dữ liệu thẻ lên phía máy chủ.
 * Dữ liệu sau khi ĐĂNG KÝ THÔNG TIN THẺ được trả về ở phương thức icEkycGetResult
 */
- (void) addCardIDWithInformation:(NSDictionary *)information;


/**
 * Phương thức Phương thức TÌM KIẾM KHUÔN MẶT
 * Phương thực được gọi từ phía ngoài ứng dụng.
 * Sử dụng đối tượng của ICEkycCameraViewController để gọi vào thực hiện tìm kiếm khuôn mặt
 *
 * @param hashImage     Mã ảnh chân dung dạng.
 * @param threshold     Ngưỡng tìm kiếm khuôn mặt.
 * @param maxResult     Số lượng kết quả tối đã khi thực hiện tìm kiếm khuôn mặt
 * @param unit          Thông tin đơn vị của khách hàng. Giá trị này đi kèm với thông tin tài khoản.
 * @param uuidUnit      Thông tin mã đơn vị của khách hàng. Giá trị này đi kèm với thông tin tài khoản.
 * Dữ liệu sau khi TÌM KIẾM KHUÔN MẶT được trả về ở phương thức icEkycGetResult
 */
- (void) searchFaceWithImage:(NSString *)hashImage threshold:(NSInteger )threshold maxResult:(NSInteger )maxResult unit:(NSString *)unit uuidUnit:(NSString *)uuidUnit;


/**
 * Phương thức XÁC THỰC KHUÔN MẶT VÀ SỐ GIẤY TỜ
 * Phương thực được gọi từ phía ngoài ứng dụng.
 * Sử dụng đối tượng của ICEkycCameraViewController để gọi vào thực hiện xác thực khuôn mặt
 *
 * @param hashImage     Mã ảnh chân dung dạng.
 * @param idCard        Số giấy tờ.
 * @param typeID        Kiểu giấy tờ. Mặc định CARD_ID. Được quy định:
 * Nếu kiểu giấy tờ là Chứng minh thư hoặc Thẻ căn cước (IdentityCard), typeID có giá trị CARD_ID.
 * Nếu kiểu giấy tờ là Hộ chiếu (Passport), typeID có giá trị PASSPORT_ID.
 * Nếu kiểu giấy tờ là Giấy phép lái xe (DriverLicense), typeID có giá trị DRIVER_LICENSE_ID.
 * Nếu kiểu giấy tờ là Chứng minh thư quân đội (MilitaryIdCard), typeID có giá trị MILITARY_ID.
 * @param unit          Thông tin đơn vị của khách hàng. Giá trị này đi kèm với thông tin tài khoản.
 * Dữ liệu sau khi XÁC THỰC KHUÔN MẶT VÀ SỐ GIẤY TỜ được trả về ở phương thức icEkycGetResult
 */
- (void) verifyFaceWithImage:(NSString *)hashImage idCard:(NSString *)idCard typeID:(NSString *)typeID unit:(NSString *)unit;


@end

NS_ASSUME_NONNULL_END
