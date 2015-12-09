//
//  EFCViewController.h
//  ColoreaEFC
//
//  Created by eduardo fulgencio on 27/11/15.
//  Copyright © 2015 eduardo fulgencio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "View.h"
#import "ListViewInterface.h"

@class Presenter;

@interface EFCViewController : UIViewController <View, UITableViewDelegate, UITableViewDataSource,  ListViewInterface>

@property (nonatomic, strong) Presenter *presenter;

@property (weak, nonatomic) IBOutlet UIButton *cargaDatos;
@property (weak, nonatomic) IBOutlet UITableView *tbvDatos;

- (void) cargarDatos:(NSArray *) datosIn;


@end
