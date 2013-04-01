//
//  SongOfBand.m
//  CDtest2
//
//  Created by iOS12 on 3/28/13.
//  Copyright (c) 2013 Techmaster. All rights reserved.
//

#import "SongOfBand.h"
#import "Music.h"
#import "ViewController.h"
@interface SongOfBand ()
{
}
@property (weak, nonatomic) IBOutlet UILabel *SongOfBand;

@end

@implementation SongOfBand

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
    // Do any additional setup after loading the view from its nib.
 
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    self.SongOfBand.text = [NSString stringWithFormat:@"Name of Song: %@",self.songName];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
