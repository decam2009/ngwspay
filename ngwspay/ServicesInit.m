//
//  serviceInit.m
//  ngwspay
//
//  Created by Boris Kaloshin on 6/18/14.
//  Copyright (c) 2014 Boris Kaloshin. All rights reserved.
//

#import "ServicesInit.h"

@implementation ServicesInit
{
  NSString *sid, *name, *sortOrder, *logo, *level;
}

-(id) initService:(NSString *)_sid name:(NSString *)_name sortOrder:(NSString *)_sortOrder logo:(NSString *)_logo level:(NSString*) _level;
{
  sid = _sid;
  name = _name;
  sortOrder = _sortOrder;
  logo = _logo;
  level = _level;
  return self;
}

@end
