/*
     File: InfiniteScrollView.h
 Abstract: This view tiles UILabel instances to give the effect of infinite scrolling side to side.
  Version: 1.1
*/

#import <UIKit/UIKit.h>

@interface InfiniteScrollView : UIScrollView <UIScrollViewDelegate>
@property (nonatomic,strong) NSString * imageView;
@end
