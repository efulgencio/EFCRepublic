//
// VTDAddWireframe.m
//
// Copyright (c) 2014 Mutual Mobile (http://www.mutualmobile.com/)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "FNDWireframe.h"

#import "FNDPresenter.h"
#import "FNDViewController.h"


static NSString *FNDViewControllerIdentifier = @"FNDViewController";

@interface FNDWireframe () <UIViewControllerTransitioningDelegate>

@property (nonatomic, strong) UIViewController *presentedViewController;

@end

@implementation FNDWireframe

- (void)presentFndInterfaceFromViewController:(UIViewController *)viewController
{
    FNDViewController *fndViewController = [self fndViewController];
  //  fndViewController.eventHandler = self.fndPresenter;
   // addViewController.modalPresentationStyle = UIModalPresentationCustom;
  //  addViewController.transitioningDelegate = self;

    [self.fndPresenter configureUserInterfaceForPresentation:fndViewController];

    [viewController presentViewController:fndViewController animated:YES completion:nil];
    
    self.presentedViewController = viewController;
}


- (void)dismissFndInterface
{
  //   [self.presentedViewController dismissViewControllerAnimated:YES completion:nil];
}


- (FNDViewController *)fndViewController
{
    UIStoryboard *storyboard = [self mainStoryboard];
    FNDViewController *addViewController = [storyboard instantiateViewControllerWithIdentifier:FNDViewControllerIdentifier];
    
    return addViewController;
}


- (UIStoryboard *)mainStoryboard
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main"
                                                         bundle:[NSBundle mainBundle]];
    
    return storyboard;
}


#pragma mark - UIViewControllerTransitioningDelegate Methods

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
  //  return [[VTDAddDismissalTransition alloc] init];
    return nil;
}


- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented
                                                                  presentingController:(UIViewController *)presenting
                                                                      sourceController:(UIViewController *)source
{
    //return [[VTDAddPresentationTransition alloc] init];
    return nil;
}

@end
