//
//  Contenedor.h
//  EduardoFC
//
//  Created by eduardo fulgencio on 11/11/15.
//  Copyright © 2015 eduardo fulgencio. All rights reserved.
//

#import <Foundation/Foundation.h>

// Ten
@interface Contenedor : NSObject

// En el array transporto las canciones
@property (nonatomic, strong) NSArray *canciones;

@property (nonatomic, strong) NSString *nombre;

-(id) init:(NSString *) nombre;

@end
