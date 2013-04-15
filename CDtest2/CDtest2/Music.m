//
//  Music.m
//  CDtest2
//
//  Created by iOS12 on 3/28/13.
//  Copyright (c) 2013 Techmaster. All rights reserved.
//

#import "Music.h"

@implementation Music
+(NSString *) fullnameBand:(NSString *)shortname{
    NSDictionary * fullname = @{@"ab":@"ABBA",@"gg":@"GirlGeneration",@"lk":@"Laddy Killer"};
    return [fullname valueForKey:shortname];
}
+(NSString *) birthWith:(NSString *)fullnameBand{
    NSDictionary * birth = @{@"ab": @"1966",@"gg":@"2001",@"lk":@"1997"};
    return [birth valueForKey:fullnameBand];
}
+(NSString *) memWith:(NSString *)fullnameBand{
    NSDictionary * mem = @{@"ab":@"Ulvaeus,Benny Andersson",@"gg":@"Yoona,Kiyeon,Sunny,Hyeon",@"lk":@"Mr.A,Mr.T,Yanbi,justatee"};
    return [mem valueForKey:fullnameBand];
}
+(NSString *) cdAlbumsWith:(NSString *)fullnameBand{
    NSDictionary * cd = @{@"ab":@"The Singles",@"gg":@"The Boys",@"lk":@"Lk collection"};
    return [cd valueForKey:fullnameBand];
}
+(NSString *) imageWith:(NSString *)fullnameBand{
    NSDictionary * image = @{@"ab":@"Unknown",@"gg":@"pick1",@"lk":@"pick2"
};
    return [image valueForKey:fullnameBand];
}
+(NSString *) songWith:(NSString *)shortnameBand{
    NSDictionary * songWithAlbum = @{@"ab":@"Happy New Year,Money Money,Sorry...",@"gg":@"I got a boy,The boy,Gee,Oh...",@"lk":@"Forever alone,She neva know,Thu Ha Noi....."};
    return [songWithAlbum valueForKey:shortnameBand];
}
@end
