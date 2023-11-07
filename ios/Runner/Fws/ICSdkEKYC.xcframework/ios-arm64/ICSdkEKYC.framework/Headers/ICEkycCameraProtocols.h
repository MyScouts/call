//
//  ICEkycCameraProtocols.h
//  ICSdkEKYC
//
//  Created by MinhMinh on 08/12/2022.
//  Copyright © 2022 iOS Team IC - VNPT IT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


typedef enum : NSUInteger {
    Normal, // chụp ảnh chân dung 1 hướng
    ProOval, // chụp ảnh chân dung xa gần
} VersionSdk;


typedef enum : NSUInteger {
    PositionFront,      /* Máy ảnh phía trước tại bước chụp chân dung */
    PositionBack,       /* Máy ảnh phía sau tại bước chụp chân dung */
} CameraPosition;


typedef enum : NSUInteger {
    IdentityCard, // Chứng minh thư nhân dân, Căn cước công dân
    IDCardChipBased, // Căn cước công dân gắn Chip
    Passport, // Hộ chiếu
    DriverLicense, // Bằng lái xe
    MilitaryIdCard, // Chứng minh thư quân đội
} TypeDocument;


typedef enum : NSUInteger {
    none,       // không thực hiện luồng nào cả
    full,       // thực hiện eKYC đầy đủ các bước: chụp mặt trước, chụp mặt sau và chụp ảnh chân dung
    ocrFront,   // thực hiện OCR giấy tờ một bước: chụp mặt trước
    ocrBack,    // thực hiện OCR giấy tờ một bước: chụp mặt trước
    ocr,        // ocrFrontAndBack => ocr // thực hiện OCR giấy tờ đầy đủ các bước: chụp mặt trước, chụp mặt sau
    face,    // compare => face // thực hiện so sánh khuôn mặt với mã ảnh chân dung được truyền từ bên ngoài
} FlowType;     // Giá trị mặc định là none


typedef enum : NSUInteger {
    stepQRCode,
    stepFront,
    stepBack,
    stepFace,
} ProgessStep;


typedef enum : NSUInteger {
    HelpDocument,// bỏ
    CaptureFront,
    PreviewFront,// bỏ
    CaptureBack,
    PreviewBack,// bỏ
    HelpOval,// bỏ
    AuthenFarFace,
    AuthenNearFace,
    Processing,// bỏ
    Done,
    ScanQR,
    CaptureFaceBasic,
    PreviewFaceBasic,// bỏ
    HelpFaceBasic,// bỏ
} ScreenType;


typedef enum : NSUInteger {
    None, // Không thực hiện kiểm tra ảnh khi chụp ảnh giấy tờ
    Basic, // Kiểm tra sau khi chụp ảnh
    MediumFlip, // Kiểm tra ảnh hợp lệ trước khi chụp (lật giấy tờ thành công → hiển thị nút chụp)
    Advance, // Kiểm tra ảnh hợp lệ trước khi chụp (hiển thị nút chụp)
} TypeValidateDocument;

typedef enum : NSUInteger {
    HelpV1,         /* V1 là giá trị cho bản hướng dẫn mặc định của SDK */
    HelpV2,         /* V1 là giá trị cho bản hướng dẫn nâng cao của SDK */
} ModelHelp;


typedef enum : NSUInteger {
    NoneCheckFace, // Không thực hiện kiểm tra ảnh chân dung chụp trực tiếp hay không
    IBeta, // Kiểm tra ảnh chân dung chụp trực tiếp hay không iBeta (phiên bản hiện tại)
    Standard, // Kiểm tra ảnh chân dung chụp trực tiếp hay không Standard (phiên bản mới)
} ModeCheckLivenessFace;



#pragma mark - WireFrameProtocol

@protocol ICEkycCameraWireframeProtocol <NSObject>

- (void) presentPopupCloseSDK;

@end

#pragma mark - ICEkycCameraPresenterProtocol

@protocol ICEkycCameraPresenterProtocol <NSObject>

@end

#pragma mark - ICEkycCameraInteractorProtocol

@protocol ICEkycCameraInteractorOutputProtocol <NSObject>

