//
//  
//
//
//  Created by  on 16/3/4.
//  Copyright © 2016年  All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WWDashLine : UIView

/*!
 *  @brief 虚线颜色。
 */
@property(nonatomic,strong)IBInspectable UIColor* dashLineColor;
/*!
 *  @brief 虚线点之间的间距
 */

@property(nonatomic,assign)IBInspectable NSInteger lineDotSpacing;
/*!
 *  @brief 虚线点的宽度。
 */
@property(nonatomic,assign)IBInspectable NSInteger lineDotWidth;

/*!
 *  @brief 虚线的方向，横向和竖向。
 */
@property(nonatomic,assign,getter=isVertical)IBInspectable BOOL vertical;

/*!
 *  @brief 虚线的方向，横向和竖向。
 */
@property(nonatomic,assign,getter=isCircleDot)IBInspectable BOOL circleDot;

@end
