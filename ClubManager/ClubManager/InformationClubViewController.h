//
//  InformationClubViewController.h
//  ClubManager
//
//  Created by ios12 on 4/15/13.
//  Copyright (c) 2013 ios12. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Object.h"
@interface InformationClubViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong)Object *object;
@end
