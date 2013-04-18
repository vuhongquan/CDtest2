//
//  TabBarMatchVC.m
//  ClubManager
//
//  Created by ios12 on 4/17/13.
//  Copyright (c) 2013 ios12. All rights reserved.
//

#import "TabBarMatchVC.h"
#import "BangxephangVC.h"
#import "numberOfMatch.h"
@interface TabBarMatchVC ()
{
    numberOfMatch *number;
    BangxephangVC *bxhView;
}
@end

@implementation TabBarMatchVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.

}
-(void)viewWillAppear:(BOOL)animated{
    number = [[numberOfMatch alloc]init];
    
    
    bxhView = [[BangxephangVC alloc]init];
    number.arrayObject = self.arrayObject;
    number.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Match" image:[UIImage imageNamed:@"anhicon1.png"] tag:1];
    
    bxhView.arrObject = self.arrayObject;
    bxhView.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"RankFootBall" image:[UIImage imageNamed:@"anhicon2.png"] tag:2];
    
    self.viewControllers = @[number,bxhView];

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
