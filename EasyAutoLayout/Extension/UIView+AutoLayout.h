//
//  UIView+AutoLayout.h
//  EasyAutoLayout
//
//  Created by yangtao on 3/8/16.
//  Copyright © 2016 yangtao. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 对齐类型枚举，设置控件相对于父视图的位置
 - TopLeft:      左上
 - TopRight:     右上
 - TopCenter:    中上
 - BottomLeft:   左下
 - BottomRight:  右下
 - BottomCenter: 中下
 - CenterLeft:   左中
 - CenterRight:  右中
 - Center: 中中
 */

typedef enum {
    TopLeft,
    TopRight,
    TopCenter,
    BottomLeft,
    BottomRight,
    BottomCenter,
    CenterLeft,
    CenterRight,
    Center
}RT_AlignType;
@interface UIView (AutoLayout)
/**宽高约束*/
- (NSLayoutConstraint*)RT_AlignInnerWidth:(CGFloat)hight;
- (NSLayoutConstraint*)RT_AlignInnerHight:(CGFloat)hight;
/** 填充子视图*/
- (NSArray*)RT_Fill:(UIView*)referView;
- (NSArray*)RT_FillWithInsets:(UIEdgeInsets)insets  referView:(UIView*)referView;

/**参照参考视图内部对齐*/
- (NSArray*)RT_AlignInner:(RT_AlignType)type referView:(UIView*)referView size:(CGSize)size;
- (NSArray*)RT_AlignInnerWithOffset:(CGPoint)offset type:(RT_AlignType)type referView:(UIView*)referView size:(CGSize)size;

/** 参照参考视图垂直对齐*/
- (NSArray*)RT_AlignVertical:(RT_AlignType)type referView:(UIView*)referView size:(CGSize)size;
- (NSArray*)RT_AlignVerticalWithOffset:(CGPoint)offset  type:(RT_AlignType)type referView:(UIView*)referView size:(CGSize)size;

/**参照参考视图水平对齐*/
- (NSArray*)RT_AlignHorizontal:(RT_AlignType)type referView:(UIView*)referView  size:(CGSize)size;
- (NSArray*)RT_AlignHorizontalWithOffset:(CGPoint)offset type:(RT_AlignType)type referView:(UIView*)referView  size:(CGSize)size;

/** 在当前视图内部水平平铺控件*/
- (NSArray*)RT_HorizontalTile:(NSArray*)views insets:(UIEdgeInsets)insets;
/**  在当前视图内部垂直平铺控件*/
- (NSArray*)RT_VerticalTile:(NSArray*)views insets:(UIEdgeInsets)insets;
/** 从约束数组中查找指定 attribute 的约束*/
- (NSLayoutConstraint*)RT_Constraint:(NSArray*)constraintsList attribute:(NSLayoutAttribute)attribute;

@end
