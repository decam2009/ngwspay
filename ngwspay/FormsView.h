//
//  FormsView.h
//  ngwspay
//
//  Created by Boris Kaloshin on 7/1/14.
//  Copyright (c) 2014 Boris Kaloshin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FormsView : UIViewController

@property (nonatomic, strong) NSMutableArray *formDataFields;
@property (nonatomic, strong) NSMutableArray *formSelectors;
@property (nonatomic, strong) NSString *operatorTitle;

-(void) drawTitleField: (NSMutableArray*) pformfields;
-(void) drawMakePayment: (NSMutableArray*) pformfields;

@end
