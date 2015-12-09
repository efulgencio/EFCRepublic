//
//  EFCViewController.h
//  ColoreaEFC
//
//  Created by eduardo fulgencio on 27/11/15.
//  Copyright © 2015 eduardo fulgencio. All rights reserved.
//


#import <Foundation/Foundation.h>

@class FNDWireframe;
@class Presenter;
@class EFCViewController;
@class RootWireframe;

@interface ListWireframe : NSObject

@property (nonatomic, strong) FNDWireframe *fndWireframe;
@property (nonatomic, strong) Presenter *presenter;
@property (nonatomic, strong) RootWireframe *rootWireframe;

- (void)presentListInterfaceFromWindow:(UIWindow *)window;
- (void)presentAddInterface;

@end
