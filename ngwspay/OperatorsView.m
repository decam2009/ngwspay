//
//  OperatorsView.m
//  ngwspay
//
//  Created by Boris Kaloshin on 6/19/14.
//  Copyright (c) 2014 Boris Kaloshin. All rights reserved.
//

#import "OperatorsView.h"
#import "FormsInit.h"
#import "FormsView.h"

@interface OperatorsView ()
{
  NSMutableArray *selector;
  NSMutableArray *digitalLetter;
}

@end

@implementation OperatorsView

- (void)viewDidLoad
{
    [super viewDidLoad];
  
    self.navigationItem.title = self.serviceTitle;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
  return 1;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return [self.operators count];
}

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  
  static NSString *cellIdentifier = @"Cell";
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
  if (!cell)
  {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
  }
  
  NSObject *s = [[NSObject alloc] init];
  
  s = [self.operators objectAtIndex:indexPath.row];
  cell.textLabel.text = [s valueForKey:@"name"];
  cell.detailTextLabel.text = [s valueForKey:@"sid"];
  
  return cell;
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
   NSIndexPath *indexPath = nil;
   indexPath = [self.tableView indexPathForSelectedRow];
   FormsView *fw = [segue destinationViewController];
   NSDictionary *chosenOperator = [_operators objectAtIndex:indexPath.row];
   NSString * chosenOperatorID = [[chosenOperator valueForKey:@"code"] stringValue];
   selector = [[NSMutableArray alloc] init];
   digitalLetter = [[NSMutableArray alloc] init];
  
   if ([[segue identifier] isEqualToString:@"ShowPaymentForm"])
   {
     for (NSDictionary *formsarr in self.operatorForm)
     {
       NSString *formID = [formsarr valueForKey:@"fcode"];
       if ([chosenOperatorID isEqualToString:formID])
       {
         //начинем разбирать экранную форму
         NSDictionary *fileReferenceSubParts = [formsarr valueForKey:@"ffileReferenceSubPart"];
         NSDictionary *screenSequence = [fileReferenceSubParts valueForKey:@"screenSequence"];
         NSArray *screens = [screenSequence valueForKey:@"screens"];
         
         //Здесь надо будет еще учесть что экранов может быть несколько
         for (int i = 0; i < [screens count]; i++)
         {
           NSDictionary *screenFields = [screens objectAtIndex:i];
           NSString *screenType = [screenFields valueForKey:@"type"];
           if ([screenType isEqualToString:@"selector"])
             {
               NSDictionary *sequence = [screenFields objectForKey:@"sequence"];
               NSArray *fields = [sequence objectForKey:@"fields"];
               NSDictionary *trueFields = [fields objectAtIndex:0];
               NSString *fid = [trueFields valueForKey:@"id"];
               BOOL exist = [[trueFields valueForKey:@"exist"] boolValue];
               NSString *title = [trueFields valueForKey:@"title"];
               NSDictionary *store = [trueFields objectForKey:@"store"];
               NSArray *items = [store objectForKey:@"items"];
               //Разбираем более глубокую вложенность screen в items
               for (int j = 0; j <= [items count] - 1; j++)
               {
                 NSString *titleItem = [NSString alloc];
                 NSDictionary* subItem = [items objectAtIndex:j];
                 if ((bool)[subItem valueForKey:@"enable"] == 1)
                 {
                   titleItem = [subItem valueForKey:@"title"];
                 }
                 NSDictionary *customData = [subItem objectForKey:@"customData"];
                 NSDictionary *sharpSequence = [customData objectForKey:@"#sequence"];
                 NSDictionary *screenSequence = [sharpSequence objectForKey:@"screenSequence"];
                 NSArray *screensItem = [screenSequence objectForKey:@"screens"];
                 NSDictionary *zeroIndexFields = [screensItem objectAtIndex:0];
                 NSDictionary *sequenceItem = [zeroIndexFields objectForKey:@"sequence"];
                 NSArray *trueFieldsItems = [sequenceItem valueForKey:@"fields"];
                 NSArray *fieldsItem = [trueFieldsItems objectAtIndex:0];
                 NSString *fieldSubTitle = [fieldsItem valueForKey:@"title"];
                 [selector addObject:[[[FormsInit alloc] init] sequence:sequence fields:fields trueFields:trueFields fid:fid exist:exist title:title store:store items:items titleItem:titleItem customData:customData sharpSequence:sharpSequence screensItem:screensItem sequenceItem:sequenceItem fieldsItem:fieldsItem fieldSubTitle:fieldSubTitle]];
               }
             }
          else
            if ([screenType isEqualToString:@"digital"] || [screenType isEqualToString:@"letter"])
            {
                NSDictionary *sequence = [screenFields objectForKey:@"sequence"];
                NSArray *fields = [sequence objectForKey:@"fields"];
                for (int j = 0; j < [fields count]; j++)
                  {
                    NSDictionary *trueFields = [fields objectAtIndex:j];
                    NSString *rid = [trueFields valueForKey:@"id"];
                    NSString *type = [trueFields valueForKey:@"type"];
                    BOOL exist = [[trueFields valueForKey:@"exist"] boolValue];
                    NSString *title = [trueFields valueForKey:@"title"];
                    NSString *help = [trueFields valueForKey:@"help"];
                    BOOL readonly = [[trueFields valueForKey:@"readOnly"] boolValue];
                    NSString *maxlength = [trueFields valueForKey:@"maxLength"];
                    BOOL secure = [[trueFields valueForKey:@"secure"] boolValue];
                    NSString *prefix = [trueFields valueForKey:@"prefix"];
                    NSString *postfix = [trueFields valueForKey:@"postfix"];
                    NSDictionary *validator = [trueFields objectForKey:@"validator"];
                    NSArray *rules = [validator objectForKey:@"rules"];
                    NSString *regexp = [rules objectAtIndex:0];
                    [digitalLetter addObject:[[[FormsInit alloc] init] trueFields:trueFields rid:rid type:type exist:exist title:title help:help readonly:readonly maxlength:maxlength secure:secure prefix:prefix postfix:postfix validator:validator rules:rules regexp:regexp]];
                  }
              }
      }
       // Читаем дополнительные поля - необязательные, поэтому закоментированы
       //NSArray *addFields = [screenSequence objectForKey:@"fields"];
       //NSDictionary *additionalFields = [addFields objectAtIndex:0];
       // NSString *key = [additionalFields valueForKey:@"key"];
       // NSString *keyTitle = [additionalFields valueForKey:@"value"];
       // NSString *valueTitle = [additionalFields valueForKey:@"valueTitle"];
       // NSString *flag = [additionalFields valueForKey:@"flag"];
         
       if ([digitalLetter count] == 0)
         {
           NSLog(@"digitalLetter is empty");
          }
       else
         {
           [fw setFormDataFields:digitalLetter];
           NSLog(@"digitalLetter is not empty");
         }
       if([selector count] == 0)
         {
           NSLog (@"selector is empty");
         }
       else
         {
           [fw setFormSelectors:selector];
           NSLog(@"selector is not empty");
         }
     }
   }
  }
  if (([digitalLetter count] == 0) && ([selector count] == 0))
    {
      [digitalLetter addObject:[[[FormsInit alloc] init] trueFields:nil rid:nil type:nil exist:nil title:@"Номер телефона" help:nil readonly:nil maxlength:@"9" secure:nil prefix:nil postfix:nil validator:nil rules:nil regexp:nil]];
      [fw setFormDataFields:digitalLetter];
    }
  [fw setOperatorTitle:[[self.operators objectAtIndex:indexPath.row] valueForKey:@"name"]];
}
@end
