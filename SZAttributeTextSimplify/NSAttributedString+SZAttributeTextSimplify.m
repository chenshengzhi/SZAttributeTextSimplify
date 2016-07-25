//
//  NSAttributedString+SZAttributeTextSimplify.m
//  SZAttributeTextSimplify
//
//  Created by 陈圣治 on 16/7/5.
//  Copyright © 2016年 陈圣治. All rights reserved.
//

#import "NSAttributedString+SZAttributeTextSimplify.h"

@implementation NSAttributedString (SZAttributeTextSimplify)

- (NSAttributedString *(^)(NSAttributedString *attributedString))sp_append {
    return ^id(NSAttributedString *attributedString) {
        if (attributedString) {
            NSMutableAttributedString *mutableAttrText = [self mutableCopy];
            [mutableAttrText appendAttributedString:attributedString];
            return mutableAttrText;
        } else {
            return self;
        }
    };
}

- (NSAttributedString *(^)(NSString *text))sp_appendText {
    return ^id(NSString *text) {
        NSMutableAttributedString *mutableAttrText = [self mutableCopy];
        [mutableAttrText appendAttributedString:[[NSAttributedString alloc] initWithString:text]];
        return mutableAttrText;
    };
}

#pragma mark - SZAttributeTextSimplifyProtocol -
- (NSAttributedString *(^)(NSDictionary *attr))sp_attribute {
    return ^id(NSDictionary *attr) {
        return [[NSAttributedString alloc] initWithString:self.string attributes:attr];
    };
}

- (NSAttributedString *(^)(NSParagraphStyle *paragraph))sp_paragraph {
    return ^id(NSParagraphStyle *paragraph) {
        NSMutableAttributedString *mutableAttrText = [self mutableCopy];
        [mutableAttrText addAttribute:NSParagraphStyleAttributeName
                                value:paragraph
                                range:NSMakeRange(0, self.string.length)];
        return mutableAttrText;
    };
}

- (NSAttributedString *(^)(NSTextAlignment alignment))sp_alignment {
    return ^id(NSTextAlignment alignment) {
        NSMutableAttributedString *mutableAttrText = [self mutableCopy];
        NSMutableParagraphStyle *paragraph = [[mutableAttrText attribute:NSParagraphStyleAttributeName
                                                                 atIndex:0
                                                          effectiveRange:nil] mutableCopy];
        if (!paragraph) {
            paragraph = [[NSMutableParagraphStyle alloc] init];
        }
        paragraph.alignment = alignment;
        [mutableAttrText addAttribute:NSParagraphStyleAttributeName
                                value:paragraph
                                range:NSMakeRange(0, self.string.length)];
        return mutableAttrText;
    };
}

- (NSAttributedString *(^)(CGFloat lineSpacing))sp_lineSpacing {
    return ^id(CGFloat lineSpacing) {
        NSMutableAttributedString *mutableAttrText = [self mutableCopy];
        NSMutableParagraphStyle *paragraph = [[mutableAttrText attribute:NSParagraphStyleAttributeName
                                                                 atIndex:0
                                                          effectiveRange:nil] mutableCopy];
        if (!paragraph) {
            paragraph = [[NSMutableParagraphStyle alloc] init];
        }
        paragraph.lineSpacing = lineSpacing;
        [mutableAttrText addAttribute:NSParagraphStyleAttributeName
                                value:paragraph
                                range:NSMakeRange(0, self.string.length)];
        return mutableAttrText;
    };
}

- (NSAttributedString *(^)(NSLineBreakMode lineBreakMode))sp_lineBreakMode {
    return ^id(NSLineBreakMode lineBreakMode) {
        NSMutableAttributedString *mutableAttrText = [self mutableCopy];
        NSMutableParagraphStyle *paragraph = [[mutableAttrText attribute:NSParagraphStyleAttributeName
                                                                 atIndex:0
                                                          effectiveRange:nil] mutableCopy];
        if (!paragraph) {
            paragraph = [[NSMutableParagraphStyle alloc] init];
        }
        paragraph.lineBreakMode = lineBreakMode;
        [mutableAttrText addAttribute:NSParagraphStyleAttributeName
                                value:paragraph
                                range:NSMakeRange(0, self.string.length)];
        return mutableAttrText;
    };
}

