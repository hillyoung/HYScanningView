//
//  EncodeViewController.m
//  HYScanningView
//
//  Created by yanghaha on 15/12/14.
//  Copyright © 2015年 yanghaha. All rights reserved.
//

#import "EncodeViewController.h"
#import "UIImage+HYQRCode.h"

@interface EncodeViewController () <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (weak, nonatomic) IBOutlet UITextField *contentTextField;
@property (weak, nonatomic) IBOutlet UIImageView *qrcodeImageView;



@end

@implementation EncodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)touchEncodeButton:(id)sender {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        UIImage *image = [UIImage qrImageFromString:self.contentTextField.text sideLength:100];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.qrcodeImageView.image = image;
        });
    });
}

- (IBAction)touchDecodeButton:(id)sender {
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.delegate = self;
    [self presentViewController:imagePicker animated:YES completion:nil];
}

- (IBAction)touchTestButton:(id)sender {
    UIViewController *viewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"ViewController"];
    [self.navigationController pushViewController:viewController animated:YES];
}


#pragma mark - UINavigationControllerDelegate, UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSString *content = [UIImage stringFromImage:info[UIImagePickerControllerOriginalImage]];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.contentTextField.text = content;
            [picker dismissViewControllerAnimated:YES completion:nil];
        });
    });
}

- (IBAction)tapCloseGestureRecognize:(UITapGestureRecognizer *)sender {
    [self.view endEditing:YES];
}


@end
