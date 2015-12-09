//
//  FNDInteractorIO.h
//  EFCrepublic
//
//  Created by eduardo fulgencio on 8/12/15.
//  Copyright © 2015 eduardo fulgencio. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol FNDInteractorInput <NSObject>
- (void)obtenerDatos;
@end


@protocol FNDInteractorOutput <NSObject>
- (void) updateDatos:(NSArray *)datos;
- (void) updateDatosDict:(NSDictionary *)datosDict;

@end
