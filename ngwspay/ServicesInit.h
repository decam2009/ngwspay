//
//  serviceInit.h
//  ngwspay
//
//  Created by Boris Kaloshin on 6/18/14.
//  Copyright (c) 2014 Boris Kaloshin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ServicesInit : NSObject

-(id) initService:(NSString*) _sid name:(NSString*) _name sortOrder: (NSString*) _sortOrder logo: (NSString*) _logo level:(NSString*) _level;

@end
