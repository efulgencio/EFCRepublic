#import "RootWireframe.h"

@implementation RootWireframe

- (void)showRootViewController:(UIViewController *)viewController inWindow:(UIWindow *)window
{
    UINavigationController *navigationController = [self navigationControllerFromWindow:window];
    navigationController.viewControllers = @[viewController];
}


- (UINavigationController *)navigationControllerFromWindow:(UIWindow *)window
{
    UINavigationController *navigationController = (UINavigationController *)[window rootViewController];    
    return navigationController;
}

@end
