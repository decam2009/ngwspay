//
//  FormsInit.m
//  ngwspay
//
//  Created by Boris Kaloshin on 7/1/14.
//  Copyright (c) 2014 Boris Kaloshin. All rights reserved.
//

#import "FormsInit.h"

@implementation FormsInit
{
  NSString *fid, *fcode;
  NSDictionary *ffileReferenceSubPart;
}

-(id) initForms:(NSString *)_fid code:(NSString *)_fcode fileReferenceSubPart:(NSDictionary *)_ffilereferenceSubPart;
{
  fid = _fid;
  fcode = _fcode;
  ffileReferenceSubPart = _ffilereferenceSubPart;
  return self;
}

@end
