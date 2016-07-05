//
//  NSString+SZAttributeTextSimplify.h
//  SZAttributeTextSimplify
//
//  Created by 陈圣治 on 16/7/5.
//  Copyright © 2016年 陈圣治. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SZAttributeTextSimplifyProtocol.h"

@interface NSString (SZAttributeTextSimplify) <SZAttributeTextSimplifyProtocol>

- (NSString *(^)(NSString *anotherString))sp_append;

@end
