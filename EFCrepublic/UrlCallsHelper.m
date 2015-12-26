//
//  UrlCallsHelper.m
//  CulturaEFC
//
//  Created by eduardo fulgencio on 11/5/15.
//  Copyright (c) 2015 eduardo fulgencio. All rights reserved.
//

#import "UrlCallsHelper.h"

@implementation UrlCallsHelper
/*
/Users/eduardofulgencio/Documents/__viper/EFCrepublic/EFCrepublic/UrlCallsHelper.m:32:22: 'sendAsynchronousRequest:queue:completionHandler:' is deprecated: first deprecated in iOS 9.0 - Use [NSURLSession dataTaskWithRequest:completionHandler:] (see NSURLSession.h
*/

//
// Objetivo
// Recibir la url, un nombre de entidad, y un objeto para retornar la notificación
// url: ulr de la llamada a realizar
// nombre entidad: en el caso de que otra entidad realice llamadas a este método
// este parámetro se utilizará para diferenciar el tipo de envio, en este caso sera Contenedor
// notificar: objeto que esta esperando la notificación para recibir los datos obtenidos.

//+(NSObject *) peticion:(NSString *) urlIn entidad:(NSString *)entidad notificar:(id)notificar
+(void) peticion:(NSString *) urlIn entidad:(NSString *)entidad notificar:(id)notificar
{
 
    NSURL *url = [NSURL URLWithString:urlIn];

    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:url
                            completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                

                                
                    if ([data length] >0  && error == nil){
                        
                        id jsonObject = [NSJSONSerialization JSONObjectWithData:data  options:NSJSONReadingAllowFragments error:&error];
                        
                        
                        if ([jsonObject isKindOfClass:[NSDictionary class]]){
                            
                            NSDictionary *dictFromJson = (NSDictionary *)jsonObject;
                            
                            Contenedor *contenedor = [GeneraEntidad procesoGenera:dictFromJson];
                            // Asigno a userInfo para el envío en la notificación
                            NSDictionary *contenedorInfo = [[NSDictionary alloc] initWithObjectsAndKeys:contenedor,entidad, nil];
                            // Creo el objeto a enviar al observer : notificar recibido por parámetro
                            NSNotification *notificaContenedor =
                            [NSNotification notificationWithName:(NSString *)NOTIFICACION_GENERADO_CONTENEDOR object:notificar userInfo:contenedorInfo];
                            
                            // Lanzo la notificación
                            [[NSNotificationCenter defaultCenter] postNotification:notificaContenedor];
                            
                            
                        } else {
                            NSLog(@"Pendiente de implementar");
                        }
                        
                    } else if ([data length] == 0 && error == nil){
                        NSLog(@"Nada descargado.");
                    } else if (error != nil){
                        NSLog(@"Generado error = %@", error);
                    }

                                
    }];
    
    [dataTask resume];
    
}

@end

