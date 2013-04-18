//
//  TableViewListPlayer.m
//  ClubManager
//
//  Created by ios12 on 4/15/13.
//  Copyright (c) 2013 ios12. All rights reserved.
//

#import "TableViewListPlayer.h"
#import "Object.h"
#import "ViewListClubVC.h"
#import "InformationVC.h"
@interface TableViewListPlayer ()
{
    NSMutableArray *_arrayObject1;
    UITableView *_tableView1;
    ViewListClubVC *_viewlistclubVC;
}
@end

@implementation TableViewListPlayer

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
    
    _tableView1 = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    //3. Assign dataSource and delegate properties of UITableView variables
    _tableView1.dataSource = self;
    _tableView1.delegate = self;
    [self.view addSubview:_tableView1];
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"Back" style:UIBarButtonItemStyleDone target:self action:nil];
    
    _arrayObject1 = [NSMutableArray new];
    
    NSArray *arrayPlayer =  [NSArray arrayWithArray:self.object.thanhvien];
    for (int i=0; i< [arrayPlayer count]; i++) {
        NSDictionary *dic = [[NSDictionary alloc]initWithDictionary:arrayPlayer[i]];
        ObjectPlayer *objectplayer = [ObjectPlayer new];
        objectplayer.fullname = [dic objectForKey:@"fullname"];
        objectplayer.anhcauthu=[dic objectForKey:@"anh"];
        objectplayer.ngaysinh =[dic objectForKey:@"ngaysinh"];
        objectplayer.noisinh = [dic objectForKey:@"noisinh"];
        objectplayer.chieucao =[dic objectForKey:@"chieucao"];
        objectplayer.vitri =[dic objectForKey:@"vitri"];
        objectplayer.soao =[dic objectForKey:@"soao"];
        objectplayer.clbtre =[dic objectForKey:@"clbtre"];
        objectplayer.clbchuyennghiep = [dic objectForKey:@"clbchuyennghiep"];
        objectplayer.doituyenquocgia = [dic objectForKey:@"doituyenquocgia"];
        [_arrayObject1 addObject:objectplayer];

    }
    
    
    [super viewWillAppear:YES];
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return [NSString stringWithFormat:@"Co %d Cau Thu",[_arrayObject1 count]];
    //ghi tren thanh tableView
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //return 10; //Don't use arbitrary number here. It makes your code unmaintainable
    return [_arrayObject1 count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView  cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *result = nil;
    
    static NSString *TableViewCellIdentifier = @"MyCells";
    result = [tableView dequeueReusableCellWithIdentifier:TableViewCellIdentifier];
    
    if (result == nil){
        result = [[UITableViewCell alloc]  initWithStyle:UITableViewCellStyleSubtitle
                                         reuseIdentifier:TableViewCellIdentifier];
    }
    
    
    
    if (indexPath.section == 0) {
        ObjectPlayer * cellObject1 = [_arrayObject1 objectAtIndex:indexPath.row];
        result.textLabel.text = cellObject1.fullname;
        result.textLabel.font = [UIFont systemFontOfSize:15];
        UIImage * imagePlayer = [UIImage imageNamed:cellObject1.anhcauthu];
        [result.imageView setImage:imagePlayer];
        result.detailTextLabel.text = [NSString stringWithFormat:@"Cao %@\n%@",cellObject1.chieucao,cellObject1.clbchuyennghiep];
        result.detailTextLabel.numberOfLines = 2;
    }
    //[result.imageView setImage:[UIImage imageNamed:[dic objectForKey:_arraySuport]]];
    //result.detailTextLabel.text = [NSString stringWithFormat:@"%@ VND",_arraySuport];
    return result;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ObjectPlayer * objectPlayer = [_arrayObject1 objectAtIndex:indexPath.row];
    InformationVC * info = [[InformationVC alloc]initWithNibName:@"InformationVC" bundle:nil];
    info.objectPlayerManager = objectPlayer;
    info.modalPresentationStyle = UIModalPresentationFormSheet;
    info.modalTransitionStyle =UIModalTransitionStyleCrossDissolve;
    [self presentViewController:info animated:YES completion:^{
    }];
}

@end
