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

#import "DatosDataSource.h"

static NSString * const CancionCellIdentifier = @"CancionCell";
static NSString *TableViewCellIdentifier = @"celdaCancion";

// @interface EFCViewController ()  <UITableViewDataSource, UITableViewDelegate>
@interface EFCViewController ()
@property (nonatomic, strong) NSArray *arryDatos;
@property (nonatomic, strong) DatosDataSource *datosDataSource;
@end

@implementation EFCViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];

    self.tbvDatos.delegate = self;
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
    
    self.datosDataSource = [[DatosDataSource alloc] init];
    self.datosDataSource.arryDatos = arrayIn;
    
    self.tbvDatos.dataSource = self.datosDataSource;
    
    [self.tbvDatos reloadData];
    self.cargaDatos.hidden = YES;
}


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
    fndInteractor.canciones = self.datosDataSource.arryDatos;
    // Interactor debe de poseer el array
    // y FND debe de contener la posición de la canción que quiere mostrar
    // y desde la vista cuando pulse a siguiente, llamará a interactor que
    // como contiene el array, al recibir una posición, devolverá al presenter
    // la canción a mostrar en el view, y así cada vez que se pulsa
    
    fndViewController.cancion = (Cancion *) [self.datosDataSource.arryDatos objectAtIndex:indexPath.row];
    [self presentViewController:fndViewController animated:YES completion:nil];
}


@end



