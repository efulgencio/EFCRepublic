//
//  ViewPresenter.h
//  ColoreaEFC
//
//  Created by eduardo fulgencio on 27/11/15.
//  Copyright © 2015 eduardo fulgencio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "InteractorIO.h"
#import "View.h"
#import "ListWireFrame.h"
#import "ListViewInterface.h"

@interface Presenter : NSObject <InteractorOutput>

@property(nonatomic, weak) id<View>                 view;

@property(nonatomic, strong) id<InteractorInput>    interactor;
@property (nonatomic, strong) ListWireframe *listWireframe;


@property (nonatomic, strong) UIViewController<ListViewInterface> *userInterface;

//-(void)updateDatos:(NSArray *)datos;
-(void)obtenerDatos;

@end
