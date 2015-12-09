//
//  ViewPresenter.m
//  ColoreaEFC
//
//  Created by eduardo fulgencio on 27/11/15.
//  Copyright © 2015 eduardo fulgencio. All rights reserved.
//

#import "Presenter.h"

@interface Presenter()

@end


@implementation Presenter

- (void) obtenerDatos
{
    [self.interactor obtenerDatos];
}

// Recibo un NSDictionary
// y tengo ue actualizarlo en formato NSArray
-(void) updateDatos:(NSArray *)datos
{
    [self.view cargarDatos:datos];
}

// En el contenedor tengo el array 
// Recibo un NSDictionary de Interactor y
// lo tranformo en Contenedor que será
// el necesario para la view este presenter se encarga de transformar
// en la entidad necesaria para la view
-(void) updateDatosDict:(NSDictionary *)datosDict
{
    Contenedor *datos = (Contenedor *)[datosDict objectForKey:ENTIDAD_SOLICITA_CONTENEDOR];
    [self.view cargarDatos:[[NSArray alloc] initWithArray:datos.canciones]];
}

@end
