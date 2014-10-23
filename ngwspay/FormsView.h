//
//  FormsView.h
//  ngwspay
//
//  Created by Boris Kaloshin on 7/1/14.
//  Copyright (c) 2014 Boris Kaloshin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FormsView : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>

@property (nonatomic, strong) NSMutableArray *formDataFields;
@property (nonatomic, strong) NSMutableArray *formSelectors;
@property (nonatomic, strong) NSString *operatorTitle;
@property (nonatomic, strong) NSString *fieldTitle;
@property (nonatomic, strong) NSString *pvfieldTitle;
@property (nonatomic, strong) NSMutableArray *allPvFields;
@property (nonatomic, strong) NSMutableArray *allTxtFields;
@property (nonatomic, strong) UITextField* textFieldTitle;
@property (nonatomic,strong) UITextField* textFieldSumma;
@property (nonatomic, strong) IBOutlet UIScrollView* scroll;


-(void) drawTitleField: (NSMutableArray*) pformfields;
-(void) drawMakePaymentButton;
-(void) drawSelectorPicker: (NSMutableArray*) pformfields;
-(void) drawSummaField;

@end
