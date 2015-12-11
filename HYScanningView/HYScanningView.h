//
//  HYScanningView.h
//  QRCodeTest
//
//  Created by yanghaha on 15/12/8.
//  Copyright © 2015年 yanghaha. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HYScanningView;
@protocol HYScanningViewDelegate <NSObject>

- (void)scanningView:(HYScanningView *)scanningView didFinishScanCode:(NSString *)content;

@end

typedef enum : NSUInteger {
    HYScanningViewTypeQR,
    HYScanningViewTypeBar,
    HYScanningViewTypeQRBar,
} HYScanningViewType;

@interface HYScanningView : UIView

@property (nonatomic, weak) IBOutlet id<HYScanningViewDelegate> delegate;
/**
 标志是否正在扫描
 */
@property (nonatomic, getter=isReading) BOOL reading;

/**
 默认是YES，设置是否开启自动扫描，
 */
@property (nonatomic) BOOL autoRead;
/**
 识别框的大小
 */
@property (nonatomic) IBInspectable CGRect boxFrame;
/**
 识别框的边框颜色
 */
@property (nonatomic, strong) IBInspectable UIColor *coverColor;
/**
 扫描线的颜色
 */
@property (nonatomic, strong) IBInspectable UIColor *scanningLineColor;

#if TARGET_INTERFACE_BUILDER
@property (nonatomic) IBInspectable NSUInteger type;
#else
@property (nonatomic) HYScanningViewType type;
#endif

/**
 开始扫描
 */
- (void)startScanning;
/**
 停止扫描
 */
- (void)stopScanning;

@end
