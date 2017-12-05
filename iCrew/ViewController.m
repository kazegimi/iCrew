//
//  ViewController.m
//  iCrew
//
//  Created by Eiichi Hayashi on 2017/11/30.
//  Copyright © 2017年 Eiichi Hayashi. All rights reserved.
//

#import "ViewController.h"

#import "CalendarCollectionViewCell.h"

@interface ViewController ()

@end

@implementation ViewController
{
    NSInteger rowCount;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    rowCount = 50;
    
    UINib *nibFirst = [UINib nibWithNibName:@"CalendarCollectionViewCell" bundle:nil];
    [_calendarCollectionView registerNib:nibFirst forCellWithReuseIdentifier:@"CalendarCollectionViewCell"];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    _calendarCollectionView.contentOffset = CGPointMake(_calendarCollectionView.contentOffset.x, scrollView.contentOffset.y);
    _idTableView.contentOffset = CGPointMake(_idTableView.contentOffset.x, scrollView.contentOffset.y);
}

// TableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return rowCount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text = @"tag";
    cell.detailTextLabel.text = @"tag";
    
    return cell;
}

// CollectionView
- (NSInteger)numberOfSectionsInCollectionView: (UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section {
    return rowCount;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView  cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CalendarCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CalendarCollectionViewCell" forIndexPath:indexPath];
    
    if (indexPath.row % 2 == 0) {
        cell.backgroundColor = [UIColor redColor];
    } else {
        cell.backgroundColor = [UIColor blueColor];
    }
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
