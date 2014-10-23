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
  
  NSDictionary *sequence_s;
  NSArray *fields_s;
  NSDictionary *trueFields_s;
  NSString* fid_s;
  BOOL exist_s;
  NSString *title_s;
  NSDictionary *store_s;
  NSArray *items_s;
  NSString* titleItem_s;
  NSDictionary* customData_s;
  NSDictionary * sharpSequence_s;
  NSArray* screensItem_s;
  NSDictionary* sequenceItem_s;
  NSArray* fieldsItem_s;
  NSString* fieldSubTitle_s;

  NSDictionary *trueFields_d;
  NSString *rid_d;
  NSString *type_d;
  BOOL exist_d;
  NSString *title_d;
  NSString *help_d;
  BOOL readonly_d;
  NSString *maxlength_d;
  BOOL secure_d;
  NSString *prefix_d;
  NSString *postfix_d;
  NSDictionary *validator_d;
  NSArray *rules_d;
  NSString *regexp_d;

}

-(id) initForms:(NSString *)_fid code:(NSString *)_fcode fileReferenceSubPart:(NSDictionary *)_ffilereferenceSubPart;
{
  fid = _fid;
  fcode = _fcode;
  ffileReferenceSubPart = _ffilereferenceSubPart;
  return self;
}

-(id) sequence:(NSDictionary *)_sequence_s fields:(NSArray *)_fields_s trueFields:(NSDictionary *)_trueFields_s fid:(NSString *)_fid_s exist:(BOOL)_exist_s title:(NSString *)_title_s store:(NSDictionary *)_store_s items:(NSArray *)_items_s titleItem:(NSString *)_titleItem_s customData:(NSDictionary *)_customData_s sharpSequence:(NSDictionary *)_sharpSequence_s screensItem:(NSArray *)_screensItem_s sequenceItem:(NSDictionary *)_sequenceItem_s fieldsItem:(NSArray *)_fieldsItem_s fieldSubTitle:(NSString *)_fieldSubTitle_s
{
  sequence_s = _sequence_s;
  fields_s = _fields_s;
  trueFields_s = _trueFields_s;
  fid_s = _fid_s;
  exist_s = _exist_s;
  title_s = _title_s;
  store_s = _store_s;
  items_s = _items_s;
  titleItem_s = _titleItem_s;
  customData_s = _customData_s;
  sharpSequence_s = _sharpSequence_s;
  screensItem_s = _screensItem_s;
  sequenceItem_s = _sequenceItem_s;
  fieldsItem_s = _fieldsItem_s;
  fieldSubTitle_s = _fieldSubTitle_s;
  return self;
}

-(id) trueFields:(NSDictionary *)_trueFields_d rid:(NSString *)_rid_d type:(NSString *)_type_d exist:(BOOL)_exist_d title:(NSString *)_title_d help:(NSString *)_help_d readonly:(BOOL)_readonly_d maxlength:(NSString *)_maxlength_d secure:(BOOL)_secure_d prefix:(NSString *)_prefix_d postfix:(NSString *)_posfix_d validator:(NSDictionary *)_validator_d rules:(NSArray *)_rules_d regexp:(NSString *)_regexp_d
{
  trueFields_d = _trueFields_d;
  rid_d = _rid_d;
  type_d = _type_d;
  exist_d = _exist_d;
  title_d = _title_d;
  help_d = _help_d;
  readonly_d = _readonly_d;
  maxlength_d = _maxlength_d;
  secure_d = _secure_d;
  prefix_d = _prefix_d;
  postfix_d = _posfix_d;
  validator_d = _validator_d;
  rules_d = _rules_d;
  regexp_d = _regexp_d;
  return self;
} 

@end
