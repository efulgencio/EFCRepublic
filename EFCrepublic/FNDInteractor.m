//
//  FNDInteractor.m
//  EFCrepublic
//
//  Created by eduardo fulgencio on 7/12/15.
//  Copyright © 2015 eduardo fulgencio. All rights reserved.
//

#import "FNDInteractor.h"

@interface FNDInteractor()

@property (nonatomic) Cancion *cancion;
@end

@implementation FNDInteractor


- (void)obtenerDatos
{
    [self.output updateCancion:self.cancion];
}

-(void)obtenerDatos:(NSInteger)posicion
{
    self.posicionActual = posicion;
    Cancion *cancion = (Cancion *)[self.canciones objectAtIndex:posicion];
    [self sendDatos:cancion];
}


- (void)sendDatos:(Cancion *)cancionIn
{
    [self.output updateCancion:cancionIn];
}

-(void)siguiente
{
    ++self.posicionActual;
    if(self.posicionActual > (self.canciones.count - 1)) {
        self.posicionActual = 0;
    }
    [self obtenerDatos:self.posicionActual];
}

-(void)anterior
{
    ++self.posicionActual;
    if(self.posicionActual < 0) {
        self.posicionActual = self.canciones.count - 1;
    }
    [self obtenerDatos:self.posicionActual];
   
}

@end
