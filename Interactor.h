//
//  Itinerator.h
//  ColoreaEFC
//
//  Created by eduardo fulgencio on 27/11/15.
//  Copyright © 2015 eduardo fulgencio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "InteractorIO.h"

@interface Interactor : NSObject <InteractorInput>
@property (nonatomic, weak) id<InteractorOutput> output;
@end
