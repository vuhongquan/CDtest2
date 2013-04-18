//
//  numberOfMatch.h
//  ClubManager
//
//  Created by ios12 on 4/17/13.
//  Copyright (c) 2013 ios12. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Object.h"
#import <QuartzCore/QuartzCore.h>
@interface numberOfMatch : UIViewController<UIScrollViewDelegate>
@property (nonatomic)Object *object;
@property (nonatomic,strong) UIScrollView *myScrollView1;
@property (nonatomic,strong) NSArray *arrayObject;
@property (nonatomic,strong) CAShapeLayer * shapeLayer;
@end
