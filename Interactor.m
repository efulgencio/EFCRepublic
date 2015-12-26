//
//  Itinerator.m
//  ColoreaEFC
//
//  Created by eduardo fulgencio on 27/11/15.
//  Copyright © 2015 eduardo fulgencio. All rights reserved.
//

#import "Interactor.h"

@interface Interactor()

@property (nonatomic, assign) NSUInteger count;
@property (nonatomic) Contenedor *model;
@end

@implementation Interactor

// mediante notificación

- (void)obtenerDatos
{

    [[NSNotificationCenter defaultCenter] addObserverForName:(NSString *)NOTIFICACION_GENERADO_CONTENEDOR
                                                      object:self
                                                       queue:[NSOperationQueue mainQueue]
                                                  usingBlock:^(NSNotification *notification) {
                                                      id datosRecibidos = [notification userInfo];
                                                      [self.output updateDatosDict:datosRecibidos];
                                                  }];


    [UrlCallsHelper peticion:BUSQUEDA_MICHAEL_JACKSON  entidad:ENTIDAD_SOLICITA_CONTENEDOR notificar:self];

}


@end
