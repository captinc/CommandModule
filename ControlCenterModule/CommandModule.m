#import <ControlCenterUIKit/CCUIToggleModule.h>

@interface CommandModule : CCUIToggleModule
- (UIImage *)iconGlyph;
- (void)setSelected:(BOOL)selected;
@end

@implementation CommandModule
- (UIImage *)iconGlyph {
    return [UIImage imageNamed:@"ModuleIcon" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil];
}

- (void)setSelected:(BOOL)selected {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"com.captinc.commandmodule.run" object:nil];
}
@end
