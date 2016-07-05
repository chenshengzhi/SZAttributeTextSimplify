//
//  SZAttributeTextSimplifyProtocol.h
//  SZAttributeTextSimplify
//
//  Created by 陈圣治 on 16/7/5.
//  Copyright © 2016年 陈圣治. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol SZAttributeTextSimplifyProtocol <NSObject>

- (NSAttributedString *(^)(NSDictionary *font))sp_attribute;

- (NSAttributedString *(^)(NSParagraphStyle *paragraph))sp_paragraph;

- (NSAttributedString *(^)(NSTextAlignment alignment))sp_alignment;

- (NSAttributedString *(^)(CGFloat lineSpacing))sp_lineSpacing;

- (NSAttributedString *(^)(NSLineBreakMode lineBreakMode))sp_lineBreakMode;

- (NSAttributedString *(^)(UIFont *font))sp_font;

- (NSAttributedString *(^)(UIColor *color))sp_color;

- (NSAttributedString *(^)(UIColor *color))sp_backgroundColor;

- (NSAttributedString *(^)(CGFloat length))sp_kern;

- (NSAttributedString *(^)(NSUnderlineStyle style, UIColor *color))sp_strikethrough;

- (NSAttributedString *(^)(NSUnderlineStyle style, UIColor *color))sp_underline;

- (NSAttributedString *(^)(CGFloat width))sp_strokeWidth;

- (NSAttributedString *(^)(CGFloat skew))sp_obliqueness;

- (NSAttributedString *(^)(id linkValue))sp_link;

- (NSAttributedString *(^)(NSInteger options))sp_writeDirection;

@end
