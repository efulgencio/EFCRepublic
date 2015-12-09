//
//  EFCViewController.h
//  ColoreaEFC
//
//  Created by eduardo fulgencio on 27/11/15.
//  Copyright © 2015 eduardo fulgencio. All rights reserved.
//


#import "ListWireframe.h"

#import "Presenter.h"
#import "EFCViewController.h"
#import "RootWireframe.h"




static NSString *ListViewControllerIdentifier = @"ListViewController";

@interface ListWireframe ()

@property (nonatomic, strong) EFCViewController *listViewController;

@end

@implementation ListWireframe

- (void)presentListInterfaceFromWindow:(UIWindow *)window
{
    EFCViewController *listViewController = [self listViewControllerFromStoryboard];
    self.presenter.userInterface = listViewController;
    self.listViewController = listViewController;
    
    [self.rootWireframe showRootViewController:listViewController  inWindow:window];
}


- (void)presentAddInterface
{
  //  [self.fndWireframe presentAddInterfaceFromViewController:self.listViewController];
}


- (EFCViewController *)listViewControllerFromStoryboard
{
    UIStoryboard *storyboard = [self mainStoryboard];
    EFCViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:ListViewControllerIdentifier];
    
    return viewController;
}


- (UIStoryboard *)mainStoryboard
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main"  bundle:[NSBundle mainBundle]];
    
    return storyboard;
}

@end
