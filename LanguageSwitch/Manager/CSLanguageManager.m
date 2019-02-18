//
//  CSLanguageManager.m
//  CheapShip
//
//  Created by bingo on 2018/10/2.
//  Copyright © 2018年 cheapship. All rights reserved.
//

#import "CSLanguageManager.h"


NSString *const kAppLanusgeModeKey = @"AppLanguageMode";

@implementation CSLanguageManager

+ (void)switchToLanuageMode:(CSLanguageMode)languageMode {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:languageMode forKey:kAppLanusgeModeKey];
    [defaults synchronize];
}

+ (CSLanguageMode)getCurrentLanguageMode {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    CSLanguageMode mode = [defaults integerForKey:kAppLanusgeModeKey];
    return mode;
}


+ (NSString *)stringForKey:(NSString *)key {
    NSString *lanuageStrings = [self getCurrentLanguageMode] == CSLanguageModeChinese ? @"ChineseStrings" : @"EnglishStrings";
    NSString *lanuagePath = [[NSBundle mainBundle] pathForResource:lanuageStrings ofType:@"plist"];
    NSDictionary *languageDict = [[NSDictionary alloc] initWithContentsOfFile:lanuagePath];
    return [languageDict objectForKey:key];
}


@end
