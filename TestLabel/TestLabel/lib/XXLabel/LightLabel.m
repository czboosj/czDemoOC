//
//  LightLabel.m
//  boosjdance
//
//  Created by 陈昭 on 2017/12/14.
//  Copyright © 2017年 cz. All rights reserved.
//

#import "LightLabel.h"

@implementation LightLabel

@synthesize insideColor;
@synthesize outLineColor;
@synthesize blurColor;

- (id)init
{
    self = [super init];
    if (self)
    {
        
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(ctx, self.outLineColor.CGColor);
    CGContextSetFillColorWithColor(ctx, self.insideColor.CGColor);
    CGContextSetLineWidth(ctx, self.font.pointSize / 60.0);
    CGContextSetShadowWithColor(ctx, CGSizeMake(0, 0), self.font.pointSize / 10.0, self.blurColor.CGColor);
    CGTextDrawingMode mode = !self.outLineColor ? kCGTextFill: (!self.insideColor ? kCGTextStroke : kCGTextFillStroke);
    CGContextSetTextDrawingMode(ctx, mode);
    NSMutableParagraphStyle *textStyle = [[NSMutableParagraphStyle defaultParagraphStyle]mutableCopy];
    
    textStyle.lineBreakMode = self.lineBreakMode;
    
    textStyle.alignment = self.textAlignment;
    
    NSDictionary *dictionary = @{NSFontAttributeName: self.font,NSParagraphStyleAttributeName: textStyle};
    [self.text drawInRect:self.bounds withAttributes:dictionary];
}

- (void)dealloc
{
    self.insideColor = nil;
    self.outLineColor = nil;
    self.blurColor = nil;
}

@end
