//
//  FNDPresenter.h
//  EFCrepublic
//
//  Created by eduardo fulgencio on 7/12/15.
//  Copyright © 2015 eduardo fulgencio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FNDViewInterface.h"

@interface FNDPresenter : NSObject

- (void)configureUserInterfaceForPresentation:(id<FNDViewInterface>) fndUserInterface;

@end
