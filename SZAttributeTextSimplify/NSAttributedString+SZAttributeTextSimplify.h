//
//  NSAttributedString+SZAttributeTextSimplify.h
//  SZAttributeTextSimplify
//
//  Created by 陈圣治 on 16/7/5.
//  Copyright © 2016年 陈圣治. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SZAttributeTextSimplifyProtocol.h"

@interface NSAttributedString (SZAttributeTextSimplify) <SZAttributeTextSimplifyProtocol>

- (NSAttributedString *(^)(NSAttributedString *attributedString))sp_append;

- (NSAttributedString *(^)(NSString *text))sp_appendText;

@end
