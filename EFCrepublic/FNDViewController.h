//
//  FNDViewController.h
//  EFCrepublic
//
//  Created by eduardo fulgencio on 7/12/15.
//  Copyright © 2015 eduardo fulgencio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FNDViewInterface.h"
#import "FNDView.h"

@class FNDPresenter;

@interface FNDViewController : UIViewController <FNDViewInterface, FNDView>

// @property (nonatomic, strong) id<FNDModuleInterface> eventHandler;
@property (nonatomic, strong) FNDPresenter *presenter;
@property(nonatomic, strong) Cancion *cancion;
@property(nonatomic) NSInteger posicionSel;
@property (weak, nonatomic) IBOutlet UILabel *LBLcancion;


@end
