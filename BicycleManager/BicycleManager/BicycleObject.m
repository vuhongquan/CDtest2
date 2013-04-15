//
//  BicycleObject.m
//  BicycleManager
//
//  Created by ios12 on 4/12/13.
//  Copyright (c) 2013 ios12. All rights reserved.
//

#import "BicycleObject.h"
#import "Object.h"
#import "InformationBicycle.h"
@interface BicycleObject ()
{
UITableView *_tableView1;
NSMutableArray *_arrayObject1;
DataManagerBicycle * _plist2;
}
@end

@implementation BicycleObject 

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

    [super viewWillAppear:YES];
	// Do any additional setup after loading the view.
    self.title = self.loaixe;
    _arrayObject1 =[NSMutableArray new];
    _plist2 = [DataManagerBicycle sharedManager1];
    NSPredicate* pre=[NSPredicate predicateWithFormat:@"groupid == %@",self.groupid];
    NSArray * arrayObject =(NSArray*)[_plist2.arrayBicycle filteredArrayUsingPredicate:pre];
    for (int i = 0; i < [arrayObject count]; i++) {
        NSDictionary *dic = [[NSDictionary alloc]initWithDictionary:arrayObject[i]];
        Object * object = [Object new];
        object.loaixe= [dic objectForKey:@"loaixe"];
        object.kieuXe = [dic objectForKey:@"kieuxe"];
        object.anh =[dic objectForKey:@"anh"];
        object.thongSo = [dic objectForKey:@"thongso"];
        object.soTien = [[dic objectForKey:@"sotien"] integerValue ];
        [_arrayObject1 addObject:object];
    
    }
    
    _tableView1 = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    //3. Assign dataSource and delegate properties of UITableView variables
    _tableView1.dataSource = self;
    _tableView1.delegate = self;
    [self.view addSubview:_tableView1];
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"Back" style:UIBarButtonItemStyleDone target:self action:nil];
    
    [super viewDidLoad];
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
    return [NSString stringWithFormat:@"Co %d loai",[_arrayObject1 count]];
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
        Object * cellObject1 = [_arrayObject1 objectAtIndex:indexPath.row];
        result.textLabel.text = cellObject1.kieuXe;
        result.textLabel.font = [UIFont systemFontOfSize:15];
        [result.imageView setImage:[UIImage imageNamed:cellObject1.anh]];
        result.detailTextLabel.text = [NSString stringWithFormat:@"%d VND",cellObject1.soTien];
    }
    //[result.imageView setImage:[UIImage imageNamed:[dic objectForKey:_arraySuport]]];
    //result.detailTextLabel.text = [NSString stringWithFormat:@"%@ VND",_arraySuport];
    return result;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    Object * object1 = [_arrayObject1 objectAtIndex:indexPath.row];
    InformationBicycle * info = [[InformationBicycle alloc]initWithNibName:@"InformationBicycle" bundle:nil];
    info.object = object1;
    info.modalPresentationStyle = UIModalPresentationFormSheet;
    info.modalTransitionStyle =UIModalTransitionStyleCrossDissolve;
    [self presentViewController:info animated:YES completion:^{
        
    }];

}

@end
