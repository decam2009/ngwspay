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

-(void) drawTitleField:(NSMutableArray *)pformfields
{
  for (NSDictionary *pfieldsDict in pformfields)
  {
    NSString *ptitle = [pfieldsDict valueForKey:@"title_d"];
    UITextField *textFieldTitle = [[UITextField alloc] initWithFrame:CGRectMake(10, 200, 300, 40)];
    textFieldTitle.borderStyle = UITextBorderStyleRoundedRect;
    textFieldTitle.font = [UIFont systemFontOfSize:15];
    textFieldTitle.placeholder = ptitle;
    textFieldTitle.autocorrectionType = UITextAutocorrectionTypeNo;
    textFieldTitle.keyboardType = UIKeyboardTypeDefault;
    textFieldTitle.returnKeyType = UIReturnKeyDone;
    textFieldTitle.clearButtonMode = UITextFieldViewModeWhileEditing;
    textFieldTitle.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [self.view addSubview:textFieldTitle];
  }
  
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
  [self drawTitleField:self.formDataFields];
  [super viewDidLoad];
   self.navigationItem.title = self.operatorTitle;
    // Do any additional setup after loading the view.
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

@end
