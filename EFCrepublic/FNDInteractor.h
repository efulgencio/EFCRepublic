//
//  FNDInteractor.h
//  EFCrepublic
//
//  Created by eduardo fulgencio on 7/12/15.
//  Copyright © 2015 eduardo fulgencio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FNDInteractorIO.h"

@interface FNDInteractor : NSObject <FNDInteractorInput>
@property (nonatomic, weak) id<FNDInteractorOutput> output;
@property (nonatomic, strong) NSArray *canciones;
@property (nonatomic) NSInteger posicionActual;
@end
