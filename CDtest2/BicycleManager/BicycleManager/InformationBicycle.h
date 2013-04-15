//
//  InformationBicycle.h
//  BicycleManager
//
//  Created by ios12 on 4/13/13.
//  Copyright (c) 2013 ios12. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Object.h"
@interface InformationBicycle : UIViewController
@property (weak, nonatomic) IBOutlet UITableView *bicycleTableView;
@property (nonatomic) Object * object;
@end
