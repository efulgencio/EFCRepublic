//
//  FNDPresenter.m
//  EFCrepublic
//
//  Created by eduardo fulgencio on 7/12/15.
//  Copyright © 2015 eduardo fulgencio. All rights reserved.
//

#import "FNDPresenter.h"
#import "FNDViewInterface.h"

@implementation FNDPresenter

- (void)configureUserInterfaceForPresentation:(id<FNDViewInterface>) fndUserInterface
{
    // Aquí puedo asignar los datos
    [fndUserInterface setMinimumDueDate:[NSDate date]];
}

-(void) obtenerDatos:(NSInteger)posicion
{
    [self.interactor obtenerDatos:posicion];
}

-(void) updateCancion:(Cancion *)cancion
{
    [self.view cargaCancion:cancion];
}

-(void) siguiente
{
    [self.interactor siguiente];
}

-(void) anterior
{
    [self.interactor anterior];
}


@end
