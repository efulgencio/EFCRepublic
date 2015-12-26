//
//  DatosDataSource.m
//  EFCrepublic
//
//  Created by eduardo fulgencio on 26/12/15.
//  Copyright © 2015 eduardo fulgencio. All rights reserved.
//

#import "DatosDataSource.h"
#import "UIImageView+AFNetworking.h"

@implementation DatosDataSource

static NSString *TableViewCellIdentifier = @"celdaCancion";

/*
- (id) init
{
    if ((self = [super init])) {
        self.arryDatos = [[NSArray alloc] initWithObjects:@"uno",@"dos", nil];
    }
    return self;
}
*/

- (id)itemAtIndexPath:(NSIndexPath *)indexPath
{
    return self.arryDatos[(NSUInteger) indexPath.row];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.arryDatos.count;
}

- (UITableViewCell *)  tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *result = nil;
    
    
        result = [tableView dequeueReusableCellWithIdentifier:TableViewCellIdentifier];
        
        if (result == nil){
            result = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:TableViewCellIdentifier];
            
        }
    
    
        // Recibo una canción, muestro el contenido
        Cancion *cancion = (Cancion *) [self.arryDatos objectAtIndex:indexPath.row];
        
        // Muestro el cantante y la canción
        result.textLabel.text = cancion.artistName;
        result.detailTextLabel.text = cancion.trackCensoredName;
        
        NSURL *url = [NSURL URLWithString:cancion.artworkUrl100];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        UIImage *placeholderImage = [UIImage imageNamed:IMAGEN_POR_DEFECTO_CELDA];
        
        __weak UITableViewCell *weakCell = result;
        
        [result.imageView setImageWithURLRequest:request
                                placeholderImage:placeholderImage
                                         success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
                                             
                                             weakCell.imageView.image = image;
                                             [weakCell setNeedsLayout];
                                             
                                         }
                                         failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error){
                                             if(error) {
                                                 NSLog(@"%@",error.description);
                                             };
                                         }
         ];

    
    return result;
    
}

@end
