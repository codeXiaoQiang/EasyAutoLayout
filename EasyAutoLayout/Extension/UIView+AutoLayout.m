//
//  UIView+AutoLayout.m
//  EasyAutoLayout
//
//  Created by yangtao on 3/8/16.
//  Copyright © 2016 yangtao. All rights reserved.
//

#import "UIView+AutoLayout.h"
#import "RT_LayoutAttributes.h"

#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
@implementation UIView (AutoLayout)

- (RT_LayoutAttributes*)layoutAttributes :(BOOL)isInner isVertical:(BOOL)isVertical type:(RT_AlignType)type{

    RT_LayoutAttributes *attributes = [[RT_LayoutAttributes alloc] init];
    
    switch (type) {
        case TopLeft:{
            
            RT_LayoutAttributes *leftAttributes = [attributes horizontals:NSLayoutAttributeLeft to:NSLayoutAttributeLeft];
            RT_LayoutAttributes *topAttributes = [leftAttributes verticals:NSLayoutAttributeTop to:NSLayoutAttributeTop];
            
            if (isInner) {
                    return topAttributes;
            }else if (isVertical) {
            
                return [attributes verticals:NSLayoutAttributeBottom to:NSLayoutAttributeTop];
            }else {
            
                return [attributes horizontals:NSLayoutAttributeRight to:NSLayoutAttributeLeft];
            }
        
            break;
        }
           
        case TopRight:{
        
            RT_LayoutAttributes *leftAttributes = [attributes horizontals:NSLayoutAttributeRight to:NSLayoutAttributeRight];
            RT_LayoutAttributes *topAttributes = [leftAttributes verticals:NSLayoutAttributeTop to:NSLayoutAttributeTop];
            
            if (isInner) {
                return topAttributes;
            }else if (isVertical) {
                
                return [attributes verticals:NSLayoutAttributeBottom to:NSLayoutAttributeTop];
            }else {
                
                return [attributes horizontals:NSLayoutAttributeLeft to:NSLayoutAttributeRight];
            }
            
            break;

        }
            
     
        case BottomLeft: {
        
            
            RT_LayoutAttributes *leftAttributes = [attributes horizontals:NSLayoutAttributeLeft to:NSLayoutAttributeLeft];
            RT_LayoutAttributes *topAttributes = [leftAttributes verticals:NSLayoutAttributeBottom to:NSLayoutAttributeBottom];
            
            if (isInner) {
                return topAttributes;
            }else if (isVertical) {
                
                return [attributes verticals:NSLayoutAttributeTop to:NSLayoutAttributeBottom];
            }else {
                
                return [attributes horizontals:NSLayoutAttributeRight to:NSLayoutAttributeLeft];
            }
            
            break;

        }
         
        case BottomRight: {
        
            RT_LayoutAttributes *leftAttributes = [attributes horizontals:NSLayoutAttributeRight to:NSLayoutAttributeRight];
            RT_LayoutAttributes *topAttributes = [leftAttributes verticals:NSLayoutAttributeBottom to:NSLayoutAttributeBottom];
            
            if (isInner) {
                return topAttributes;
            }else if (isVertical) {
                
                return [attributes verticals:NSLayoutAttributeTop to:NSLayoutAttributeBottom];
            }else {
                
                return [attributes horizontals:NSLayoutAttributeLeft to:NSLayoutAttributeRight];
            }
            
            break;
        }

            
        // 仅内部 & 垂直参照需要
        case TopCenter: {
        
            RT_LayoutAttributes *leftAttributes = [attributes horizontals:NSLayoutAttributeCenterX to:NSLayoutAttributeCenterX];
            RT_LayoutAttributes *topAttributes = [leftAttributes verticals:NSLayoutAttributeTop to:NSLayoutAttributeTop];
            
            return isInner ? topAttributes : [attributes verticals:NSLayoutAttributeBottom to:NSLayoutAttributeTop];
            
               break;
        }
            
         // 仅内部 & 垂直参照需要
        case BottomCenter: {
        
            RT_LayoutAttributes *leftAttributes = [attributes horizontals:NSLayoutAttributeCenterX to:NSLayoutAttributeCenterX];
            RT_LayoutAttributes *topAttributes = [leftAttributes verticals:NSLayoutAttributeBottom to:NSLayoutAttributeBottom];
            
            return isInner ? topAttributes : [attributes verticals:NSLayoutAttributeTop to:NSLayoutAttributeBottom];
            
            break;
        }
         // 仅内部 & 水平参照需要
        case CenterLeft: {
        
            RT_LayoutAttributes *leftAttributes = [attributes horizontals:NSLayoutAttributeLeft to:NSLayoutAttributeLeft];
            RT_LayoutAttributes *topAttributes = [leftAttributes verticals:NSLayoutAttributeCenterY to:NSLayoutAttributeCenterY];
            
            return isInner ? topAttributes : [attributes verticals:NSLayoutAttributeRight to:NSLayoutAttributeLeft];
            
            break;
        }
        // 仅内部 & 水平参照需要
        case CenterRight:{
        
            RT_LayoutAttributes *leftAttributes = [attributes horizontals:NSLayoutAttributeRight to:NSLayoutAttributeRight];
            RT_LayoutAttributes *topAttributes = [leftAttributes verticals:NSLayoutAttributeCenterY to:NSLayoutAttributeCenterY];
            
            return isInner ? topAttributes : [attributes verticals:NSLayoutAttributeLeft to:NSLayoutAttributeRight];
            
            break;
        }
            
        // 仅内部参照需要
        case Center:{
        
            return   [[RT_LayoutAttributes alloc] initWithHorizontal:NSLayoutAttributeCenterX referHorizontal:NSLayoutAttributeCenterX vertical:NSLayoutAttributeCenterY referVertical:NSLayoutAttributeCenterY];
            break;

        }
            
        default:
            break;
    }
}
/**
 宽高约束
 */