/** Interactor -> Presenter */

// 1. trả dữ liệu kết quả tải ảnh MẶT TRƯỚC lên máy chủ
- (void) sendResultUploadSucceedFrontImage:(NSString *)hash;


// 2. trả dữ liệu kết quả tải ảnh MẶT SAU lên máy chủ
- (void) sendResultUploadSucceedBackImage:(NSString *)hash;


// 3. trả dữ liệu kết quả tải ảnh CHÂN DUNG THẲNG lên máy chủ
- (void) sendResultUploadSucceedFaceImage:(NSString *)hash;


// 6. trả dữ liệu kết quả tải ảnh CHÂN DUNG XA lên máy chủ
- (void) sendResultUploadSucceedFarFaceImage:(NSString *)hash;


// 7. trả dữ liệu kết quả tải ảnh CHÂN DUNG GẦN lên máy chủ
- (void) sendResultUploadSucceedNearFaceImage:(NSString *)hash;


// 8. trả dữ liệu kết quả tải dữ liệu QUÉT 3 CHIỀU lên máy chủ
- (void) sendResultUploadSucceedLogDataImage:(NSString *)hash;


// 9. trả dữ liệu kết quả BÓC TÁCH THÔNG TIN MẶT TRƯỚC
- (void) sendResultGetInformationFrontCard:(NSDictionary *)result;


// 10. trả dữ liệu kết quả BÓC TÁCH THÔNG TIN MẶT SAU
- (void) sendResultGetInformationBackCard:(NSDictionary *)result;


// 11. trả dữ liệu kết quả BÓC TÁCH THÔNG TIN GIẤY TỜ
- (void) sendResultGetInformationCard:(NSDictionary *)result;


// 12. trả dữ liệu kết quả KIỂM TRA GIẤY TỜ MẶT TRƯỚC ĐƯỢC CHỤP TRỰC TIẾP HOẶC KHÔNG
- (void) sendResultCheckLivenessFrontCard:(NSDictionary *)result;


// 13. trả dữ liệu kết quả KIỂM TRA GIẤY TỜ MẶT SAU ĐƯỢC CHỤP TRỰC TIẾP HOẶC KHÔNG
- (void) sendResultCheckLivenessBackCard:(NSDictionary *)result;


// 14. trả dữ liệu kết quả SO SÁNH ẢNH CHÂN DUNG (đã có) với ẢNH CHÂN DUNG vừa chụp
- (void) sendResultCompareFrontFace:(NSDictionary *)result;


// 15. trả dữ liệu kết quả SO SÁNH ẢNH CHÂN DUNG đầy đủ (có thể lấy từ ảnh thẻ NFC) với ẢNH CHÂN DUNG vừa chụp (compare-general)
- (void) sendResultCompareFaces:(NSDictionary *)result;


// 16. trả dữ liệu kết quả KIỂM TRA KHUÔN MẶT ĐƯỢC CHỤP TRỰC TIẾP HOẶC KHÔNG
- (void) sendResultCheckLivenessFace:(NSDictionary *)result;


// 17. trả dữ liệu kết quả KIỂM TRA KHUÔN MẶT ĐƯỢC CHỤP TRỰC TIẾP HOẶC KHÔNG (3 CHIỀU)
- (void) sendResultCheckLivenessFace3D:(NSDictionary *)result;


// 18. trả dữ liệu kết quả KIỂM TRA KHUÔN MẶT CÓ BỊ CHE HAY KHÔNG
- (void) sendResultCheckMaskFace:(NSDictionary *)result;


// 19. trả dữ liệu kết quả ĐĂNG KÝ THÔNG TIN CÁ NHÂN
- (void) sendResultAddFace:(NSDictionary *)result;


// 19. trả dữ liệu kết quả ĐĂNG KÝ THÔNG TIN CÁ NHÂN
- (void) sendResultAddCardID:(NSDictionary *)result;


// 20. trả dữ liệu kết quả XÁC THỰC THÔNG TIN CÁ NHÂN
- (void) sendResultVerifyFace:(NSDictionary *)result;


