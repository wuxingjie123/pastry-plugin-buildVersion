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
    NSString *buildPath = [[NSBundle mainBundle] pathForResource:@"buildVersion.bundle/files/build.json" ofType:nil];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:buildPath]) {
        
        NSData *jsonData = [NSData dataWithContentsOfFile:buildPath];
        NSDictionary *buildJson = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:nil];
        NSString *buildStr = @"";
        for (NSString *key in buildJson.allKeys) {
            
            buildStr = [buildStr stringByAppendingFormat:@"%@:", key];
            NSString *value = buildJson[key];
            buildStr = [buildStr stringByAppendingFormat:@"%@ ",value];
        }
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:buildStr delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [alert show];
    }
    else {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"此版本非Jenkins构建安装包" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [alert show];
    }
}

@end