- (NSAttributedString *(^)(UIFont *font))sp_font {
    return ^id(UIFont *font) {
        NSMutableAttributedString *mutableAttrText = [self mutableCopy];
        [mutableAttrText addAttribute:NSFontAttributeName
                                value:font
                                range:NSMakeRange(0, self.string.length)];
        return mutableAttrText;
    };
}

- (NSAttributedString *(^)(UIColor *color))sp_color {
    return ^id(UIColor *color) {
        NSMutableAttributedString *mutableAttrText = [self mutableCopy];
        [mutableAttrText addAttribute:NSForegroundColorAttributeName
                                value:color
                                range:NSMakeRange(0, self.string.length)];
        return mutableAttrText;
    };
}

- (NSAttributedString *(^)(UIColor *color))sp_backgroundColor {
    return ^id(UIColor *color) {
        NSMutableAttributedString *mutableAttrText = [self mutableCopy];
        [mutableAttrText addAttribute:NSBackgroundColorAttributeName
                                value:color
                                range:NSMakeRange(0, self.string.length)];
        return mutableAttrText;
    };
}

- (NSAttributedString *(^)(CGFloat length))sp_kern {
    return ^id(CGFloat length) {
        NSMutableAttributedString *mutableAttrText = [self mutableCopy];
        [mutableAttrText addAttribute:NSStrokeWidthAttributeName
                                value:@(length)
                                range:NSMakeRange(0, self.string.length)];
        return mutableAttrText;
    };
}

- (NSAttributedString *(^)(NSUnderlineStyle style, UIColor *color))sp_strikethrough {
    return ^id(NSUnderlineStyle style, UIColor *color) {
        NSMutableAttributedString *mutableAttrText = [self mutableCopy];
        [mutableAttrText addAttribute:NSStrikethroughStyleAttributeName
                                value:@(style)
                                range:NSMakeRange(0, self.string.length)];
        if (color) {
            [mutableAttrText addAttribute:NSStrikethroughColorAttributeName
                                    value:color
                                    range:NSMakeRange(0, self.string.length)];
        }
        return mutableAttrText;
    };
}

- (NSAttributedString *(^)(NSUnderlineStyle style, UIColor *color))sp_underline {
    return ^id(NSUnderlineStyle style, UIColor *color) {
        NSMutableAttributedString *mutableAttrText = [self mutableCopy];
        [mutableAttrText addAttribute:NSUnderlineStyleAttributeName
                                value:@(style)
                                range:NSMakeRange(0, self.string.length)];
        if (color) {
            [mutableAttrText addAttribute:NSUnderlineColorAttributeName
                                    value:color
                                    range:NSMakeRange(0, self.string.length)];
        }
        return mutableAttrText;
    };
}

- (NSAttributedString *(^)(CGFloat width))sp_strokeWidth {
    return ^id(CGFloat width) {
        NSMutableAttributedString *mutableAttrText = [self mutableCopy];
        [mutableAttrText addAttribute:NSStrokeWidthAttributeName
                                value:@(width)
                                range:NSMakeRange(0, self.string.length)];
        return mutableAttrText;
    };
}

- (NSAttributedString *(^)(CGFloat skew))sp_obliqueness {
    return ^id(CGFloat skew) {
        NSMutableAttributedString *mutableAttrText = [self mutableCopy];
        [mutableAttrText addAttribute:NSObliquenessAttributeName
                                value:@(skew)
                                range:NSMakeRange(0, self.string.length)];
        return mutableAttrText;
    };
}

- (NSAttributedString *(^)(id linkValue))sp_link {
    return ^id(id linkValue) {
        NSMutableAttributedString *mutableAttrText = [self mutableCopy];
        [mutableAttrText addAttribute:NSLinkAttributeName
                                value:linkValue
                                range:NSMakeRange(0, self.string.length)];
        return mutableAttrText;
    };
}

- (NSAttributedString *(^)(NSInteger options))sp_writeDirection {
    return ^id(NSInteger options) {
        NSMutableAttributedString *mutableAttrText = [self mutableCopy];
        [mutableAttrText addAttribute:NSWritingDirectionAttributeName
                                value:@[@(options)]
                                range:NSMakeRange(0, self.string.length)];
        return mutableAttrText;
    };
}

@end
