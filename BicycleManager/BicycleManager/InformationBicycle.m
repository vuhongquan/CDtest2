//
//  InformationBicycle.m
//  BicycleManager
//
//  Created by ios12 on 4/13/13.
//  Copyright (c) 2013 ios12. All rights reserved.
//

#import "InformationBicycle.h"

@interface InformationBicycle ()
@property (weak, nonatomic) IBOutlet UIImageView *photoOfBicycle;

@end

@implementation InformationBicycle

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
    self.photoOfBicycle.image = [UIImage imageNamed:self.object.anh];
    [super viewDidLoad];
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

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = nil;
    
    switch (indexPath.row) {
        case 0:
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:CellIdentifier];
            cell.textLabel.text = @"Name\n Gia tien";
            cell.textLabel.font = [UIFont systemFontOfSize:16];
            cell.textLabel.numberOfLines=2;
            cell.detailTextLabel.numberOfLines = 2;
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ \n%d VND",self.object.kieuXe,self.object.soTien];
            break;
            
        case 1:
        {
            cell =[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:CellIdentifier];
            NSDictionary * thongSoXe = [NSDictionary dictionaryWithDictionary:self.object.thongSo];
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%@\n%@\n%@\n%@\n%@",[thongSoXe objectForKey:@"mau"],[thongSoXe objectForKey:@"khung"],[thongSoXe objectForKey:@"son"],[thongSoXe objectForKey:@"decal"],[thongSoXe objectForKey:@"phuoc xe"]];
            cell.detailTextLabel.numberOfLines=5;
            cell.textLabel.text=[NSString stringWithFormat:@"Mau:\nKhung:\nSon:\nDecal:\nPhuoc:"];
            cell.textLabel.font = [UIFont systemFontOfSize:15];
            cell.textLabel.numberOfLines = 5;
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
    // Configure the cell...
    
    return cell;
}
-(void)closeDetail:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 1:
            return 135;
            break;
            
        default:
            break;
    }
    return 50;
}

@end
