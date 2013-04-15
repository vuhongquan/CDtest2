//
//  BicycleObject.h
//  BicycleManager
//
//  Created by ios12 on 4/12/13.
//  Copyright (c) 2013 ios12. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BicycleObject  : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) NSString * groupid;
@property (nonatomic,strong) NSString * loaixe;
@end
