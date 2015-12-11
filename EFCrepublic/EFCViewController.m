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
#import "CancionCell.h"


static NSString * const CancionCellIdentifier = @"CancionCell";
        static NSString *TableViewCellIdentifier = @"celdaCancion";

@interface EFCViewController ()
@property (nonatomic, strong) NSArray *arryDatos;
@end

@implementation EFCViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.tbvDatos.delegate = self;
    self.tbvDatos.dataSource = self;

    [self.presenter obtenerDatos];
    
 //   [self.tbvDatos registerNib:[CancionCell nib] forCellReuseIdentifier:CancionCellIdentifier];

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
        /*
         CancionCell *cell = [tableView dequeueReusableCellWithIdentifier:CancionCellIdentifier forIndexPath:indexPath];
          cell.txtAutor.text = @"Test acceso celda";
        */
        
        // UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CancionCellIdentifier forIndexPath:indexPath];
        

        
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
    // Muestro la pantalla para ver el detalle que es otro caso de uso
    // tengo que establecer la relación de los elementos;
    
    FNDViewController *fndViewController = [[FNDViewController alloc] initWithNibName:@"FNDViewController" bundle:nil];
    fndViewController.posicionSel = indexPath.row;
    
    // ENCONTRADOS configurarción
    // FIND = FND
    
    FNDInteractor *fndInteractor = [[FNDInteractor alloc] init];
    FNDPresenter *fndPresenter = [[FNDPresenter alloc] init];
    
    fndViewController.presenter = fndPresenter;
    
    fndPresenter.view = fndViewController;
    fndPresenter.interactor = fndInteractor;
    fndInteractor.output = fndPresenter;
    // Le paso el array pero tendría que tener acceso a un datasource 
    fndInteractor.canciones = self.arryDatos;
    // Interactor debe de poseer el array
    // y FND debe de contener la posición de la canción que quiere mostrar
    // y desde la vista cuando pulse a siguiente, llamará a interactor que
    // como contiene el array, al recibir una posición, devolverá al presenter
    // la canción a mostrar en el view, y así cada vez que se pulsa
    
    fndViewController.cancion = (Cancion *) [self.arryDatos objectAtIndex:indexPath.row];
    [self presentViewController:fndViewController animated:YES completion:nil];
}


@end



