//
//  SetFontViewController.m
//  CiQ
//
//  Created by 武淅 段 on 2017/4/16.
//  Copyright © 2017年 武淅 段. All rights reserved.
//

#import "SetFontViewController.h"
#import "MakeViewController.h"

@interface SetFontViewController ()<UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@end

@implementation SetFontViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setTitle:@"Set Font"];
    self.contentLabel.text = _content;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO];
}

- (IBAction)handleTapSetFont:(id)sender {
    NSMutableArray *fonts = [NSMutableArray new];
    for(NSString *fa in [UIFont familyNames]) {
        NSArray *names = [UIFont fontNamesForFamilyName:fa];
        for (NSString *name in names) {
            NSAttributedString *att = [[NSAttributedString alloc] initWithString:name attributes:@{NSFontAttributeName:[UIFont fontWithName:name size:17]}];
            [fonts addObject:att];
        }
    }
    [fonts sortUsingComparator:^NSComparisonResult(NSAttributedString * _Nonnull obj1, NSAttributedString * _Nonnull obj2) {
        return [obj1.string compare:obj2.string];
    }];
    CustomActionSheetView *sheet = [[CustomActionSheetView alloc] initWithTitle:@"Select A Font" items:fonts.copy];
    sheet.handler = ^(NSInteger itemIndex) {
        NSString *name  =  ((NSAttributedString *)fonts[itemIndex]).string;
        UIFont *font = [UIFont fontWithName:name size:30];
        self.contentLabel.font = font;
    };
    [sheet show];
}

- (IBAction)handleTapBegin:(id)sender {
    
    CustomActionSheetView *sheet = [[CustomActionSheetView alloc] initWithTitle:@"Please select a photo" items:@[@"Use Camera", @"View On Photo Library"]];
    sheet.handler = ^(NSInteger itemIndex) {
        UIImagePickerController *vc = [[UIImagePickerController alloc] init];
        if (itemIndex == 0) {
            vc.sourceType = UIImagePickerControllerSourceTypeCamera;
        } else {
            vc.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        }
        vc.delegate = self;
        dispatch_async(dispatch_get_main_queue(), ^{
            [self presentViewController:vc animated:YES completion:^{
                
            }];
    
        });
    };
    [sheet show];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    [picker dismissViewControllerAnimated:YES completion:^{
        UIImage *img = info[UIImagePickerControllerOriginalImage];
        NSAttributedString *text = _contentLabel.attributedText;
        MakeViewController *vc = [[MakeViewController alloc] init];
        vc.img = img;
        vc.text = text;
        [self.navigationController pushViewController:vc animated:YES];
    }];
}
@end
