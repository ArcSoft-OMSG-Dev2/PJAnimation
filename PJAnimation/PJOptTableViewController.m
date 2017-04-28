//
//  PJOptTableViewController.m
//  PJAnimation
//
//  Created by Lu Yiwei on 17/3/31.
//  Copyright © 2017年 Smile. All rights reserved.
//

#import "PJOptTableViewController.h"
#import "PJPopFirstViewController.h"
#import "PJZoomFirstViewController.h"

static NSString *optTableViewControllercellIdentifier = @"PJOptTableViewControllerCell";

@interface PJOptTableViewController ()

@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation PJOptTableViewController
#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - 
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    switch (indexPath.row) {
        case 0:
            [self.navigationController pushViewController:[[PJPopFirstViewController alloc] init]
                                                 animated:YES];
            break;
        case 1:
            [self.navigationController pushViewController:[[PJZoomFirstViewController alloc] init]
                                                 animated:YES];
            break;
        default:
            break;
    }
}

#pragma mark - Table view data source
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 50.f;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.dataArray count];;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:optTableViewControllercellIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:optTableViewControllercellIdentifier];
    }
    
    NSLog(@"%zd %@", indexPath.row, self.dataArray[indexPath.row]);
    cell.textLabel.text = self.dataArray[indexPath.row];
    
    return cell;
}

#pragma mark - Setter and Getter
- (NSArray *)dataArray {
    
    if (!_dataArray) {
        _dataArray = @[@"侧滑", @"缩放"];
    }
    return _dataArray;
}

@end
