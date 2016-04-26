# WWDashLineProject
iOS / Objective-C easy dash line util  cirle dash line 


支持xib设置属性，支持圆角虚线，支持垂直虚线


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
 *  @brief 虚线是否为圆角。
 */
@property(nonatomic,assign,getter=isCircleDot)IBInspectable BOOL circleDot;

@end
