//
//  MainViewController.m
//  CiQ
//
//  Created by 武淅 段 on 2017/4/26.
//  Copyright © 2017年 武淅 段. All rights reserved.
//

#import "MainViewController.h"
#import "SearchViewController.h"

@interface MainViewController ()

@property (nonatomic) UIImageView *bgView;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.navigationController setNavigationBarHidden:YES];
    
    
}


- (IBAction)tapSetNameButton:(id)sender {
    
    SearchViewController *searchController = [self.storyboard instantiateViewControllerWithIdentifier:@"SearchViewController"];
    [self.navigationController pushViewController:searchController animated:YES];
}


- (IBAction)tapSetWordButton:(id)sender {
    
    SearchViewController *searchController = [self.storyboard instantiateViewControllerWithIdentifier:@"SearchViewController"]; 
    [self.navigationController pushViewController:searchController animated:YES];
}


@end
