//
//  SearchViewController.m
//  CiQ
//
//  Created by 武淅 段 on 2017/4/26.
//  Copyright © 2017年 武淅 段. All rights reserved.
//

#import "SearchViewController.h"
#import "SetFontViewController.h"

@interface SearchViewController ()<UISearchBarDelegate>

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;


@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    
    NSString *content = searchBar.text;
    if (content.length) {
        SetFontViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"SetFontViewController"];
        vc.content = content;
        [self.navigationController pushViewController:vc animated:YES];
    }
}

@end
