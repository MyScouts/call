//
//  ICEkycBaseViewController.h
//  ManmoSearch
//
//  Created by Jessy on 7/6/20.
//  Copyright © 2020 Manmo Company. All rights reserved.
//

#import <UIKit/UIKit.h>


#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)


@interface ICEkycBaseViewController: UIViewController

@property NSBundle* bundleSDK;

- (NSString *)convertObjectToString:(id) object;

- (CGFloat)sizeScaleIpad:(CGFloat)size;

- (CGFloat)sizeScale:(CGFloat)size;

- (CGFloat)heightScale:(CGFloat)height;

- (CGFloat)fontSizeScale:(NSInteger)size;

- (UIColor *)UIColorFromRGB:(int)rgbValue alpha:(CGFloat)alpha;

- (CGFloat)getLabelHeight:(UILabel*)label width:(CGFloat) width;

- (CGFloat)getStatusBarHeight;

- (CGFloat)getBottomPadding;

- (NSString *)setICEkycLocalizedString:(NSString *)key inputLanguage:(NSString*)inputLanguage;

@end
