//
//  NSString+SZAttributeTextSimplify.m
//  SZAttributeTextSimplify
//
//  Created by 陈圣治 on 16/7/5.
//  Copyright © 2016年 陈圣治. All rights reserved.
//

#import "NSString+SZAttributeTextSimplify.h"

@implementation NSString (SZAttributeTextSimplify)

- (NSString *(^)(NSString *anotherString))sp_append {
    return ^id(NSString *anotherString) {
        return [[NSString alloc] initWithFormat:@"%@%@", self, anotherString];
    };
}

- (NSMutableDictionary *)sp_defaultAttribute {
    return [@{
              NSFontAttributeName: [UIFont systemFontOfSize:15],
              NSForegroundColorAttributeName: [UIColor blackColor]
              } mutableCopy];
}

#pragma mark - SZAttributeTextSimplifyProtocol -
- (NSAttributedString *(^)(NSDictionary *attr))sp_attribute {
    return ^id(NSDictionary *attr) {
        return [[NSAttributedString alloc] initWithString:self attributes:attr];
    };
}

- (NSAttributedString *(^)(NSParagraphStyle *paragraph))sp_paragraph {
    return ^id(NSParagraphStyle *paragraph) {
        NSMutableDictionary *attr = [self sp_defaultAttribute];
        attr[NSParagraphStyleAttributeName] = paragraph;
        return [[NSAttributedString alloc] initWithString:self attributes:attr];
    };
}

- (NSAttributedString *(^)(NSTextAlignment alignment))sp_alignment {
    return ^id(NSTextAlignment alignment) {
        NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
        paragraph.alignment = alignment;
        NSMutableDictionary *attr = [self sp_defaultAttribute];
        attr[NSParagraphStyleAttributeName] = paragraph;
        return [[NSAttributedString alloc] initWithString:self attributes:attr];
    };
}

- (NSAttributedString *(^)(CGFloat lineSpacing))sp_lineSpacing {
    return ^id(CGFloat lineSpacing) {
        NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
        paragraph.lineSpacing = lineSpacing;
        NSMutableDictionary *attr = [self sp_defaultAttribute];
        attr[NSParagraphStyleAttributeName] = paragraph;
        return [[NSAttributedString alloc] initWithString:self attributes:attr];
    };
}

- (NSAttributedString *(^)(NSLineBreakMode lineBreakMode))sp_lineBreakMode {
    return ^id(NSLineBreakMode lineBreakMode) {
        NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
        paragraph.lineBreakMode = lineBreakMode;
        NSMutableDictionary *attr = [self sp_defaultAttribute];
        attr[NSParagraphStyleAttributeName] = paragraph;
        return [[NSAttributedString alloc] initWithString:self attributes:attr];
    };
}

- (NSAttributedString *(^)(UIFont *font))sp_font {
    return ^id(UIFont *font) {
        NSMutableDictionary *attr = [self sp_defaultAttribute];
        attr[NSFontAttributeName] = font;
        return [[NSAttributedString alloc] initWithString:self attributes:attr];
    };
}

- (NSAttributedString *(^)(UIColor *color))sp_color {
    return ^id(UIColor *color) {
        NSMutableDictionary *attr = [self sp_defaultAttribute];
        attr[NSForegroundColorAttributeName] = color;
        return [[NSAttributedString alloc] initWithString:self attributes:attr];
    };
}

- (NSAttributedString *(^)(UIColor *color))sp_backgroundColor {
    return ^id(UIColor *color) {
        NSMutableDictionary *attr = [self sp_defaultAttribute];
        attr[NSBackgroundColorAttributeName] = color;
        return [[NSAttributedString alloc] initWithString:self attributes:attr];
    };
}

- (NSAttributedString *(^)(CGFloat length))sp_kern {
    return ^(CGFloat length) {
        NSMutableDictionary *attr = [self sp_defaultAttribute];
        attr[NSKernAttributeName] = @(length);
        return [[NSAttributedString alloc] initWithString:self attributes:attr];
    };
}

- (NSAttributedString *(^)(NSUnderlineStyle style, UIColor *color))sp_strikethrough {
    return ^id(NSUnderlineStyle style, UIColor *color) {
        NSMutableDictionary *attr = [self sp_defaultAttribute];
        attr[NSStrikethroughStyleAttributeName] = @(style);
        if (color) {
            attr[NSStrikethroughColorAttributeName] = color;
        }
        return [[NSAttributedString alloc] initWithString:self attributes:attr];
    };
}

- (NSAttributedString *(^)(NSUnderlineStyle style, UIColor *color))sp_underline {
    return ^id(NSUnderlineStyle style, UIColor *color) {
        NSMutableDictionary *attr = [self sp_defaultAttribute];
        attr[NSUnderlineStyleAttributeName] = @(style);
        if (color) {
            attr[NSUnderlineColorAttributeName] = color;
        }
        return [[NSAttributedString alloc] initWithString:self attributes:attr];
    };
}

- (NSAttributedString *(^)(CGFloat width))sp_strokeWidth {
    return ^id(CGFloat width) {
        NSMutableDictionary *attr = [self sp_defaultAttribute];
        attr[NSStrokeWidthAttributeName] = @(width);
        return [[NSAttributedString alloc] initWithString:self attributes:attr];
    };
}

- (NSAttributedString *(^)(CGFloat skew))sp_obliqueness {
    return ^id(CGFloat skew) {
        NSMutableDictionary *attr = [self sp_defaultAttribute];
        attr[NSObliquenessAttributeName] = @(skew);
        return [[NSAttributedString alloc] initWithString:self attributes:attr];
    };
}

- (NSAttributedString *(^)(id linkValue))sp_link {
    return ^id(id linkValue) {
        NSAssert([linkValue isKindOfClass:[NSURL class]] || [linkValue isKindOfClass:[NSString class]], @"should be NSURL or NSString");
        NSMutableDictionary *attr = [self sp_defaultAttribute];
        attr[NSLinkAttributeName] = linkValue;
        return [[NSAttributedString alloc] initWithString:self attributes:attr];
    };
}

- (NSAttributedString *(^)(NSInteger options))sp_writeDirection {
    return ^id(NSInteger options) {
        NSMutableDictionary *attr = [self sp_defaultAttribute];
        attr[NSWritingDirectionAttributeName] = @[@(options)];
        return [[NSAttributedString alloc] initWithString:self attributes:attr];
    };
}

@end
