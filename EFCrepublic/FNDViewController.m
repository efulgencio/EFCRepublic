//
//  FNDViewController.m
//  EFCrepublic
//
//  Created by eduardo fulgencio on 7/12/15.
//  Copyright © 2015 eduardo fulgencio. All rights reserved.
//

#import "FNDViewController.h"
#import "Presenter.h"
#import "UIImageView+AFNetworking.h"

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
    [self.presenter obtenerDatos:self.posicionSel];
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
    
    NSURL *url = [NSURL URLWithString:cancionIn.artworkUrl100];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    UIImage *placeholderImage = [UIImage imageNamed:IMAGEN_POR_DEFECTO_CELDA];
    
    [self.imgImagen setImageWithURLRequest:request
                            placeholderImage:placeholderImage
                                     success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
                                         
                                         self.imgImagen.image = image;
                                         [self.imgImagen setNeedsLayout];
                                         
                                     }
                                     failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error){
                                         if(error) {
                                             NSLog(@"%@",error.description);
                                         };
                                     }
     ];

}


- (IBAction)actionAnterior:(id)sender {
    [self.presenter anterior];
}

- (IBAction)actionSiguiente:(id)sender {
    [self.presenter siguiente];
}



// ESTAS LINEAS SON PARA COMPARTIR CONTENIDO, QUEDA PENDIENTE DE REFACTORIZAR

- (IBAction)btnCompartirAction:(id)sender {
    
    NSString *twitterButtonTitle = NSLocalizedString(@"Twitter", nil);
    NSString *facebookButtonTitle = NSLocalizedString(@"Facebook", nil);
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    // Create the actions.
    UIAlertAction *twitterAction = [UIAlertAction actionWithTitle:twitterButtonTitle style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
        [self compartirTwitter];
    }];
    
    UIAlertAction *facebookAction = [UIAlertAction actionWithTitle:facebookButtonTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [self compartirFacebook];
    }];
    
    
    [alertController addAction:twitterAction];
    [alertController addAction:facebookAction];

    UIPopoverPresentationController *popoverPresentationController = [alertController popoverPresentationController];
    
    if (popoverPresentationController) {
        popoverPresentationController.sourceRect = self.btnCompartir.frame;
        popoverPresentationController.sourceView = self.view;
        popoverPresentationController.permittedArrowDirections = UIPopoverArrowDirectionUp;
    }
    
    [self presentViewController:alertController animated:YES completion:nil];

}


-(void)compartirTwitter
{
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter]) {
        
        SLComposeViewController *composerSheet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
        
        [composerSheet setInitialText:self.LBLcancion.text];
        [composerSheet addURL:[NSURL URLWithString:@"http://www.bcn.cat"]];
        [composerSheet addImage:[UIImage imageNamed:@"imagenciudad.png"]];
        [composerSheet setCompletionHandler:^(SLComposeViewControllerResult result) {
       
            
            switch (result) {
                case SLComposeViewControllerResultCancelled:
                  NSLog(@"Pendiente de implementar");
                    break;
                case SLComposeViewControllerResultDone:
                   NSLog(@"Pendiente de implementar");
                    break;
                    
                default:
                    break;
            }
        }];
        
        [self presentViewController:composerSheet animated:YES completion:nil];
    }else {
        
    }
   
}


-(void)compartirFacebook
{
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
        
        
        SLComposeViewController *composerSheet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
        
        [composerSheet setInitialText:self.LBLcancion.text];
        [composerSheet addURL:[NSURL URLWithString:@"http://www.bcn.cat"]];
        [composerSheet addImage:[UIImage imageNamed:@"imagenciudad.png"]];
        [composerSheet setCompletionHandler:^(SLComposeViewControllerResult result) {
            
            switch (result) {
                case SLComposeViewControllerResultCancelled:
                    NSLog(@"Pendiente de implementar");
                    break;
                case SLComposeViewControllerResultDone:
                    NSLog(@"Pendiente de implementar");
                    break;
                    
                default:
                    break;
            }
        }];
        
        [self presentViewController:composerSheet animated:YES completion:nil];
    }else {
        
    }
 
}



@end
