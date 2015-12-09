//
//  EFCViewController.m
//  ColoreaEFC
//
//  Created by eduardo fulgencio on 27/11/15.
//  Copyright © 2015 eduardo fulgencio. All rights reserved.
//

#import "EFCViewController.h"
#import "Presenter.h"
#import "UIImageView+AFNetworking.h"

@interface EFCViewController ()
@property (nonatomic, strong) NSArray *arryDatos;
@end

@implementation EFCViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.tbvDatos.delegate = self;
    self.tbvDatos.dataSource = self;

    [self.presenter obtenerDatos];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (IBAction)accionCarga:(id)sender {
    [self.presenter obtenerDatos];
}

- (void)reloadEntries
{
    [self.tbvDatos reloadData];
}

#pragma mark - Count view


-(void) cargarDatos:(NSArray *) arrayIn
{
    self.arryDatos = arrayIn;
    [self.tbvDatos reloadData];
}


#pragma mark - UITableView

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.arryDatos.count;
}

- (UITableViewCell *)  tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *result = nil;
    
    if ([tableView isEqual:self.tbvDatos]){
        
        static NSString *TableViewCellIdentifier = @"celdaCancion";
        
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
        
        
        
        
    }
    
    return result;
    
}

// Falta el método de selección de la línea


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Me falta llamar al routing
    NSString *valor = @"seleccionado";

}


@end



