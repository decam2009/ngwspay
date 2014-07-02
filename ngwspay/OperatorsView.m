//
//  OperatorsView.m
//  ngwspay
//
//  Created by Boris Kaloshin on 6/19/14.
//  Copyright (c) 2014 Boris Kaloshin. All rights reserved.
//

#import "OperatorsView.h"

@interface OperatorsView ()

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
   NSDictionary *chosenOperator = [_operators objectAtIndex:indexPath.row];
   NSString * chosenOperatorID = [[chosenOperator valueForKey:@"code"] stringValue];
   int i = 0; //Удалить потом надо
  
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
         NSArray *screens = [screenSequence objectForKey:@"screens"];
         
         //Здесь надо будет еще учесть что эеранов может быть несколько
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
             }
          else
            if ([screenType isEqualToString:@"digital"] || [screenType isEqualToString:@"letter"])
              {
                NSDictionary *sequence = [screenFields objectForKey:@"sequence"];
                NSArray *fields = [sequence objectForKey:@"fields"];
                for (int j = 0; j < [fields count]; j++)
                  {
                    NSDictionary *trueFields = [fields objectAtIndex:0];
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
                  }
              }
           }
       i++; //Удалить потом надо
         
       // Читаем дополнительные поля
       NSArray *addFields = [screenSequence objectForKey:@"fields"];
       NSDictionary *additionalFields = [addFields objectAtIndex:0];
       NSString *key = [additionalFields valueForKey:@"key"];
       NSString *keyTitle = [additionalFields valueForKey:@"value"];
       NSString *valueTitle = [additionalFields valueForKey:@"valueTitle"];
       NSString *flag = [additionalFields valueForKey:@"flag"];
     }
       
   }
  }
}
@end
