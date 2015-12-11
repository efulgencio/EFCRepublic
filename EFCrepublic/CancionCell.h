//
//  WordCell.h
//  WordsEngEFC
//
//  Created by eduardo fulgencio on 1/12/15.
//  Copyright © 2015 eduardo fulgencio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CancionCell : UITableViewCell

+ (UINib *)nib;

@property (weak, nonatomic) IBOutlet UILabel *txtAutor;
@property (weak, nonatomic) IBOutlet UILabel *txtCancion;


@end
