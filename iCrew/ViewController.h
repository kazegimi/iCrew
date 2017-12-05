//
//  ViewController.h
//  iCrew
//
//  Created by Eiichi Hayashi on 2017/11/30.
//  Copyright © 2017年 Eiichi Hayashi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource, UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *idTableView;
@property (weak, nonatomic) IBOutlet UICollectionView *calendarCollectionView;



@end

