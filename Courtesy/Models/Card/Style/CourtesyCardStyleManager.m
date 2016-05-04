//
//  CourtesyCardStyleManager.m
//  Courtesy
//
//  Created by Zheng on 3/14/16.
//  Copyright © 2016 82Flex. All rights reserved.
//

#import "CourtesyCardStyleManager.h"

@implementation CourtesyCardStyleManager

+ (id)sharedManager {
    static CourtesyCardStyleManager *sharedManager = nil;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        sharedManager = [[self alloc] init];
    });
    
    return sharedManager;
}

- (CourtesyCardStyleModel *)styleWithID:(CourtesyCardStyleID)styleID {
    if (styleID == kCourtesyCardStyleDefault) {
        CourtesyCardStyleModel *newStyle = [CourtesyCardStyleModel new];
        
        newStyle.cardBorderColor = [UIColor coolGrayColor];
        
        newStyle.statusBarColor = [UIColor blackColor];
        newStyle.buttonTintColor = [UIColor whiteColor];
        newStyle.buttonBackgroundColor = [UIColor blackColor];
        
        newStyle.toolbarColor = [UIColor whiteColor];
        newStyle.toolbarBarTintColor = [UIColor whiteColor];
        newStyle.toolbarTintColor = [UIColor grayColor];
        newStyle.toolbarHighlightColor = [UIColor blueberryColor];
        
        newStyle.cardTextColor = [UIColor darkGrayColor];
        newStyle.cardLineSpacing = 8.0;
        newStyle.cardBackgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"texture"]];
        newStyle.cardLineHeight = 32.0;
        newStyle.placeholderText = @"说点什么吧……";
        newStyle.placeholderColor = [UIColor lightGrayColor];
        newStyle.indicatorColor = [UIColor darkGrayColor];
        
        newStyle.cardTitleFontSize = 12.0;
        newStyle.dateLabelTextColor = [UIColor darkGrayColor];
        newStyle.standardAlpha = 0.618;
        
        newStyle.cardElementBackgroundColor = [UIColor whiteColor];
        newStyle.cardElementTintColor = [UIColor darkGrayColor];
        newStyle.cardElementTintFocusColor = [UIColor grayColor];
        newStyle.cardElementTextColor = [UIColor darkGrayColor];
        newStyle.cardElementShadowColor = [UIColor blackColor];
        
        newStyle.defaultAnimationDuration = 0.5;
        newStyle.cardCreateTimeFormat = @"yy年LLLd日 EEEE ah:mm";
        newStyle.maxAudioNum = 3;
        newStyle.maxVideoNum = 3;
        newStyle.maxImageNum = 20;
        newStyle.maxContentLength = 4096;
        
        newStyle.headerFontSize = [NSNumber numberWithFloat:20.0];
        newStyle.controlTextColor = [UIColor magicColor];
        newStyle.headerTextColor = [UIColor blackColor];
        newStyle.inlineTextColor = newStyle.cardTextColor;
        newStyle.codeTextColor = newStyle.cardTextColor;
        newStyle.linkTextColor = [UIColor blueberryColor];
        
        newStyle.jotColorArray = @[];
        return newStyle;
    }
    return nil;
}

@end
