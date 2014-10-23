//
//  FormsInit.h
//  ngwspay
//
//  Created by Boris Kaloshin on 7/1/14.
//  Copyright (c) 2014 Boris Kaloshin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FormsInit : NSObject

-(id) initForms : (NSString*) _fid code: (NSString*) _fcode fileReferenceSubPart: (NSDictionary*) _ffilereferenceSubPart;

-(id) sequence : (NSDictionary*) _sequence_s fields:(NSArray*) _fields_s trueFields:(NSDictionary*) _trueFields_s
            fid:(NSString*) _fid_s exist: (BOOL) _exist_s title:(NSString*) _title_s store: (NSDictionary*) _store_s items: (NSArray*) _items_s titleItem:(NSString*) _titleItem_s customData:(NSDictionary*) _customData sharpSequence:(NSDictionary*) _sharpSequence screensItem:(NSArray*) _screensItem sequenceItem:(NSDictionary*) _sequenceItem fieldsItem:(NSArray*) _fieldsItem fieldSubTitle:(NSString*) _fieldSubTitle_s;


//NSDictionary *sequence = [screenFields objectForKey:@"sequence"];
//NSArray *fields = [sequence objectForKey:@"fields"];
//NSDictionary *trueFields = [fields objectAtIndex:0];
//NSString *fid = [trueFields valueForKey:@"id"];
//BOOL exist = [[trueFields valueForKey:@"exist"] boolValue];
//NSString *title = [trueFields valueForKey:@"title"];
//NSDictionary *store = [trueFields objectForKey:@"store"];
//NSArray *items = [store objectForKey:@"items"];


-(id) trueFields : (NSDictionary*) _trueFields_d rid : (NSString*) _rid type:(NSString*)_type exist: (BOOL) _exist_d
            title:(NSString*) _title help: (NSString*) _help readonly:(BOOL) _readonly maxlength:(NSString*) _maxlength
           secure: (BOOL) _secure prefix:(NSString*) _prefix postfix: (NSString*) _posfix validator:(NSDictionary*) _validator rules:(NSArray*) _rules regexp:(NSString*) _regexp;

//NSDictionary *trueFields = [fields objectAtIndex:0];
//NSString *rid = [trueFields valueForKey:@"id"];
//NSString *type = [trueFields valueForKey:@"type"];
//BOOL exist = [[trueFields valueForKey:@"exist"] boolValue];
//NSString *title = [trueFields valueForKey:@"title"];
//NSString *help = [trueFields valueForKey:@"help"];
//BOOL readonly = [[trueFields valueForKey:@"readOnly"] boolValue];
//NSString *maxlength = [trueFields valueForKey:@"maxLength"];
//BOOL secure = [[trueFields valueForKey:@"secure"] boolValue];
//NSString *prefix = [trueFields valueForKey:@"prefix"];
//NSString *postfix = [trueFields valueForKey:@"postfix"];
//NSDictionary *validator = [trueFields objectForKey:@"validator"];
//NSArray *rules = [validator objectForKey:@"rules"];
//NSString *regexp = [rules objectAtIndex:0];

@end
