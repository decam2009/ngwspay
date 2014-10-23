//
//  FormsView.m
//  ngwspay
//
//  Created by Boris Kaloshin on 7/1/14.
//  Copyright (c) 2014 Boris Kaloshin. All rights reserved.
//

#import "FormsView.h"

@interface FormsView ()


@end

@implementation FormsView

@synthesize allTxtFields, fieldTitle, textFieldTitle, pvfieldTitle, allPvFields, textFieldSumma, scroll;

int x = 10, y = 100, width = 300, height = 40, shift;

-(void) drawTitleField:(NSMutableArray *)pformfields
{
  shift = 0;
  for (NSDictionary *pfieldsDict in pformfields)
  {
    fieldTitle = [pfieldsDict valueForKey:@"title_d"];
    textFieldTitle = [[UITextField alloc] initWithFrame:CGRectMake(x, y + shift, width, height)];
    shift = shift + 55;
    textFieldTitle.borderStyle = UITextBorderStyleRoundedRect;
    textFieldTitle.font = [UIFont systemFontOfSize:14];
    textFieldTitle.placeholder = fieldTitle;
    textFieldTitle.autocorrectionType = UITextAutocorrectionTypeNo;
    textFieldTitle.keyboardType = UIKeyboardTypeDefault;
    textFieldTitle.returnKeyType = UIReturnKeyDone;
    textFieldTitle.clearButtonMode = UITextFieldViewModeWhileEditing;
    textFieldTitle.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [self.scroll addSubview:textFieldTitle];
  }
  
}

-(void) drawSummaField
{
  textFieldSumma = [[UITextField alloc] initWithFrame:CGRectMake(x, y + shift, width, height)];
  textFieldSumma.borderStyle = UITextBorderStyleRoundedRect;
  textFieldSumma.font = [UIFont systemFontOfSize:14];
  shift = shift + 55;
  textFieldSumma.borderStyle = UITextBorderStyleRoundedRect;
  textFieldSumma.font = [UIFont systemFontOfSize:14];
  textFieldSumma.placeholder = @"Сумма платежа";
  textFieldSumma.autocorrectionType = UITextAutocorrectionTypeNo;
  textFieldSumma.keyboardType = UIKeyboardTypeDefault;
  textFieldSumma.returnKeyType = UIReturnKeyDone;
  textFieldSumma.clearButtonMode = UITextFieldViewModeWhileEditing;
  textFieldSumma.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
  [self.scroll addSubview:textFieldSumma];
  
}


-(void) drawMakePaymentButton
{
  UIButton *buttonMakePayment = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  [buttonMakePayment setTitle:@"Оплатить" forState:UIControlStateNormal];
  [buttonMakePayment sizeToFit];
  buttonMakePayment.center =  CGPointMake(160, y + shift);
  [self.scroll addSubview:buttonMakePayment];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void) drawSelectorPicker: (NSMutableArray*) pformfields
{
  allPvFields = [[NSMutableArray alloc] init];
  allTxtFields = [[NSMutableArray alloc] init];
  for (int i = 0; i <= [pformfields count] - 1; i++)
    {
      NSDictionary *tmpFormFields = [pformfields objectAtIndex:i];
      NSArray *items = [tmpFormFields valueForKey:@"items_s"];
      NSDictionary *items_s = [items objectAtIndex:i];
      NSString *items_title = [items_s valueForKey:@"title"];
      [allPvFields addObject:items_title];
      fieldTitle = [tmpFormFields valueForKey:@"fieldSubTitle_s"];
      if (fieldTitle != nil)
        {
          [allTxtFields addObject:fieldTitle];
        }
    }
      //Отрисовываем поле для ввода реквизитов
     if (fieldTitle != nil)
       {
         textFieldTitle = [[UITextField alloc] initWithFrame:CGRectMake(10, y + shift, 300, 40)];
         shift = shift + 55;
         textFieldTitle.borderStyle = UITextBorderStyleRoundedRect;
         textFieldTitle.font = [UIFont systemFontOfSize:14];
         if (fieldTitle != nil)
           {
             textFieldTitle.placeholder = [allTxtFields objectAtIndex:0];
           }
         else
          {
            textFieldTitle.placeholder = fieldTitle;
          }
         textFieldTitle.autocorrectionType = UITextAutocorrectionTypeNo;
         textFieldTitle.keyboardType = UIKeyboardTypeDefault;
         textFieldTitle.returnKeyType = UIReturnKeyDone;
         textFieldTitle.clearButtonMode = UITextFieldViewModeWhileEditing;
         textFieldTitle.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
         textFieldTitle.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
         [self.scroll addSubview:textFieldTitle];
       }
     else
       {
         [self drawTitleField:self.formDataFields];
       }
  UIPickerView *pv = [[UIPickerView alloc] initWithFrame:CGRectMake(0,[self.formSelectors count] * 10 + shift + y, 320, 200)];
  pv.delegate = self;
  pv.dataSource = self;
  [self.scroll addSubview:pv];
}


- (void)viewDidLoad
{
  self.scroll.contentSize = CGSizeMake(320, 700);
  if ([self.formSelectors count] != 0 && [self.formDataFields count] != 0)
  {
    [self drawTitleField:self.formDataFields];
    [self drawSelectorPicker:self.formSelectors];
    NSLog(@"Picker must be");
  }
  else if ([self.formDataFields count] != 0)
  {
    [self drawTitleField:self.formDataFields];
  }
  else if ([self.formSelectors count] != 0)
   {
     [self drawSelectorPicker:self.formSelectors];
   }
  [self drawSummaField];
  [self drawMakePaymentButton];
  shift = 0;
  [super viewDidLoad];
  self.navigationItem.title = self.operatorTitle;
    // Do any additional setup after loading the view.
}

-(NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
  return 1;
}

-(NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
  return [allPvFields count];
}

//- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
//{
//  return [allItems objectAtIndex:row];
//}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
  UILabel *pvlabel = (UILabel*) view;
  if (!pvlabel)
  {
    pvlabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 0.0f, [pickerView rowSizeForComponent:component].width - 10.0f, [pickerView rowSizeForComponent:component].height)];
  }
  pvlabel.backgroundColor = [UIColor clearColor];
  pvlabel.text = allPvFields[row];
  pvlabel.font = [UIFont fontWithName:@"Arial" size:14.0];
  return pvlabel;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
  if ([allTxtFields count] != 0)
    {
      fieldTitle = allTxtFields[row];
    }
  else
    {

    }
  // fieldTitle = allTxtFields[row];
  textFieldTitle.borderStyle = UITextBorderStyleRoundedRect;
  textFieldTitle.font = [UIFont systemFontOfSize:14];
  textFieldTitle.placeholder = fieldTitle;
  textFieldTitle.autocorrectionType = UITextAutocorrectionTypeNo;
  textFieldTitle.keyboardType = UIKeyboardTypeDefault;
  textFieldTitle.returnKeyType = UIReturnKeyDone;
  textFieldTitle.clearButtonMode = UITextFieldViewModeWhileEditing;
  textFieldTitle.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
//865 форма в файлу ВКонтакте
//1632 форма Дом ру Новосибирск
//1008
//1209 Русский стандарт
//1206 Home Credit
@end
