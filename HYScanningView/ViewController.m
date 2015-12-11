//
//  ViewController.m
//  HYScanningView
//
//  Created by yanghaha on 15/12/11.
//  Copyright © 2015年 yanghaha. All rights reserved.
//

#import "ViewController.h"
#import "HYScanningView.h"

#define UIDeviceLessToVersion(version) [UIDevice currentDevice].systemVersion.floatValue < version? YES:NO

#define UIDeviceGreaterToVersion(version) [UIDevice currentDevice].systemVersion.floatValue > version? YES:NO

@interface ViewController () <HYScanningViewDelegate>

@property (weak, nonatomic) IBOutlet HYScanningView *scanningView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)touchSegmenedControl:(UISegmentedControl *)sender {
    self.scanningView.type = sender.selectedSegmentIndex;
}

- (IBAction)touchScanningButton:(UIButton *)sender {
    [self.scanningView startScanning];
}

#pragma mark - HYScanningViewDelegate

- (void)scanningView:(HYScanningView *)scanningView didFinishScanCode:(NSString *)content {

    if (UIDeviceLessToVersion(8.0)) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"扫描结果" message:content delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [alertView show];
    } else {

        UIAlertAction *cancle = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {

        }];
        UIAlertAction *confirm = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {

        }];

        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"" message:content preferredStyle:UIAlertControllerStyleAlert];
        [alertController addAction:cancle];
        [alertController addAction:confirm];
        [self presentViewController:alertController animated:YES completion:nil];
    }
    
}

@end
