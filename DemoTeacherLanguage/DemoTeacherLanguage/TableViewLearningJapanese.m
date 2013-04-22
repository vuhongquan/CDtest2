//
//  TableViewLearningJapanese.m
//  DemoTeacherLanguage
//
//  Created by ios12 on 4/22/13.
//  Copyright (c) 2013 ios12. All rights reserved.
//

#import "TableViewLearningJapanese.h"

@interface TableViewLearningJapanese ()
{
     UITableView *_tableView1;
    NSMutableArray *_arrayLanguage;
}
@end

@implementation TableViewLearningJapanese

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
    _tableView1 = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _tableView1.dataSource = self;
    _tableView1.delegate = self;
    [self.view addSubview:_tableView1];
      self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"Back" style:UIBarButtonItemStyleDone target:self action:nil];
    _arrayLanguage = [NSMutableArray new];
    NSArray *arrayLearn = [NSArray arrayWithArray:self.objectTeach.listTeacherLanguage];
    for (int i = 0; i<[arrayLearn count]; i++) {
        NSDictionary *dic = [[NSDictionary alloc]initWithDictionary:arrayLearn[i]];
        Object *object1  = [Object new];
        object1.tiengviet = [dic objectForKey:@"tiengviet"];
        object1.tiengnhat = [dic objectForKey:@"tiengnhat"];
        object1.sound = [dic objectForKey:@"sound"];
        [_arrayLanguage addObject:object1];
    }
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
    return [NSString stringWithFormat:@"%@",self.objectTeach.teacherLanguage];
    //ghi tren thanh tableView
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //return 10; //Don't use arbitrary number here. It makes your code unmaintainable
    return [_arrayLanguage count];
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
        Object* cellObject1 = [_arrayLanguage objectAtIndex:indexPath.row];
        result.textLabel.text = [NSString stringWithFormat:@"%@",cellObject1.tiengviet];
        result.textLabel.font = [UIFont systemFontOfSize:15];
        result.detailTextLabel.text = [NSString stringWithFormat:@"%@",cellObject1.tiengnhat];
        result.detailTextLabel.numberOfLines = 2;
    }
    //[result.imageView setImage:[UIImage imageNamed:[dic objectForKey:_arraySuport]]];
    //result.detailTextLabel.text = [NSString stringWithFormat:@"%@ VND",_arraySuport];
    return result;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    Object *object1 = [_arrayLanguage objectAtIndex:indexPath.row];
    dispatch_queue_t dispatchQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_async(dispatchQueue, ^(void) {
        NSBundle *mainBundle = [NSBundle mainBundle];
        
        NSString *filePath = [mainBundle pathForResource:[NSString stringWithFormat:@"%@",object1.sound]
                                                  ofType:@"mp3"];
        
        NSData   *fileData = [NSData dataWithContentsOfFile:filePath];
        
        NSError  *error = nil;
        
        /* Start the audio player */
        self.audioPlayer = [[AVAudioPlayer alloc] initWithData:fileData
                                                         error:&error];
        
        self.audioPlayer.delegate = self;
        [self.audioPlayer prepareToPlay];
        [self.audioPlayer play];
        self.audioPlayer.volume = 1;
    });
}
@end
