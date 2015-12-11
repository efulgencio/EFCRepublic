//
//  FNDPresenter.h
//  EFCrepublic
//
//  Created by eduardo fulgencio on 7/12/15.
//  Copyright © 2015 eduardo fulgencio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FNDViewInterface.h"
#import "FNDView.h"

@interface FNDPresenter : NSObject <FNDInteractorOutput>

@property(nonatomic, weak) id<FNDView>  view;
@property(nonatomic, strong) id<FNDInteractorInput>    interactor;


- (void)configureUserInterfaceForPresentation:(id<FNDViewInterface>) fndUserInterface;
- (void)obtenerDatos:(NSInteger)posicion;

@end
