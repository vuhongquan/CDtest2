//
//  StoryBoardVC.m
//  NewScrollView
//
//  Created by ios12 on 4/21/13.
//  Copyright (c) 2013 ios12. All rights reserved.
//

#import "StoryBoardVC.h"
#define NUMBER_PHOTO 10
@interface StoryBoardVC ()
{
    NSMutableArray *_photoArray;
}
@end

@implementation StoryBoardVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void) loadView{
    [super loadView];
    [self loadPhotoScrollView];
}
-(void) loadPhotoScrollView{
    float width = self.view.bounds.size.width;
    float height= self.view.bounds.size.height;
    _pageControl.numberOfPages=NUMBER_PHOTO;
    _pageControl.currentPage=0;
    _scrollView.contentSize = CGSizeMake(width * NUMBER_PHOTO, height);
    UITapGestureRecognizer *Tap[11];
    for (int i = 0; i<NUMBER_PHOTO; i++) {
        Tap[10] = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(flip1:)];
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%d.jpg",i]];
        UIImageView *imageView = [[UIImageView alloc]initWithImage:image];
        imageView.frame = CGRectMake(i * width, 0, width, height);
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        [imageView addGestureRecognizer:Tap[NUMBER_PHOTO]];
        [_scrollView addSubview:imageView];
    }
    [_pageControl setNumberOfPages:NUMBER_PHOTO];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)pageController:(id)sender {
    int pageIndex = _pageControl.currentPage;
    _scrollView.contentOffset = CGPointMake(320 *pageIndex, 0);
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    int page = scrollView.contentOffset.x/scrollView.frame.size.width;
    _pageControl.currentPage=page;
}
#pragma mark UIScrollVIew
@end
