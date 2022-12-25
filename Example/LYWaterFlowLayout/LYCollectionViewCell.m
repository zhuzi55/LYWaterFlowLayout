//
//  LYCollectionViewCell.m
//  Demo20210123OC
//
//  Created by liyz on 2022/12/18.
//

#import "LYCollectionViewCell.h"

@implementation LYCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self creatUI];
    }
    return self;
}

-(void)creatUI{
    self.titleLable = [[UILabel alloc] initWithFrame:self.bounds];
    self.titleLable.textAlignment = NSTextAlignmentCenter;
    self.titleLable.textColor = [UIColor grayColor];
    self.titleLable.font = [UIFont systemFontOfSize:14];
    [self.contentView addSubview:self.titleLable];

}

@end
