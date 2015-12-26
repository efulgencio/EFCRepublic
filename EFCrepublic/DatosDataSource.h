//
//  DatosDataSource.h
//  EFCrepublic
//
//  Created by eduardo fulgencio on 26/12/15.
//  Copyright © 2015 eduardo fulgencio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DatosDataSource : NSObject <UITableViewDataSource>

@property(nonatomic,strong) NSArray *arryDatos;

- (id)itemAtIndexPath:(NSIndexPath *)indexPath;

@end