// 21. trả dữ liệu kết quả TÌM KIẾM THÔNG TIN CÁ NHÂN
- (void) sendResultSearchFace:(NSDictionary *)result;




@end

@protocol ICEkycCameraInteractorInputProtocol <NSObject>

- (void)setOutput:(id<ICEkycCameraInteractorOutputProtocol>)output;
- (id<ICEkycCameraInteractorOutputProtocol>)getOutputProtocol;

/** Presenter -> Interactor */


// 1. thực hiện tải ảnh MẶT TRƯỚC (Chụp giấy tờ) lên máy chủ
- (void) handleUploadFrontImage:(UIImage *)image cropedImage:(UIImage *)cropedImage path:(NSURL *)path title:(NSString *)title description:(NSString *)description;


// 2. thực hiện tải ảnh MẶT SAU (Chụp giấy tờ) lên máy chủ
- (void) handleUploadBackImage:(UIImage *)image cropedImage:(UIImage *)cropedImage path:(NSURL *)path title:(NSString *)title description:(NSString *)description;


// 3. thực hiện tải ảnh CHÂN DUNG THẲNG (Chụp chân dung 1 hướng hoặc xoay mặt) lên máy chủ
- (void) handleUploadFaceImage:(UIImage *)image cropedImage:(UIImage *)cropedImage path:(NSURL *)path title:(NSString *)title description:(NSString *)description;


// 6. thực hiện tải ảnh CHÂN DUNG XA (Chụp chân dung Oval) lên máy chủ
- (void) handleUploadFarFaceImage:(UIImage *)image cropedImage:(UIImage *)cropedImage path:(NSURL *)path title:(NSString *)title description:(NSString *)description;


// 7. thực hiện tải ảnh CHÂN DUNG GẦN (Chụp chân dung Oval) lên máy chủ
- (void) handleUploadNearFaceImage:(UIImage *)image cropedImage:(UIImage *)cropedImage path:(NSURL *)path title:(NSString *)title description:(NSString *)description;


// 8. thực hiện tải dữ liệu QUÉT 3 CHIỀU (Chụp chân dung Oval) lên máy chủ
- (void) handleUploadLogData:(NSData *)logData path:(NSURL *)path title:(NSString *)title description:(NSString *)description;


// 9. thực hiện BÓC TÁCH THÔNG TIN GIẤY TỜ MẶT TRƯỚC (Chụp giấy tờ)
- (void) handleGetInfoFrontCard:(NSString *)front cropParam:(NSString *)cropParam type:(NSString *)type validate:(BOOL)validate;


// 10. thực hiện BÓC TÁCH THÔNG TIN GIẤY TỜ MẶT SAU (Chụp giấy tờ)
- (void) handleGetInfoBackCard:(NSString *)back cropParam:(NSString *)cropParam type:(NSString *)type validate:(BOOL)validate;


// 11. thực hiện BÓC TÁCH THÔNG TIN GIẤY TỜ MẶT TRƯỚC VÀ MẶT SAU (Chụp giấy tờ)
- (void) handleGetInformationCard:(NSString *)front back:(NSString *)back cropParam:(NSString *)cropParam type:(NSString *)type validate:(BOOL)validate;


// 12. thực hiện KIỂM TRA GIẤY TỜ MẶT TRƯỚC ĐƯỢC CHỤP TRỰC TIẾP HOẶC KHÔNG
- (void) handleCheckLivenessFrontCard:(NSString *)card cropParam:(NSString *)cropParam;


// 13. thực hiện KIỂM TRA GIẤY TỜ MẶT SAU ĐƯỢC CHỤP TRỰC TIẾP HOẶC KHÔNG
- (void) handleCheckLivenessBackCard:(NSString *)card cropParam:(NSString *)cropParam;


// 14. thực hiện SO SÁNH ẢNH CHÂN DUNG ở GIẤY TỜ MẶT TRƯỚC với ẢNH CHÂN DUNG vừa chụp
- (void) handleCompareImageCard:(NSString *)front face:(NSString *)face;


