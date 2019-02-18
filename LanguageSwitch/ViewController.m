//
//  ViewController.m
//  LanguageSwitch
//
//  Created by bingo on 2019/2/15.
//  Copyright © 2019 bingo. All rights reserved.
//

#import "ViewController.h"
#import "CSLanguageManager.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupUI];
}

#pragma mark - private methods
- (void)setupUI {
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *switchButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 200, 100)];
    switchButton.center = self.view.center;
    switchButton.backgroundColor = [UIColor greenColor];
    [switchButton setTitle:CSLanguageString(@"changeLanguageTitle") forState:UIControlStateNormal];
    [switchButton addTarget:self action:@selector(switchLanguage:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:switchButton];
    
}

#pragma mark - events

- (void)switchLanguage:(UIButton *)sender {
    NSString *sheetTitle = CSLanguageString(@"changeLanguageTitle");
    NSString *firstSelection = CSLanguageString(@"english");
    NSString *scondSelection = CSLanguageString(@"chinese");
    NSString *cancelTitle = CSLanguageString(@"cancelTitle");
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:sheetTitle message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:firstSelection style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [CSLanguageManager switchToLanuageMode:CSLanguageModeEnglish];
        [self refreshTitles];
    }];
    
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:scondSelection style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [CSLanguageManager switchToLanuageMode:CSLanguageModeChinese];
        [self refreshTitles];
    }];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    [alert addAction:action1];
    [alert addAction:action2];
    [alert addAction:cancelAction];
    
    [self presentViewController:alert animated:YES completion:nil];
}


#pragma mark - 中英文切换
- (void)refreshTitles {
    [self.view.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[UIButton class]]) {
            UIButton *sender = (UIButton *)obj;
            [sender setTitle:CSLanguageString(@"changeLanguageTitle") forState:UIControlStateNormal];
        }
    }];
    
    // 或者发送通知其他页面刷新
}

@end
