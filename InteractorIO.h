//
//  Interactor.h
//  ColoreaEFC
//
//  Created by eduardo fulgencio on 27/11/15.
//  Copyright © 2015 eduardo fulgencio. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol InteractorInput <NSObject>
- (void)obtenerDatos;
@end


@protocol InteractorOutput <NSObject>
- (void) updateDatos:(NSArray *)datos;
- (void) updateDatosDict:(NSDictionary *)datosDict;

@end

