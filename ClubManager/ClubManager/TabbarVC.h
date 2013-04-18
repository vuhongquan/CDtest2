//
//  TabBarVC.h
//  ClubManager
//
//  Created by ios12 on 4/16/13.
//  Copyright (c) 2013 ios12. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Object.h"
#import "ObjectPlayer.h"
@interface TabBarVC : UITabBarController<UITabBarDelegate>
@property(nonatomic,strong) Object *object;
@end
