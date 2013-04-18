//
//  TabBarVC.m
//  ClubManager
//
//  Created by ios12 on 4/16/13.
//  Copyright (c) 2013 ios12. All rights reserved.
//

#import "TabBarVC.h"
#import "InformationClubViewController.h"
#import "TableViewListPlayer.h"
@interface TabBarVC ()

@end

@implementation TabBarVC

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
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    InformationClubViewController *infomation = [[InformationClubViewController alloc]initWithNibName:@"InformationClubViewController" bundle:nil];
    infomation.object = self.object;
    infomation.tabBarItem =[[UITabBarItem alloc] initWithTitle:@"Club" image:[UIImage imageNamed:@"anhicon1.png"] tag:1];
    
    TableViewListPlayer *tableView = [[TableViewListPlayer alloc]init];
    tableView.object = self.object;
    tableView.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"Player" image:[UIImage imageNamed:@"anhicon2.png"] tag:2];
    self.viewControllers = @[infomation,tableView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
