//
//  TableViewListPlayer.h
//  ClubManager
//
//  Created by ios12 on 4/15/13.
//  Copyright (c) 2013 ios12. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Object.h"
#import "ObjectPlayer.h"
@interface TableViewListPlayer : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) Object *object;
@property (nonatomic,strong) ObjectPlayer *object1;
@end
