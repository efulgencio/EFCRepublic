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
    Cancion *cancion = (Cancion *)[self.canciones objectAtIndex:posicion];
    [self sendDatos:cancion];
}


- (void)sendDatos:(Cancion *)cancionIn
{
    [self.output updateCancion:cancionIn];
}

@end
