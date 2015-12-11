#import "CancionCell.h"

@implementation CancionCell


+ (UINib *)nib
{
    return [UINib nibWithNibName:@"CancionCell" bundle:nil];
}


- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
{
    [super setHighlighted:highlighted animated:animated];
    
    if (highlighted) {
        self.txtAutor.shadowColor = [UIColor darkGrayColor];
        self.txtAutor.shadowOffset = CGSizeMake(3, 3);
    } else {
        self.txtAutor.shadowColor = nil;
    }
    
}


@end
