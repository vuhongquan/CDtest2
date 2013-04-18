//
//  InformationVC.m
//  ClubManager
//
//  Created by ios12 on 4/16/13.
//  Copyright (c) 2013 ios12. All rights reserved.
//

#import "InformationVC.h"

@interface InformationVC ()
@property (weak, nonatomic) IBOutlet UIImageView *imagePlayer;

@end

@implementation InformationVC

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
    self.imagePlayer.image =[UIImage imageNamed:self.objectPlayerManager.anhcauthu];
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
    return [NSString stringWithFormat:@"%@",self.objectPlayerManager.fullname];
    //ghi tren thanh tableView
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = nil;
    
    switch (indexPath.row) {
        case 0:
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:CellIdentifier];
            cell.textLabel.text = @"Name\nBirth\nNoi sinh";
            cell.textLabel.font = [UIFont systemFontOfSize:16];
            cell.textLabel.numberOfLines=3;
            cell.detailTextLabel.numberOfLines = 3;
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%@\n%@\n%@",self.objectPlayerManager.fullname,self.objectPlayerManager.ngaysinh,self.objectPlayerManager.noisinh];
            break;
            
        case 1:
        {
            cell =[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:CellIdentifier];
            cell.detailTextLabel.text= [NSString stringWithFormat:@"%@\n%@\n%@\n%@\n%@\n%@",self.objectPlayerManager.chieucao,self.objectPlayerManager.vitri,self.objectPlayerManager.soao,self.objectPlayerManager.clbtre,self.objectPlayerManager.clbchuyennghiep,self.objectPlayerManager.doituyenquocgia];
            cell.detailTextLabel.numberOfLines=7;
            cell.textLabel.text=[NSString stringWithFormat:@"Height:\nVi tri:\nSo ao:\nClb tre:\nClbCN:\nNation"];
            cell.textLabel.font = [UIFont systemFontOfSize:15];
            cell.textLabel.numberOfLines = 7;
			cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
            break;
            
        case 2:
            cell =[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            UIButton* btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            btn.frame = CGRectMake(20, 5, 280, 35);
            btn.tag = 1234;
            [btn setTitle:@"Close" forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(closeDetail:) forControlEvents:UIControlEventTouchUpInside];
            [cell addSubview:btn];
            break;
        }
             return cell; 

}
-(void)closeDetail:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
            case 0:
            return 70;
            break;
        case 1:
            return 135;
            break;
            
        default:
            break;
    }
    return 50;
}

@end
