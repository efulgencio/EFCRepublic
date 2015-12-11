//
//  FNDViewController.m
//  EFCrepublic
//
//  Created by eduardo fulgencio on 7/12/15.
//  Copyright © 2015 eduardo fulgencio. All rights reserved.
//

#import "FNDViewController.h"
#import "Presenter.h"

@interface FNDViewController ()

@end

@implementation FNDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
    // Cuando selecciono una fila
    // y cargo la configuración, no sé
    // si están acccesibles todas las clases ??
    // Al presenter le tengo que pasar la posición del array para que me retorne
    // el elemento que quiero seleccionar
    [self.presenter obtenerDatos:self.posicionSel]; // cambiar 1 por el valor seleccionado
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)setEntryName:(NSString *)name
{
   // self.nameTextField.text = name;
}


- (void)setEntryDueDate:(NSDate *)date
{
 //   [self.datePicker setDate:date];
}


- (void)setMinimumDueDate:(NSDate *)date
{
 //   self.minimumDate = date;
 //   self.datePicker.minimumDate = date;
}

-(void) cargaCancion:(Cancion *) cancionIn
{
    self.cancion = cancionIn;
    self.LBLcancion.text = cancionIn.trackCensoredName;
    // Ahora tendré que actualizar el contenido
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
