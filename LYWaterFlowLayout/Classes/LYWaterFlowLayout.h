//
//  TestFlowLayout.h
//  Demo20210123OC
//
//  Created by liyz on 2021/6/3.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class LYWaterFlowLayout;
@protocol LYWaterFlowLayoutDelegate <NSObject>
/**
 *  这个代理方法用于在viewcontroller中通过Width来计算高度
 *
 *  @param Flow      flowlayout
 *  @param width     图片的宽
 *  @param indexPath indexPath
 *
 *  @return 图片的高
 */
-(CGFloat)Flow:(LYWaterFlowLayout *)Flow heightForWidth:(CGFloat)width atIndexPath:(NSIndexPath*)indexPath;

@end

@interface LYWaterFlowLayout : UICollectionViewFlowLayout

@property(nonatomic,assign) UIEdgeInsets endgeInsets;
@property(nonatomic,assign) CGFloat rowMargin;//行间距
@property(nonatomic,assign) CGFloat columnMargin;//列间距
@property(nonatomic,assign) CGFloat columnCount;//多少列
@property(nonatomic,weak) id<LYWaterFlowLayoutDelegate>degelate;

@end

NS_ASSUME_NONNULL_END
