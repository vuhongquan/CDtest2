//
//  ListObject.h
//  ObjectManager
//
//  Created by ios12 on 4/10/13.
//  Copyright (c) 2013 ios12. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Object : NSObject
@property (strong,nonatomic) NSString *kieuMu;
@property (strong,nonatomic) NSString *thongSo;
@property (strong,nonatomic) UIImage *anh;
@property (assign,nonatomic) NSInteger soTien;
@end
