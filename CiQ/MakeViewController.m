//
//  MakeViewController.m
//  CiQ
//
//  Created by 武淅 段 on 2017/4/16.
//  Copyright © 2017年 武淅 段. All rights reserved.
//

#import "MakeViewController.h"

@interface MakeViewController ()

@property (nonatomic) UIImageView *iv;
@property (nonatomic) UILabel *label;
@property (nonatomic) UISlider *slider;
@end

@implementation MakeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _iv = [[UIImageView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-50-64)];
    [_iv setContentMode:UIViewContentModeScaleAspectFit];
    _iv.image = _img;
    [self.view addSubview:_iv];
    
    _label = [[UILabel alloc] initWithFrame:CGRectZero];
    _label.attributedText = _text;
    [_label sizeToFit];
    _label.center = self.view.center;
    [self.view addSubview:_label];
    
    _slider = [[UISlider alloc] initWithFrame:CGRectMake(30, SCREEN_HEIGHT-50, SCREEN_WIDTH-60, 50)];
    [_slider setMinimumValue:1];
    [_slider setMaximumValue:20];
    [_slider setValue:1];
    [self.view addSubview:_slider];
    [_slider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    
    UIBarButtonItem *save = [[UIBarButtonItem alloc] initWithTitle:@"save" style:UIBarButtonItemStylePlain target:self action:@selector(handleTapSave:)];
    UIBarButtonItem *cancel = [[UIBarButtonItem alloc] initWithTitle:@"cancel" style:UIBarButtonItemStylePlain target:self action:@selector(handleTapCancel:)];
    self.navigationItem.leftBarButtonItem = cancel;
    self.navigationItem.rightBarButtonItem = save;
    [self setTitle:@"Start Make"];
    
//    //缩放手势
//    UIPinchGestureRecognizer *pin = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinLabel:)];
//    [self.label addGestureRecognizer:pin];
}


- (void)handleTapSave:(UIBarButtonItem *)sender {
    
    UIImage *img = [self capture];
    UIImageWriteToSavedPhotosAlbum(img, NULL, NULL, NULL);
    [MBProgressHUD showSuccess:@"Save Success" toView:self.view];
}

//获取屏幕截屏方法
- (UIImage *)capture
{
    
    // 创建一个context
    UIGraphicsBeginImageContextWithOptions(self.view.bounds.size, self.view.opaque, 0.0);
    
    //把当前的全部画面导入到栈顶context中并进行渲染
    [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    // 从当前context中创建一个新图片
    UIImage * img = UIGraphicsGetImageFromCurrentImageContext();
    
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    
    return img;
}


- (void)handleTapCancel:(UIBarButtonItem *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:self.view];
    _label.center = location;
}


- (void)pinLabel:(UIPinchGestureRecognizer *)sender {
    if (sender.state == UIGestureRecognizerStateBegan ||
        sender.state == UIGestureRecognizerStateChanged) {
        self.label.transform = CGAffineTransformScale(self.label.transform, sender.scale, sender.scale);
        sender.scale = 1;
    }
}

- (void)sliderValueChanged:(UISlider *)sender {
//    CGFloat scale = sender.value;
//    self.label.transform = CGAffineTransformMakeScale(scale, scale);
    NSAttributedString *text = self.label.attributedText;
    NSDictionary *dic = [text attributesAtIndex:0 effectiveRange:NULL];
    UIFont *font = dic[NSFontAttributeName];
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:text.string attributes:@{NSFontAttributeName:[UIFont fontWithName:font.fontName size:21+sender.value*4],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.label.attributedText = str;
    [self.label sizeToFit];
}

@end
