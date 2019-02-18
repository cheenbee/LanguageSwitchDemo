//
//  CSLanguageManager.h
//  CheapShip
//
//  Created by bingo on 2018/10/2.
//  Copyright © 2018年 cheapship. All rights reserved.
//

#import <Foundation/Foundation.h>

#define CSLanguageString(key) \
[CSLanguageManager stringForKey:key]

typedef NS_ENUM(NSInteger, CSLanguageMode) {
    CSLanguageModeChinese,           // Displays Chinese
    CSLanguageModeEnglish,           // Displays English
};

static NSString *kAppSwitchLanguageNotificationName = @"AppSwitchLanguageNotification";

@interface CSLanguageManager : NSObject

+ (void)switchToLanuageMode:(CSLanguageMode)languageMode;

+ (NSString *)stringForKey:(NSString *)key;

@end
