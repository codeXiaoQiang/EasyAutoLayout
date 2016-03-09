//
//  RT_LayoutAttributes.h
//  EasyAutoLayout
//
//  Created by yangtao on 3/8/16.
//  Copyright © 2016 yangtao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RT_LayoutAttributes : NSObject

@property (nonatomic, assign) NSLayoutAttribute horizontal;

@property (nonatomic, assign) NSLayoutAttribute referHorizontal;

@property (nonatomic, assign) NSLayoutAttribute vertical;

@property (nonatomic, assign) NSLayoutAttribute referVertical;


-(instancetype)initWithHorizontal:(NSLayoutAttribute)Attributehorizontal referHorizontal:(NSLayoutAttribute)AttributereferHorizontal vertical:(NSLayoutAttribute)Attributevertical referVertical:(NSLayoutAttribute)AttributereferVertical;

- (instancetype)horizontals:(NSLayoutAttribute)from to:(NSLayoutAttribute)to;
- (instancetype)verticals:(NSLayoutAttribute)from to:(NSLayoutAttribute)to;
@end
