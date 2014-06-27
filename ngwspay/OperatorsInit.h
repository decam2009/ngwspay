//
//  Operators.h
//  ngwspay
//
//  Created by Boris Kaloshin on 6/19/14.
//  Copyright (c) 2014 Boris Kaloshin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OperatorsInit : NSObject

-(id) initOperator: (NSString*) _sid name:(NSString*) _name altName:(NSString*) _altName fullName:(NSString*)_fullName image:(NSString*) _image verifyType: (NSString*) _verifyType legalName:(NSString*) _legalName inn:(NSString*) _inn minSum:(NSString*) _minSum maxSum:(NSString*) _maxSum support:(NSString*) _support system:(NSString*) _system code:(NSString*) _code active:(NSString*) _active serviceType:(NSDictionary*) _serviceType area:(NSDictionary*) _area providerType:(NSDictionary*) _providerType;

@end