// 15. thực hiện SO SÁNH ẢNH CHÂN DUNG đầy đủ (có thể lấy từ ảnh thẻ NFC) với ẢNH CHÂN DUNG vừa chụp (compare-general)
- (void) handleCompareFaceOne:(NSString *)faceOne faceTwo:(NSString *)faceTwo thresLevel:(NSString *)thresLevel;


// 16. thực hiện KIỂM TRA KHUÔN MẶT ĐƯỢC CHỤP TRỰC TIẾP HOẶC KHÔNG
- (void) handleCheckLivenessFace:(NSString *)face modeLiveness:(ModeCheckLivenessFace)modeLiveness;


// 17. thực hiện KIỂM TRA KHUÔN MẶT ĐƯỢC CHỤP TRỰC TIẾP HOẶC KHÔNG KIỂU 3 CHIỀU
- (void) handleCheckLiveness3DScanImageNear:(NSString *)imageNear imageFar:(NSString *)imageFar logData:(NSString *)logData modeLiveness:(ModeCheckLivenessFace)modeLiveness;


// 18. thực hiện KIỂM TRA KHUÔN MẶT CÓ BỊ CHE HAY KHÔNG
- (void) handleCheckMaskFace:(NSString *)face;


// 19. thực hiện ĐĂNG KÝ THÔNG TIN CÁ NHÂN
- (void) handleAddFaceWithInformation:(NSDictionary *)information;


// 19. thực hiện ĐĂNG KÝ THÔNG TIN CÁ NHÂN
- (void) handleAddCardIDWithInformation:(NSDictionary *)information;


// 20. thực hiện XÁC THỰC THÔNG TIN CÁ NHÂN
- (void) handleVerifyFace:(NSString *)face idCard:(NSString *)idCard type:(NSString *)type unit:(NSString *)unit;


// 21. thực hiện TÌM KIẾM THÔNG TIN CÁ NHÂN
- (void) handleSearchFace:(NSString *)face threshold:(NSInteger )threshold maxResult:(NSInteger )maxResult unit:(NSString *)unit uuidUnit:(NSString *)uuidUnit;


/* THỰC HIỆN CÀI ĐẶT & LƯU DỮ LIỆU */

// thực hiện CÀI ĐẶT LẠI thông tin ICEKYCSavedData
- (void) handleResetICEKYCSavedData;


// thực hiện LƯU thông tin Client Session
- (void) handleSaveClientSession:(NSString *)clientSession;


// thực hiện CÀI ĐẶT CÁC THÔNG TIN ẢNH cho ICEKYCSavedData sau khi chụp ảnh
- (void) handleSaveQRCode:(NSString *)qrCode image:(UIImage *)image cropedImage:(UIImage *)cropedImage path:(NSURL *)path;


// thực hiện CÀI ĐẶT CÁC THÔNG TIN ẢNH cho ICEKYCSavedData sau khi chụp ảnh
- (void) handleSaveFrontImage:(UIImage *)image cropedImage:(UIImage *)cropedImage path:(NSURL *)path;


// thực hiện CÀI ĐẶT CÁC THÔNG TIN ẢNH cho ICEKYCSavedData sau khi chụp ảnh
- (void) handleSaveBackImage:(UIImage *)image cropedImage:(UIImage *)cropedImage path:(NSURL *)path;


// thực hiện CÀI ĐẶT CÁC THÔNG TIN ẢNH cho ICEKYCSavedData sau khi chụp ảnh
- (void) handleSaveStraightFaceImage:(UIImage *)image cropedImage:(UIImage *)cropedImage path:(NSURL *)path;


// thực hiện CÀI ĐẶT CÁC THÔNG TIN ẢNH cho ICEKYCSavedData sau khi chụp ảnh
- (void) handleSaveFarImage:(UIImage *)farImage cropedFar:(UIImage *)cropedFar nearImage:(UIImage *)nearImage cropedNear:(UIImage *)cropedNear path:(NSURL *)path;




@end

#pragma mark - ICEkycCameraViewProtocol

@protocol ICEkycCameraViewProtocol <NSObject>

/** Presenter -> ViewController */


