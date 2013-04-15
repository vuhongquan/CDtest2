//
//  ViewController.m
//  CDtest2
//
//  Created by iOS12 on 3/28/13.
//  Copyright (c) 2013 Techmaster. All rights reserved.
//

#import "ViewController.h"
#import "Music.h"
#import "SongOfBand.h"
@interface ViewController ()
{
     Music * _music;
}
@property (weak, nonatomic) IBOutlet UITextField *NameBand;
@property (weak, nonatomic) IBOutlet UITextField *BirthBand;
@property (weak, nonatomic) IBOutlet UILabel *Member;

@property (weak, nonatomic) IBOutlet UILabel *Song;
@property (weak, nonatomic) IBOutlet UITextField *CDalbum;
@property (weak, nonatomic) IBOutlet UIImageView *imageWithBand;
@end

@implementation ViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"FindBand" message:@"Draft name of Band" delegate:self cancelButtonTitle:@"Find" otherButtonTitles:NULL, nil];
    [alert setAlertViewStyle:UIAlertViewStylePlainTextInput];
    [alert show];
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    UITextField *searchTextfield = [alertView textFieldAtIndex:0];
    NSString * keyWord = searchTextfield.text.lowercaseString;
    NSString * fullname =[Music fullnameBand:keyWord];
    self.NameBand.text = fullname;
    NSString * thebirth =[Music birthWith:keyWord];
    self.BirthBand.text = thebirth;
    NSString * member =[Music memWith:keyWord];
    self.Member.text = member;
    NSString * cdAlbum =[Music cdAlbumsWith:keyWord];
    self.CDalbum.text = cdAlbum;
    NSString * imageView =[Music imageWith:keyWord];
    self.imageWithBand.image = [UIImage imageNamed:imageView];
    NSString * songofAlbum =[Music songWith:keyWord];
    self.Song.text =songofAlbum;
 }
- (IBAction)songOfAlbum:(id)sender {
//    NSString * song = [Music songWith:key]
    SongOfBand * song = [[SongOfBand alloc]initWithNibName:@"SongOfBand" bundle:nil];
    song.songName = self.Song.text;
    [self.navigationController pushViewController:song animated:YES];
    
 }
@end
