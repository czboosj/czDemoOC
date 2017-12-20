//
//  LightLabel.h
//  boosjdance
//
//  Created by 陈昭 on 2017/12/14.
//  Copyright © 2017年 cz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LightLabel : UILabel
/// 外发光
@property (nonatomic, retain) UIColor *outLineColor;

/// 里发光
@property (nonatomic, retain) UIColor *insideColor;

/// 光晕
@property (nonatomic, retain) UIColor *blurColor;
@end
