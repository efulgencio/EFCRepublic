//
//  AppDelegate.m
//  EFCrepublic
//
//  Created by eduardo fulgencio on 4/12/15.
//  Copyright © 2015 eduardo fulgencio. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate



- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    [self createScreen];
    
    [self.window makeKeyAndVisible];
    
    return YES;
}


- (void)createScreen
{
    // BUSQUEDA configuración
    
    EFCViewController* efcView = [[EFCViewController alloc] init];
    Presenter *presenter = [[Presenter alloc] init];
    Interactor *interactor = [[Interactor alloc] init];
    ListWireframe *listWireframe = [[ListWireframe alloc] init];
    RootWireframe  *rootWireframe = [[RootWireframe alloc] init];
    
    efcView.presenter = presenter;
    presenter.view = efcView;
    presenter.listWireframe = listWireframe;
    
    presenter.interactor = interactor;
    interactor.output = presenter;
  
    listWireframe.rootWireframe = rootWireframe;
    
    self.window.rootViewController = efcView;
        
}

@end
