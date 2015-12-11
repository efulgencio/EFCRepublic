//
//  FNDInteractorIO.h
//  EFCrepublic
//
//  Created by eduardo fulgencio on 8/12/15.
//  Copyright © 2015 eduardo fulgencio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cancion.h"

@protocol FNDInteractorInput <NSObject> 
- (void) obtenerDatos:(NSInteger)posicion;
@end


@protocol FNDInteractorOutput <NSObject>
- (void) updateCancion:(Cancion *)cancion;
@end