- (NSLayoutConstraint*)RT_AlignInnerWidth:(CGFloat)width {

    NSLayoutConstraint *cons = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:width];
    [self addConstraint:cons];
    
    return cons;
}

- (NSLayoutConstraint*)RT_AlignInnerHight:(CGFloat)hight {
    
    NSLayoutConstraint *cons = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:hight];
    [self addConstraint:cons];
    
    return cons;
}



/**
 填充子视图
 
 :param: referView 参考视图
 :param: insets    间距
 
 :returns: 约束数组
 */
- (NSArray*)RT_FillWithInsets:(UIEdgeInsets)insets  referView:(UIView*)referView
{

    self.translatesAutoresizingMaskIntoConstraints = NO;
    NSMutableArray *Constraints = [NSMutableArray array];

    //水平约束
    NSDictionary *metricsH = @{@"left" : @(insets.left), @"right" : @(insets.right)};
    NSArray *ConstraintH =  [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(left)-[subView]-(right)-|" options:NSLayoutFormatAlignAllBaseline metrics:metricsH views:@{@"subView" : self}];
    [Constraints addObjectsFromArray:ConstraintH];
    
    //垂直约束
    NSDictionary *metricsV = @{@"top" : @(insets.top), @"bottom" : @(insets.bottom)};
    NSArray *ConstraintV = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(top)-[subView]-(bottom)-|" options:NSLayoutFormatAlignAllBaseline metrics:metricsV views:@{@"subView" : self}];
    [Constraints addObjectsFromArray:ConstraintV];

    [self.superview addConstraints:Constraints];
    return Constraints;
}


- (NSArray*)RT_Fill:(UIView*)referView
{
    
    self.translatesAutoresizingMaskIntoConstraints = NO;
    NSMutableArray *Constraints = [NSMutableArray array];
    
    UIEdgeInsets insets = UIEdgeInsetsMake(0, 0, 0, 0);
    
    //水平约束
    NSDictionary *metricsH = @{@"left" : @(insets.left), @"right" : @(insets.right)};
    NSArray *ConstraintH =  [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(left)-[subView]-(right)-|" options:NSLayoutFormatAlignAllBaseline metrics:metricsH views:@{@"subView" : self}];
    [Constraints addObjectsFromArray:ConstraintH];
    
    //垂直约束
    NSDictionary *metricsV = @{@"top" : @(insets.top), @"bottom" : @(insets.bottom)};
    NSArray *ConstraintV = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(top)-[subView]-(bottom)-|" options:NSLayoutFormatAlignAllBaseline metrics:metricsV views:@{@"subView" : self}];
    [Constraints addObjectsFromArray:ConstraintV];
    
    [self.superview addConstraints:Constraints];
    return Constraints;
}


/**
 参照参考视图内部对齐
 
 :param: type      对齐方式
 :param: referView 参考视图
 :param: size      视图大小，如果是 nil 则不设置大小
 :param: offset    偏移量，默认是 CGPoint(x: 0, y: 0)
 
 :returns: 约束数组
 */
- (NSArray*)RT_AlignInnerWithOffset:(CGPoint)offset type:(RT_AlignType)type referView:(UIView*)referView size:(CGSize)size  {
    
    NSMutableArray *Constraints = [NSMutableArray array];
    
    NSArray *ConstraintAlignLayout = [self rt_AlignLayout:referView attributes:[self layoutAttributes:YES isVertical:YES type:type] size:size offset:offset];
    
    [Constraints addObjectsFromArray:ConstraintAlignLayout];
    return Constraints;
}

- (NSArray*)RT_AlignInner:(RT_AlignType)type referView:(UIView*)referView size:(CGSize)size  {
    
    NSMutableArray *Constraints = [NSMutableArray array];
        CGPoint offset = CGPointMake(0, 0);
    NSArray *ConstraintAlignLayout = [self rt_AlignLayout:referView attributes:[self layoutAttributes:YES isVertical:YES type:type] size:size offset:offset];
    
    [Constraints addObjectsFromArray:ConstraintAlignLayout];
    return Constraints;
}

/**
 参照参考视图垂直对齐
 
 :param: type      对齐方式
 :param: referView 参考视图
 :param: size      视图大小，如果是 nil 则不设置大小
 :param: offset    偏移量，默认是 CGPoint(x: 0, y: 0)
 
 :returns: 约束数组
 */
- (NSArray*)RT_AlignVerticalWithOffset:(CGPoint)offset  type:(RT_AlignType)type referView:(UIView*)referView size:(CGSize)size {
    
    NSMutableArray *Constraints = [NSMutableArray array];
    
    NSArray *ConstraintAlignVertical = [self rt_AlignLayout:referView attributes:[self layoutAttributes:NO isVertical:YES type:type] size:size offset:offset];
    
    [Constraints addObjectsFromArray:ConstraintAlignVertical];
    return Constraints;
}


- (NSArray*)RT_AlignVertical:(RT_AlignType)type referView:(UIView*)referView size:(CGSize)size  {
    
    NSMutableArray *Constraints = [NSMutableArray array];
    
    CGPoint offset = CGPointMake(0, 0);
    NSArray *ConstraintAlignVertical = [self rt_AlignLayout:referView attributes:[self layoutAttributes:NO isVertical:YES type:type] size:size offset:offset];
    
    [Constraints addObjectsFromArray:ConstraintAlignVertical];
    return Constraints;
}



/**
 参照参考视图水平对齐
 
 :param: type      对齐方式
 :param: referView 参考视图
 :param: size      视图大小，如果是 nil 则不设置大小
 :param: offset    偏移量，默认是 CGPoint(x: 0, y: 0)
 
 :returns: 约束数组
 */
- (NSArray*)RT_AlignHorizontalWithOffset:(CGPoint)offset type:(RT_AlignType)type referView:(UIView*)referView  size:(CGSize)size  {

    NSMutableArray *Constraints = [NSMutableArray array];
    
    NSArray *ConstraintAlignHorizontal = [self rt_AlignLayout:referView attributes:[self layoutAttributes:NO isVertical:NO type:type] size:size offset:offset];
    
    [Constraints addObjectsFromArray:ConstraintAlignHorizontal];
    return Constraints;
}

- (NSArray*)RT_AlignHorizontal:(RT_AlignType)type referView:(UIView*)referView  size:(CGSize)size  {
    
    NSMutableArray *Constraints = [NSMutableArray array];
    CGPoint offset = CGPointMake(0, 0);
    
    NSArray *ConstraintAlignHorizontal = [self rt_AlignLayout:referView attributes:[self layoutAttributes:NO isVertical:NO type:type] size:size offset:offset];
    
    [Constraints addObjectsFromArray:ConstraintAlignHorizontal];
    return Constraints;
}


/**
 在当前视图内部水平平铺控件
 
 :param: views  子视图数组
 :param: insets 间距
 
 :returns: 约束数组
 */
- (NSArray*)RT_HorizontalTile:(NSArray*)views insets:(UIEdgeInsets)insets {
    self.translatesAutoresizingMaskIntoConstraints = NO;
    NSMutableArray *Constraints = [NSMutableArray array];
    
    UIView *firstView = views[0];
    CGFloat margin = insets.right*(views.count-1) + insets.left +insets.right;
    CGFloat width = (ScreenWidth - margin)/views.count;
    [firstView RT_AlignInnerWithOffset:CGPointMake(insets.left, insets.top) type:TopLeft referView:self size:CGSizeMake(width, ScreenHeight-insets.top-insets.bottom)];
    UIView *preView = firstView;
    for (int i = 1; i < views.count; i++) {
        UIView *subView = views[i];
        
        NSArray*subViewConstraints = [subView rt_sizeReferViewConstraints:firstView];
        [Constraints addObjectsFromArray:subViewConstraints];
        
        [subView RT_AlignHorizontalWithOffset:CGPointMake(insets.right, 0) type:TopRight referView:preView size:CGSizeZero];
        preView = subView;
    }
        
    [self addConstraints:Constraints];
    return Constraints;
}

/**
 在当前视图内部垂直平铺控件
 
 :param: views  子视图数组
 :param: insets 间距
 
 :returns: 约束数组
 */
- (NSArray*)RT_VerticalTile:(NSArray*)views insets:(UIEdgeInsets)insets {
    self.translatesAutoresizingMaskIntoConstraints = NO;
    NSMutableArray *Constraints = [NSMutableArray array];
    
    UIView *firstView = views[0];
    CGFloat margin = insets.bottom*(views.count-1) + insets.top +insets.bottom;
    CGFloat height = (ScreenHeight - margin)/views.count;
    [firstView RT_AlignInnerWithOffset:CGPointMake(insets.left, insets.top) type:TopLeft referView:self size:CGSizeMake(ScreenWidth-insets.left-insets.right,height)];

    
    UIView *preView = firstView;
    for (int i = 1; i < views.count; i++) {
        UIView *subView = views[i];
        
        NSArray*subViewConstraints = [subView rt_sizeReferViewConstraints:firstView];
        [Constraints addObjectsFromArray:subViewConstraints];
        
        [subView RT_AlignVerticalWithOffset:CGPointMake(0, insets.bottom) type:BottomLeft referView:preView size:CGSizeZero];
        preView = subView;
    }
    
    [self addConstraints:Constraints];
    return Constraints;
}


/**
 从约束数组中查找指定 attribute 的约束
 
 :param: constraintsList 约束数组
 :param: attribute       约束属性
 
 :returns: 对应的约束
 */
- (NSLayoutConstraint*)RT_Constraint:(NSArray*)constraintsList attribute:(NSLayoutAttribute)attribute {

    for (NSLayoutConstraint*constraint in constraintsList) {
        if (constraint.firstItem == self && constraint.firstAttribute == attribute) {
            return constraint;
        }
    }

    return nil;
}


// MARK: - 私有函数

/**
 参照参考视图对齐布局
 
 :param: referView  参考视图
 :param: attributes 参照属性
 :param: size       视图大小，如果是 nil 则不设置大小
 :param: offset     偏移量，默认是 CGPoint(x: 0, y: 0)
 
 :returns: 约束数组
 */

- (NSArray*)rt_AlignLayout:(UIView*)referView attributes:(RT_LayoutAttributes*)attributes size:(CGSize)size offset:(CGPoint)offset {

    self.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSMutableArray *Constraints = [NSMutableArray array];
    
    NSArray *positionConstraints = [self rt_positionConstraints:referView attributes:attributes offset:offset];
    [Constraints addObjectsFromArray:positionConstraints];
    
    NSString* sizeString = NSStringFromCGSize(size);
    NSString* CGSizeZeroString = NSStringFromCGSize(CGSizeZero);
    if (![sizeString isEqualToString:CGSizeZeroString]){
        
        NSArray *sizeConstraints = [self rt_sizeConstraints:size];
        [Constraints addObjectsFromArray:sizeConstraints];
    }
   
    [self.superview addConstraints:Constraints];
    return Constraints;
}

/**
 尺寸约束数组
 
 :param: size 视图大小
 
 :returns: 约束数组
 */
- (NSArray*)rt_sizeConstraints:(CGSize)size {

     NSMutableArray *Constraints = [NSMutableArray array];
    
    //宽度约束
    NSLayoutConstraint *ConstraintW = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:size.width];
        [Constraints addObject:ConstraintW];
    
    //高度约束
    NSLayoutConstraint *ConstraintH = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:size.height];
        [Constraints addObject:ConstraintH];

    return Constraints;
}

