//
//  TestFlowLayout.m
//  Demo20210123OC
//
//  Created by liyz on 2021/6/3.
//

#import "LYWaterFlowLayout.h"

@interface LYWaterFlowLayout()

/**
 * 存放所有cell的布局属性
 */
@property (nonatomic , strong) NSMutableArray *attrsArray;
/**
 * 存放所有列的当前高度
 */
@property (nonatomic , strong) NSMutableArray *columnHeights;

@end

@implementation LYWaterFlowLayout

-(instancetype)init
{
    if (self=[super init]) {
        self.columnMargin = 10;
        self.rowMargin = 10;
        self.endgeInsets = UIEdgeInsetsMake(10, 10, 10, 10);
        self.columnCount = 3;
    }
    return self;
}
-(void)prepareLayout{
    [super prepareLayout];
    
//    NSLog(@"== prepareLayout");
    
    [self.columnHeights removeAllObjects];
    for (NSInteger i = 0; i < self.columnCount; i++) {
        [self.columnHeights addObject:@(self.endgeInsets.top)];
    }
    
    // 清除之前所有的布局属性
    [self.attrsArray removeAllObjects];
    
    // 开始创建每一个cell对应的布局属性
    NSInteger count = [self.collectionView numberOfItemsInSection:0];
    
    for (NSInteger i = 0 ;i < count;i++) {
        // 创建位置
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        
       // 获取indexPath位置对应cell的属性
        UICollectionViewLayoutAttributes *attributes = [self ly_layoutAttributesForItemAtIndexPath:indexPath];
        
        [self.attrsArray addObject:attributes];
    }
}

/**
 * 获取indexPath位置对应cell的属性
 */
- (UICollectionViewLayoutAttributes *)ly_layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath{
    // 创建布局属性
    UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    //collectionView的宽度
    CGFloat collectionViewWidth = self.collectionView.frame.size.width;
    
    // 找出高度最短的那一列
    NSInteger shortestColumn = 0;
    // 找出最小高度
    CGFloat minColumnHeight = [self.columnHeights[0] doubleValue];
    for (NSInteger i = 1 ; i < self.columnCount; i++) {
        // 取出第i列的高度
        CGFloat columnHeight = [self.columnHeights[i] doubleValue];
        // 比较大小
        if (minColumnHeight > columnHeight) {
            minColumnHeight = columnHeight;
            shortestColumn = i;
        }
    }
    // 宽度
    CGFloat width = (collectionViewWidth - self.endgeInsets.left - self.endgeInsets.right - (self.columnCount - 1) *self.columnMargin) / self.columnCount;
    // x坐标
    CGFloat x = self.endgeInsets.left + shortestColumn * (width + self.columnMargin);
    // y坐标
    CGFloat y = minColumnHeight;
    if (y != self.endgeInsets.top) {
        y += self.rowMargin;
    }
    
    // 高度
    CGFloat height = [self.degelate Flow:self heightForWidth:width atIndexPath:indexPath];
    //设置布局属性的frame
    attributes.frame = CGRectMake(x,y, width, height);
    
    // 更新高度
    self.columnHeights[shortestColumn] = @(CGRectGetMaxY(attributes.frame));
    
    return attributes;
}


/**
 * 决定cell的布局
 */
- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
//    NSLog(@"== layoutAttributesForElementsInRect");
    return self.attrsArray;
}


- (CGSize)collectionViewContentSize{
   
//    NSLog(@"== collectionViewContentSize");
    
    // 找出最大高度
    CGFloat maxColumnHeight = [self.columnHeights[0] doubleValue];
    for (NSInteger i = 1 ; i < self.columnCount; i++) {
        // 取出第i列的高度
        CGFloat columnHeight = [self.columnHeights[i] doubleValue];
        // 比较大小
        if (maxColumnHeight < columnHeight) {
            maxColumnHeight = columnHeight;
        }
    }
    return CGSizeMake(0, maxColumnHeight + self.endgeInsets.bottom);
}

- (NSMutableArray *)attrsArray{
    if (!_attrsArray) {
        _attrsArray = [NSMutableArray array];
    }
    return _attrsArray;
}

- (NSMutableArray *)columnHeights{
    if (!_columnHeights) {
        _columnHeights = [NSMutableArray array];
    }
    return _columnHeights;
}


@end
