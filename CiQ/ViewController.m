//
//  ViewController.m
//  CiQ
//
//  Created by 武淅 段 on 2017/4/16.
//  Copyright © 2017年 武淅 段. All rights reserved.
//

#import "ViewController.h"
#import "Model.h"
#import "SetFontViewController.h"

static CGFloat keyboardHeight = 240;

@interface ViewController () <UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic) UIButton *confirmBn;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tableViewheight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *searchBarTop;//265 default
@property (weak, nonatomic) IBOutlet UIImageView *logo;
@property (weak, nonatomic) IBOutlet UIButton *genderBn;
@property (nonatomic) NSArray *results;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _results = [Model names].allValues;
    _searchBar.barTintColor = THEME_COLOR;
    _searchBar.tintColor = [UIColor whiteColor];
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    _confirmBn.frame = CGRectMake(0, 0, _tableView.frame.size.width, 44);
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _results.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    NSString *name = _results[indexPath.row];
    cell.textLabel.text = name;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [_tableView deselectRowAtIndexPath:indexPath animated:YES];
    [_searchBar resignFirstResponder];
    
    NSString *text = _results[indexPath.row];
    SetFontViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"SetFontViewController"];
    vc.content = text;
    [self.navigationController pushViewController:vc animated:YES];
    
}

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
    
    _searchBarTop.constant = 20;
    _tableViewheight.constant = SCREEN_HEIGHT-20-_searchBar.frame.size.height-10 - keyboardHeight;
    [UIView animateWithDuration:0.3 animations:^{
        self.logo.alpha = 0;
        [self.view layoutIfNeeded];
    }];
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar {
    _searchBarTop.constant = 265;
    _tableViewheight.constant = 0;
    [UIView animateWithDuration:0.3 animations:^{
        self.logo.alpha = 1;
        [self.view layoutIfNeeded];
    }];
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    if (searchText.length) {
        _results = [Model namesForKey:searchText];
    } else {
        _results = [Model names].allValues;
    }
    [self.tableView reloadData];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [searchBar resignFirstResponder];
    
    NSString *text = searchBar.text;
    if (text.length == 0) {
        return;
    }
    SetFontViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"SetFontViewController"];
    vc.content = text;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)handleTapConfirmButton:(UIButton *)sender {
    
}

- (IBAction)tapGenderBn:(UIButton *)sender {
}

@end
