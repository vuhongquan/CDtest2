//
//  InformationClubViewController.m
//  ClubManager
//
//  Created by ios12 on 4/15/13.
//  Copyright (c) 2013 ios12. All rights reserved.
//

#import "InformationClubViewController.h"

@interface InformationClubViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *iconClub;

@end

@implementation InformationClubViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    self.iconClub.image = [UIImage imageNamed:self.object.anhdoibong];
    [super viewWillAppear:YES];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 3;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return [NSString stringWithFormat:@"INFORMATION"];
    //ghi tren thanh tableView
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = nil;
    
    switch (indexPath.row) {
        case 0:
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:CellIdentifier];
            cell.textLabel.text = @"Name\nBirth";
            cell.textLabel.font = [UIFont systemFontOfSize:16];
            cell.textLabel.numberOfLines=2;
            cell.detailTextLabel.numberOfLines = 2;
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%@\n%@",self.object.tendoi,self.object.namsinh];
            break;
            
        case 1:
        {
            cell =[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:CellIdentifier];
            NSDictionary * thongsoDoibong = [NSDictionary dictionaryWithDictionary:self.object.thanhtich];
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%@\n%@\n%@",[thongsoDoibong objectForKey:@"bongdaanh"],[thongsoDoibong objectForKey:@"cupfa"],[thongsoDoibong objectForKey:@"uefa"]];
            cell.detailTextLabel.numberOfLines=3;
            cell.textLabel.text=[NSString stringWithFormat:@"Cup Anh:\nCup Fa:\nUEFA:"];
            cell.textLabel.font = [UIFont systemFontOfSize:15];
            cell.textLabel.numberOfLines = 3;
			cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
            break;
            
        case 2:{
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:CellIdentifier];
            cell.detailTextLabel.numberOfLines = 50;
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%@",self.object.history];
            break;
            
        }
            
    }
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 1:
            return 60;
            break;
        case 2:
            if ([self.object.tendoi isEqualToString:@"Manchester United"]) {
                return 450;
            }
            if ([self.object.tendoi isEqualToString:@"Arsenal"]) {
                return 300;
            }
        default:
            break;
    }
    return 50;
}

@end
