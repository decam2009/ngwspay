//
//  Operators.m
//  ngwspay
//
//  Created by Boris Kaloshin on 6/19/14.
//  Copyright (c) 2014 Boris Kaloshin. All rights reserved.
//

#import "OperatorsInit.h"

@implementation OperatorsInit
{
  NSString *sid, *name, *altName, *fullName, *image, *verifyType, *legalName, *inn, *minSum, *maxSum, *support, *system,
  *code, *active, *serviceType, *area, *providerType;
}

-(id) initOperator:(NSString *)_sid name:(NSString *)_name altName:(NSString *)_altName fullName:(NSString *)_fullName image:(NSString *)_image verifyType:(NSString *)_verifyType legalName:(NSString *)_legalName inn:(NSString *)_inn minSum:(NSString *)_minSum maxSum:(NSString *)_maxSum support:(NSString *)_support system:(NSString *)_system code:(NSString *)_code active:(NSString *)_active serviceType:(NSString *)_serviceType area:(NSString *)_area providerType:(NSString *)_providerType

{
  sid = _sid;
  name = _name;
  altName = _altName;
  fullName = _fullName;
  image = _image;
  verifyType = _verifyType;
  legalName = _legalName;
  inn = _inn;
  minSum = _minSum;
  maxSum = _maxSum;
  support = _support;
  system = _system;
  code = _code;
  active = _active;
  serviceType = _serviceType;
  area = _area;
  providerType = _providerType;
  return self;
}

@end
