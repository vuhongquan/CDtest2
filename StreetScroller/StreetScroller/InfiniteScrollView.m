/*
     File: InfiniteScrollView.m
 Abstract: This view tiles UILabel instances to give the effect of infinite scrolling side to side.
  Version: 1.1
*/

#import "InfiniteScrollView.h"

@interface InfiniteScrollView () {
    NSMutableArray *visibleLabels;
    UIView         *labelContainerView;
    NSArray *arrayimage;
}

- (void)tileLabelsFromMinX:(CGFloat)minimumVisibleX toMaxX:(CGFloat)maximumVisibleX;

@end


@implementation InfiniteScrollView

- (id)initWithCoder:(NSCoder *)aDecoder {
    if ((self = [super initWithCoder:aDecoder])) {
        self.contentSize = CGSizeMake(1000, self.frame.size.height);
        
        visibleLabels = [[NSMutableArray alloc] init];
        
        labelContainerView = [[UIView alloc] init];
        labelContainerView.frame = CGRectMake(0, 0, self.contentSize.width,400);
        [self addSubview:labelContainerView];

        [labelContainerView setUserInteractionEnabled:NO];
        
        // hide horizontal scroll indicator so our recentering trick is not revealed
        [self setShowsHorizontalScrollIndicator:NO];
    }
    return self;
}

#pragma mark -
#pragma mark Layout

// recenter content periodically to achieve impression of infinite scrolling
- (void)recenterIfNecessary {
    CGPoint currentOffset = [self contentOffset];
    CGFloat contentWidth = [self contentSize].width;
    CGFloat centerOffsetX = (contentWidth - [self bounds].size.width) / 2.0;
    CGFloat distanceFromCenter = fabs(currentOffset.x - centerOffsetX);
    
    if (distanceFromCenter > (contentWidth / 4.0)) {
        self.contentOffset = CGPointMake(centerOffsetX, currentOffset.y);
        
        // move content by the same amount so it appears to stay still
        for (UIImageView *image in visibleLabels) {
            CGPoint center = [labelContainerView convertPoint:image.center toView:self];
            center.x += (centerOffsetX - currentOffset.x);
            image.center = [self convertPoint:center toView:labelContainerView];
        }
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self recenterIfNecessary];
 
    // tile content in visible bounds
    CGRect visibleBounds = [self convertRect:[self bounds] toView:labelContainerView];
    CGFloat minimumVisibleX = CGRectGetMinX(visibleBounds);
    CGFloat maximumVisibleX = CGRectGetMaxX(visibleBounds);
    
    [self tileLabelsFromMinX:minimumVisibleX toMaxX:maximumVisibleX];
}


#pragma mark -
#pragma mark Label Tiling

- (UIImageView *)insertImage {
    UIImageView *image = [[[UIImageView alloc] initWithFrame:CGRectMake(0, 0,315,300)] autorelease];
    image.image = [UIImage imageNamed:@"3.png"];
    [labelContainerView addSubview:image];

    return image;
}

- (CGFloat)placeNewLabelOnRight:(CGFloat)rightEdge {
    UIImageView *image = [self insertImage];
    [visibleLabels addObject:image];
    
    CGRect frame = [image frame];
    frame.origin.x = rightEdge;
    frame.origin.y = [labelContainerView bounds].size.height - frame.size.height;
    [image setFrame:frame];
        
    return CGRectGetMaxX(frame);
}

- (CGFloat)placeNewLabelOnLeft:(CGFloat)leftEdge {
    UIImageView *image = [self insertImage];
    [visibleLabels insertObject:image atIndex:0];
    CGRect frame = [image frame];
    frame.origin.x = leftEdge - frame.size.width;
    frame.origin.y = [labelContainerView bounds].size.height - frame.size.height;
    [image setFrame:frame];
    
    return CGRectGetMinX(frame);
}

- (void)tileLabelsFromMinX:(CGFloat)minimumVisibleX toMaxX:(CGFloat)maximumVisibleX {

    if ([visibleLabels count] == 0) {
        [self placeNewLabelOnRight:minimumVisibleX];
    }
    
    UIImageView *lastLabel = [visibleLabels lastObject];
    CGFloat rightEdge = CGRectGetMaxX([lastLabel frame]);
    while (rightEdge < maximumVisibleX) {
        rightEdge = [self placeNewLabelOnRight:rightEdge];
    }
    
    UIImageView*firstLabel = [visibleLabels objectAtIndex:0];
    CGFloat leftEdge = CGRectGetMinX([firstLabel frame]);
    while (leftEdge > minimumVisibleX) {
        leftEdge = [self placeNewLabelOnLeft:leftEdge];
    }
    
    lastLabel = [visibleLabels lastObject];
    while ([lastLabel frame].origin.x > maximumVisibleX) {
        [lastLabel removeFromSuperview];
        [visibleLabels removeLastObject];
        lastLabel = [visibleLabels lastObject];
    }
    

    firstLabel = [visibleLabels objectAtIndex:0];
    while (CGRectGetMaxX([firstLabel frame]) < minimumVisibleX) {
        [firstLabel removeFromSuperview];
        [visibleLabels removeObjectAtIndex:0];
        firstLabel = [visibleLabels objectAtIndex:0];
    }
}

@end
