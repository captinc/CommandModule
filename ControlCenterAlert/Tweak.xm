#import "../NSTask.h"

@interface CCUIModuleCollectionViewController : UIViewController
- (void)viewDidLoad;
- (void)dealloc;
- (void)startCommandModule:(NSNotification *)notification;
@end

%hook CCUIModuleCollectionViewController
- (void)viewDidLoad {
    %orig;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(startCommandModule:) name:@"com.captinc.commandmodule.showCCAlert" object:nil];
}

- (void)dealloc {
    %orig;
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
%new
- (void)startCommandModule:(NSNotification *)notification { //this method is run upon receiving the notification that the user invoked my tweak
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"CommandModule" message:@"Running script...." preferredStyle:UIAlertControllerStyleAlert];
    
    if (@available(iOS 13, *)) { //for some reason, Control Center does not update its traitCollection with iOS 13's dark mode, so I have to manually make my alert dark if necessary
        UIWindow *sb;
        NSArray *windows = [(UIApplication *)[[UIApplication sharedApplication] delegate] windows];
        for (UIWindow *win in windows) {
            if ([win isKindOfClass:%c(SBHomeScreenWindow)]) {
                sb = win;
                break;
            }
        }
        if (sb.traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark) {
            alert.overrideUserInterfaceStyle = UIUserInterfaceStyleDark;
        }
    }
    
    [self presentViewController:alert animated:YES completion:^{
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void) { //must dispatch_async so the UI doesn't freeze while the script is running
            NSTask *task = [[NSTask alloc] init];
            task.launchPath = @"/usr/bin/commandmoduled";
            [task launch];
            [task waitUntilExit];

            dispatch_sync(dispatch_get_main_queue(), ^{ //once the script is finished, update the UI
                [alert dismissViewControllerAnimated:YES completion:nil];
            });
        });
    }];
}
%end
