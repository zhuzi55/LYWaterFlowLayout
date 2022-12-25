//
//  LYItemModel.h
//  LYWaterFlowLayout_Example
//
//  Created by liyz on 2022/12/25.
//  Copyright © 2022 zhuzi55. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LYItemModel : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, assign) float itemSizeScale; // item宽高比

@end

NS_ASSUME_NONNULL_END
