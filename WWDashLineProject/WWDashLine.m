//
//  WWDashLine
//
//
//  Created by  on 16/3/4.
//  Copyright © 2016年 . All rights reserved.
//

#import "WWDashLine.h"

@implementation WWDashLine

-(void)drawRect:(CGRect)rect
{
    CGFloat width = CGRectGetWidth(self.bounds);
    CGFloat height = CGRectGetHeight(self.bounds);
    CGFloat dashLineW = height;
    if (self.isVertical) {
        dashLineW = width;
    }
    
    if(self.lineDotWidth<=0)
    {
        if (self.isVertical) {
            self.lineDotWidth = width;
        }
        else
        {
            self.lineDotWidth = height;
        }
    }
    
    if (self.lineDotSpacing<=0) {
        if (self.isVertical) {
            self.lineDotSpacing = width/2.0f;
        }
        else
        {
            self.lineDotSpacing = height/2.0f;
        }
    }

    
    struct CGColor* strokeColor = [UIColor redColor].CGColor;
    if (self.dashLineColor) {
        strokeColor = self.dashLineColor.CGColor;
    }

    
    CGFloat thickness = 1;
    if (self.isVertical) {
        thickness = height;
    }
    else
    {
        thickness = width;
    }
    
    CGContextRef cx = UIGraphicsGetCurrentContext();
    
    CGContextSetStrokeColorWithColor(cx, strokeColor);
    
    if (self.isCircleDot)
    {
        
        CGContextSetFillColorWithColor(cx,strokeColor);
        CGContextBeginPath(cx);
        NSInteger segmentLength = self.lineDotWidth +self.lineDotSpacing;
        NSInteger count = 0;
        CGFloat start = 0;
        if (self.isVertical) {
            count = height/segmentLength +1;
            start = (((NSInteger)height)% segmentLength)/2.0f;
        }
        else
        {
            count = width/segmentLength +1;
            start = (((NSInteger)width)% segmentLength)/2.0f;
        }
        
        for (int i=0;i<count;i++) {
            if (self.isVertical) {
                CGContextAddEllipseInRect(cx,CGRectMake(0, start, self.lineDotWidth, self.lineDotWidth));
            }
            else
            {
                 CGContextAddEllipseInRect(cx,CGRectMake(start, 0, self.lineDotWidth, self.lineDotWidth));
            }
            
            start += segmentLength;
        }
        CGContextFillPath(cx);
    }
    else
    {
        CGContextSetLineWidth(cx, thickness);
        //CGFloat ra[] = {4,2};
        CGFloat ra[] = {self.lineDotWidth,self.lineDotSpacing};
        
        CGContextSetLineDash(cx, 0.0, ra, 2); // nb "2" == ra count
        if (self.isVertical) {
            CGContextMoveToPoint(cx, thickness*0.5,0);
            CGContextAddLineToPoint(cx, thickness*0.5, height);
        }
        else
        {
            CGContextMoveToPoint(cx, 0,thickness*0.5);
            CGContextAddLineToPoint(cx, self.bounds.size.width, thickness*0.5);
        }

    }

    CGContextStrokePath(cx);
}



@end
