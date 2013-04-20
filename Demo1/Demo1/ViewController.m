//
//  ViewController.m
//  Demo1
//
//  Created by ios12 on 4/20/13.
//  Copyright (c) 2013 ios12. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    UIScrollView * myScrollView;
    NSArray *_arrayImage;
    UIView *_view;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _arrayImage = @[@"2.png",@"1.png",@"3.png",@"4.png",@"2.png",@"3.png",@"1.png",@"4.png"];
    CGRect scrollViewRect = self.view.bounds;
    self.view.backgroundColor = [UIColor whiteColor];
    myScrollView = [[UIScrollView alloc] initWithFrame:scrollViewRect];
    myScrollView.pagingEnabled = YES;
    myScrollView.minimumZoomScale = myScrollView.frame.size.width;
    [myScrollView setZoomScale:myScrollView.minimumZoomScale];
    [myScrollView setContentOffset:CGPointMake(myScrollView.frame.size.width, 0)];
    [myScrollView setContentSize:CGSizeMake(myScrollView.frame.size.width *[_arrayImage count], myScrollView.frame.size.height)];
    [self.view addSubview:myScrollView];
    [self updateOffsetsOfViews];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)updateOffsetsOfViews{
    for (int i=0; i<[_arrayImage count]; i++) {
        _imageView = [_arrayImage objectAtIndex:i];
        UIImageView * view = [[UIImageView alloc]initWithImage:[UIImage imageNamed:_imageView]];
        view.contentMode =UIViewContentModeScaleToFill;
        view.frame = CGRectMake(i*self.view.frame.size.width,200,self.view.frame.size.width,700);
        view.backgroundColor = [UIColor blackColor];
        view.tag=i+1;
        [myScrollView addSubview:view];
    }
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}
@end
