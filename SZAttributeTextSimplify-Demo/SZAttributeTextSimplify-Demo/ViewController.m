//
//  ViewController.m
//  SZAttributeTextSimplify-Demo
//
//  Created by 陈圣治 on 16/7/5.
//  Copyright © 2016年 陈圣治. All rights reserved.
//

#import "ViewController.h"
#import "SZAttributeTextSimplify.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSAttributedString *big = @" 红色大字 ".sp_font([UIFont systemFontOfSize:20]).sp_color([UIColor redColor]);
    NSAttributedString *backgroundColor = @" 黄色背景 ".sp_backgroundColor([UIColor yellowColor]);
    NSAttributedString *strikethrough = @" 红色删除线 ".sp_strikethrough(NSUnderlineStyleSingle, [UIColor redColor]);
    NSAttributedString *underline = @" 红色底线 ".sp_underline(NSUnderlineStyleSingle, [UIColor redColor]);
    NSAttributedString *stroke = @" 我是空心字 ".sp_strokeWidth(3).sp_font([UIFont systemFontOfSize:40]);
    NSAttributedString *obliqueness = @" 我是斜体字 ".sp_obliqueness(0.5);
    NSAttributedString *wordWrapping = @" This is NSAttributedString NSAttributedString NSAttributedString ".sp_lineBreakMode(NSLineBreakByWordWrapping);
    NSAttributedString *link = @" 我是链接 ".sp_link(@"http://www.baidu.com");

    NSAttributedString *attributedStrinig = (big
                                             .sp_append(backgroundColor)
                                             .sp_append(strikethrough)
                                             .sp_append(underline)
                                             .sp_append(stroke)
                                             .sp_append(wordWrapping)
                                             .sp_append(obliqueness));

    self.label.attributedText = attributedStrinig;

    self.textView.editable = NO;
    self.textView.selectable = YES;
    self.textView.attributedText = (attributedStrinig
                                    .sp_append(link)
                                    .sp_writeDirection(NSWritingDirectionRightToLeft|NSWritingDirectionOverride)
                                    .sp_alignment(NSTextAlignmentRight)
                                    .sp_lineSpacing(50));
}

@end