// 1. trả dữ liệu kết quả tải ảnh MẶT TRƯỚC lên máy chủ
- (void) showResultUploadSucceedFrontImage:(NSString *)hash;


// 2. trả dữ liệu kết quả tải ảnh MẶT SAU lên máy chủ
- (void) showResultUploadSucceedBackImage:(NSString *)hash;


// 3. trả dữ liệu kết quả tải ảnh CHÂN DUNG THẲNG lên máy chủ
- (void) showResultUploadSucceedFaceImage:(NSString *)hash;


// 6. trả dữ liệu kết quả tải ảnh CHÂN DUNG XA lên máy chủ
- (void) showResultUploadSucceedFarFaceImage:(NSString *)hash;


// 7. trả dữ liệu kết quả tải ảnh CHÂN DUNG GẦN lên máy chủ
- (void) showResultUploadSucceedNearFaceImage:(NSString *)hash;


// 8. trả dữ liệu kết quả tải dữ liệu QUÉT 3 CHIỀU lên máy chủ
- (void) showResultUploadSucceedLogDataImage:(NSString *)hash;


// 9. trả dữ liệu kết quả BÓC TÁCH THÔNG TIN MẶT TRƯỚC
- (void) showResultGetInformationFrontCard:(NSDictionary *)result;


// 10. trả dữ liệu kết quả BÓC TÁCH THÔNG TIN MẶT SAU
- (void) showResultGetInformationBackCard:(NSDictionary *)result;


// 11. trả dữ liệu kết quả BÓC TÁCH THÔNG TIN GIẤY TỜ
- (void) showResultGetInformationCard:(NSDictionary *)result;


// 12. trả dữ liệu kết quả KIỂM TRA GIẤY TỜ MẶT TRƯỚC ĐƯỢC CHỤP TRỰC TIẾP HOẶC KHÔNG
- (void) showResultCheckLivenessFrontCard:(NSDictionary *)result;


// 13. trả dữ liệu kết quả KIỂM TRA GIẤY TỜ MẶT SAU ĐƯỢC CHỤP TRỰC TIẾP HOẶC KHÔNG
- (void) showResultCheckLivenessBackCard:(NSDictionary *)result;


// 14. trả dữ liệu kết quả SO SÁNH ẢNH CHÂN DUNG (đã có) với ẢNH CHÂN DUNG vừa chụp
- (void) showResultCompareFrontFace:(NSDictionary *)result;


// 15. trả dữ liệu kết quả SO SÁNH ẢNH CHÂN DUNG đầy đủ (có thể lấy từ ảnh thẻ NFC) với ẢNH CHÂN DUNG vừa chụp (compare-general)
- (void) showResultCompareFaces:(NSDictionary *)result;


// 16. trả dữ liệu kết quả KIỂM TRA KHUÔN MẶT ĐƯỢC CHỤP TRỰC TIẾP HOẶC KHÔNG
- (void) showResultCheckLivenessFace:(NSDictionary *)result;


// 17. trả dữ liệu kết quả KIỂM TRA KHUÔN MẶT ĐƯỢC CHỤP TRỰC TIẾP HOẶC KHÔNG (3 CHIỀU)
- (void) showResultCheckLivenessFace3D:(NSDictionary *)result;


// 18. trả dữ liệu kết quả KIỂM TRA KHUÔN MẶT CÓ BỊ CHE HAY KHÔNG
- (void) showResultCheckMaskFace:(NSDictionary *)result;


// 19. trả dữ liệu kết quả ĐĂNG KÝ THÔNG TIN CÁ NHÂN
- (void) showResultAddFace:(NSDictionary *)result;


// 19. trả dữ liệu kết quả ĐĂNG KÝ THÔNG TIN CÁ NHÂN
- (void) showResultAddCardID:(NSDictionary *)result;


// 20. trả dữ liệu kết quả XÁC THỰC THÔNG TIN CÁ NHÂN
- (void) showResultVerifyFace:(NSDictionary *)result;


// 21. trả dữ liệu kết quả TÌM KIẾM THÔNG TIN CÁ NHÂN
- (void) showResultSearchFace:(NSDictionary *)result;

@end
