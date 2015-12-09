//
//  FNDPresenter.m
//  EFCrepublic
//
//  Created by eduardo fulgencio on 7/12/15.
//  Copyright © 2015 eduardo fulgencio. All rights reserved.
//

#import "FNDPresenter.h"
#import "FNDViewInterface.h"

@implementation FNDPresenter

- (void)configureUserInterfaceForPresentation:(id<FNDViewInterface>) fndUserInterface
{
    // Aquí puedo asignar los datos
    [fndUserInterface setMinimumDueDate:[NSDate date]];
}


@end
