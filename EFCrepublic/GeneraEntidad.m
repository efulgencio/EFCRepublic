//
//  ObtenerDatos.m
//  EduardoFC
//
//  Created by eduardo fulgencio on 11/11/15.
//  Copyright © 2015 eduardo fulgencio. All rights reserved.
//

#import "GeneraEntidad.h"

// El objetivo de esta clase es
// obtener los datos de la url
// después de obtener los datos
// pasar la información a la clase GeneraEntidad
// encarada del separar los valores del json
@implementation GeneraEntidad


// Recibo un dictionary con el valor del json obtenenido
// y según la entidad que recibo genero la correspondiente
// con el NSDictionary que recibo tengo que generar la entidad
// contenedor que contendrá los array a mostrar.
+(Contenedor *) procesoGenera:(NSDictionary *) dictToContenedor

{
    // Array que contendrán preguntas con respuesta
    NSMutableArray *canciones = [[NSMutableArray alloc] init];
    // Array que contendrá preguntas sin respuestas
    NSMutableArray *sinrespuesta = [[NSMutableArray alloc] init];

    
    for (id keyValue in [dictToContenedor allKeys]){
        
        id datosValue = [dictToContenedor objectForKey:keyValue];
        
        if([keyValue isEqual:DICTIONARY_ITEMS_DATOS]){

            // Recorrer todos los nodos de las preguntas
            // para generar entidad Pregunta y guardar en el array correspondiente
            for(NSInteger counter = 0; counter < [datosValue count]; counter++) {

                id preguntaDict = datosValue[counter];
          
                Cancion *cancion = [GeneraEntidad datosDictToPregunta:preguntaDict];
                
                [canciones addObject:cancion];

            }

        }
        
        
    }
    
    
    // Ahora que tengo informado los dos arrays los añado al contendor que tengo que retornar
    
    Contenedor *contenedor = [[Contenedor alloc] init];
    contenedor.canciones = canciones;

    
    return contenedor;
    
}

// genero la Canción
// datosDictToPregunta
// Recibo un NSDictionary
// y obtengo la información necesaria para retornar una Pregunta
+ (Cancion *) datosDictToPregunta:(NSDictionary *)preguntaDictIn
{
    
    Cancion *cancion = [[Cancion alloc] init];
        
    id kind = preguntaDictIn[KEY_KIND];
    id artistid = preguntaDictIn[KEY_ARTISTID];
    id collectionid = preguntaDictIn[KEY_COLLECTIONID];
    id trackid = preguntaDictIn[KEY_TRACKID];
    id artistname = preguntaDictIn[KEY_ARTISTNAME];
    id collectionCensoredName = preguntaDictIn[KEY_COLLECTIONCENSOREDNAME];
    id trackCensoredName = preguntaDictIn[KEY_TRACKCENSOREDNAME];
    id collectionArtistName = preguntaDictIn[KEY_COLLECTIONARTISTNAME];
    id artworkUrl30 = preguntaDictIn[KEY_ARTWORKURL30];
    id artworkUrl60 = preguntaDictIn[KEY_ARTWORKURL60];
    id artworkUrl100 = preguntaDictIn[KEY_ARTWORKURL100];
    id collectionPrice = preguntaDictIn[KEY_COLLECTIONPRICE];
    id trackPrice = preguntaDictIn[KEY_TRACKPRICE];
    id releaseDate = preguntaDictIn[KEY_RELEASEDATE];
    id trackTimeMillis = preguntaDictIn[KEY_TRACKTIMEMILLIS];
    id currency = preguntaDictIn[KEY_CURRENCY];
    id primaryGenreName = preguntaDictIn[KEY_PRIMARYGENRENAME];
    
    cancion.kind = kind;
    cancion.artistId = artistid;
    cancion.collectionId = collectionid;
    cancion.trackId = trackid;
    cancion.artistName = artistname;
    cancion.collectionCensoredName = collectionCensoredName;
    cancion.trackCensoredName = trackCensoredName;
    cancion.collectionArtistName = collectionArtistName;
    cancion.artworkUrl30 = artworkUrl30;
    cancion.artworkUrl60 = artworkUrl60;
    cancion.artworkUrl100 = artworkUrl100;
    cancion.collectionPrice = collectionPrice;
    cancion.trackPrice = trackPrice;
    cancion.releaseDate = releaseDate;
    cancion.trackTimeMillis = trackTimeMillis;
    cancion.currency = currency;
    cancion.primaryGenreName = primaryGenreName;
    
    
    return cancion;
    
}


@end
