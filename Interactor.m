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
    
    [[NSNotificationCenter defaultCenter]  addObserver:self  selector:@selector(datosRetorno:)
                                                  name:(NSString *)NOTIFICACION_GENERADO_CONTENEDOR object:self];
    
    self.model = (Contenedor *)[UrlCallsHelper peticion:BUSQUEDA_MICHAEL_JACKSON  entidad:ENTIDAD_SOLICITA_CONTENEDOR notificar:self];
    
}

 // Método observer de la notificación NOTIFICACION_GENERADO_CONTENEDOR
 // que indica que se ha generado la información necesaria para la tabla
// envio un NSDictionary y el presenter se encargará de transformar en la entidad necesaria
 - (void) datosRetorno:(NSNotification *)paramNotification
{
 id datosRecibidos = [paramNotification userInfo];
 [self.output updateDatosDict:datosRecibidos];
}

- (void)sendDatos:(NSArray *)arrayIn
{
    [self.output updateDatos:arrayIn];
}

- (void)sendDatosDict:(NSDictionary *)dictionaryIn
{
    [self.output updateDatosDict:dictionaryIn];
}

@end
