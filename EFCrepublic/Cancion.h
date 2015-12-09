//
//  Cancion.h
//  EFCrepublic
//
//  Created by eduardo fulgencio on 8/12/15.
//  Copyright © 2015 eduardo fulgencio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cancion : NSObject

// defino atributos
@property(nonatomic, strong) NSString *kind;
@property(nonatomic, strong) NSString *artistId;
@property(nonatomic, strong) NSString *collectionId;
@property(nonatomic, strong) NSString *trackId;
@property(nonatomic, strong) NSString *artistName;
@property(nonatomic, strong) NSString *collectionCensoredName;
@property(nonatomic, strong) NSString *trackCensoredName;
@property(nonatomic, strong) NSString *collectionArtistName;
@property(nonatomic, strong) NSString *artworkUrl30;
@property(nonatomic, strong) NSString *artworkUrl60;
@property(nonatomic, strong) NSString *artworkUrl100;
@property(nonatomic, strong) NSString *collectionPrice;
@property(nonatomic, strong) NSString *trackPrice;
@property(nonatomic, strong) NSString *releaseDate;
@property(nonatomic, strong) NSString *trackTimeMillis;
@property(nonatomic, strong) NSString *currency;
@property(nonatomic, strong) NSString *primaryGenreName;


@end