/**
 尺寸约束数组
 
 :param: referView 参考视图，与参考视图大小一致
 
 :returns: 约束数组
 */
- (NSArray*)rt_sizeReferViewConstraints:(UIView*)referView {
    
    NSMutableArray *Constraints = [NSMutableArray array];
    
    //宽度约束
    NSLayoutConstraint *ConstraintW = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:referView attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0];
    [Constraints addObject:ConstraintW];
    
    //高度约束
    NSLayoutConstraint *ConstraintH = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:referView attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0];
    [Constraints addObject:ConstraintH];
 
    return Constraints;
}

/**
 位置约束数组
 
 :param: referView  参考视图
 :param: attributes 参照属性
 :param: offset     偏移量
 
 :returns: 约束数组
 */
- (NSArray*)rt_positionConstraints:(UIView*)referView attributes:(RT_LayoutAttributes*)attributes offset:(CGPoint)offset {

    NSMutableArray *Constraints = [NSMutableArray array];
    
    //水平约束
    NSLayoutConstraint *ConstraintH = [NSLayoutConstraint constraintWithItem:self attribute:attributes.horizontal relatedBy:NSLayoutRelationEqual toItem:referView attribute:attributes.referHorizontal multiplier:1.0 constant:offset.x];
    [Constraints addObject:ConstraintH];
    
    //垂直约束
    NSLayoutConstraint *ConstraintV = [NSLayoutConstraint constraintWithItem:self attribute:attributes.vertical relatedBy:NSLayoutRelationEqual toItem:referView attribute:attributes.referVertical multiplier:1.0 constant:offset.y];
    [Constraints addObject:ConstraintV];
    
    return Constraints;
}

@end
