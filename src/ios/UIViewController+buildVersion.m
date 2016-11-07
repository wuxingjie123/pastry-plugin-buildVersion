//
//  UIViewController+buildVersion.m
//  ChinaLife
//
//  Created by 董阳阳 on 16/11/4.
//
//

#import "UIViewController+buildVersion.h"

@implementation UIViewController (buildVersion)


- (void)showShakeView
{
    
#ifdef DEBUG
    
    [UIApplication sharedApplication].applicationSupportsShakeToEdit = YES;
    [self becomeFirstResponder];
#else
#endif
    
}


#pragma mark - 摇一摇相关方法
- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    
}

- (void)motionCancelled:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *current_Version = [infoDictionary objectForKey:@"CFBundleVersion"];
    NSString *mStr = [NSString stringWithFormat:@"当前版本号：%@", current_Version];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:mStr delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
    [alert show];
}

@end
