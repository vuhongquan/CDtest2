//
//  Music.h
//  CDtest2
//
//  Created by iOS12 on 3/28/13.
//  Copyright (c) 2013 Techmaster. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Music : NSObject
+(NSString *) fullnameBand : (NSString *) shortname;
+(NSString *) cdAlbumsWith : (NSString *) fullnameBand;
+(NSString *) birthWith    : (NSString *) fullnameBand;
+(NSString *) memWith      : (NSString *) fullnameBand;
+(NSString *) imageWith    : (NSString *) fullnameBand;
+(NSString *) songWith     : (NSString *) fullnameBand;
@end