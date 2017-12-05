//
//  CalendarCollectionViewCell.m
//  iCrew
//
//  Created by Eiichi Hayashi on 2017/12/05.
//  Copyright © 2017年 Eiichi Hayashi. All rights reserved.
//

#import "CalendarCollectionViewCell.h"

@implementation CalendarCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    for (int i = 0; i < 31; i++) {
        UIView *view = [[UIView alloc] init];
        view.frame = CGRectMake(i * 66.0f, 0, 66.0f, 66.0f);
        UILabel *label = [[UILabel alloc] init];
        label.frame = CGRectMake(0, 0, 66.0f, 66.0f);
        label.text = [NSString stringWithFormat:@"%d日", i + 1];
        [view addSubview:label];
        [self addSubview:view];
    }
}

@end
