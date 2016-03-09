//
//  RT_LayoutAttributes.m
//  EasyAutoLayout
//
//  Created by yangtao on 3/8/16.
//  Copyright © 2016 yangtao. All rights reserved.
//

#import "RT_LayoutAttributes.h"



@implementation RT_LayoutAttributes

-(instancetype)initWithHorizontal:(NSLayoutAttribute)Attributehorizontal referHorizontal:(NSLayoutAttribute)AttributereferHorizontal vertical:(NSLayoutAttribute)Attributevertical referVertical:(NSLayoutAttribute)AttributereferVertical {
    
    self = [super init];
    if (self) {
        
        _horizontal = Attributehorizontal;
        _referHorizontal = AttributereferHorizontal;
        _vertical = Attributevertical;
        _referVertical = AttributereferVertical;
    }
    
    return self;
}

- (instancetype)init {

    self = [super init];
    if (self) {
        
        _horizontal = NSLayoutAttributeLeft;
        _referHorizontal = NSLayoutAttributeLeft;
        _vertical = NSLayoutAttributeTop;
        _referVertical = NSLayoutAttributeTop;
    }
    
    return self;
}

- (instancetype)horizontals:(NSLayoutAttribute)from to:(NSLayoutAttribute)to {
    
    _horizontal = from;
    _referHorizontal = to;
    
    return self;
}

- (instancetype)verticals:(NSLayoutAttribute)from to:(NSLayoutAttribute)to {

    _vertical = from;
    _referVertical = to;
    
    return self;
}


@end
