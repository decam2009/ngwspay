//
//  services.m
//  ngwspay
//
//  Created by Boris Kaloshin on 6/17/14.
//  Copyright (c) 2014 Boris Kaloshin. All rights reserved.
//
#define JSONFILE "http://wspay.ru/refs.json"
#define JSONLOCAL "/Users/BORIS/Desktop/Telepay/refs.json"

#import "ServicesView.h"
#import "ServicesInit.h"
#import "OperatorsInit.h"
#import "OperatorsView.h"
#import "FormsInit.h"

@interface ServicesView ()
{
  NSMutableData *webData;
  NSMutableData *localData;
  NSURLConnection *connection;
  NSMutableArray *arrayServiceTypes, *arrayServices, *arrayForms;
  NSArray *sortedArrayServiceTypes;
  NSObject *o;
}
@end

@implementation ServicesView

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self)
    {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
   // NSURL *url = [NSURL URLWithString:@JSONFILE];
   // NSURLRequest *request = [NSURLRequest requestWithURL:url];
   // connection = [NSURLConnection connectionWithRequest:request delegate:self];
  
    arrayServiceTypes = [[NSMutableArray alloc] init];
    arrayServices = [[NSMutableArray alloc] init];
    arrayForms = [[NSMutableArray alloc] init];
    localData = [NSMutableData dataWithContentsOfFile:@JSONLOCAL];
  
 ////-----------------------------------Кусок ниже для работы с локальным файлом
  NSDictionary *allDataDictionary = [NSJSONSerialization JSONObjectWithData:localData options:0 error:nil];
  NSDictionary *dataUp = [allDataDictionary objectForKey:@"data"];
  NSDictionary *dataDown = [dataUp objectForKey:@"data"];
  NSArray *serviceType = [dataDown objectForKey:@"serviceTypes"];
  NSArray *services = [dataDown objectForKey:@"services"];
  NSArray *forms = [dataDown objectForKey:@"forms"];
  
  for (NSDictionary *diction in serviceType)
  {
    // Читаем типы сервисов
    NSString *sidServiceType =  [[diction objectForKey:@"id"] stringValue];
    NSString *name = [diction objectForKey:@"name"];
    NSString *sortOrder = [diction objectForKey:@"sortOrder"];
    NSString *logo = [diction objectForKey:@"logo"];
    NSString *level = [[diction objectForKey:@"level"] stringValue];
    if ([level isEqualToString:@"1"])
    {
      [arrayServiceTypes addObject:[[ServicesInit alloc]initService:sidServiceType name:name sortOrder:sortOrder logo:logo level:level]];
    }
    else
    {
      continue;
    }
  }
  NSSortDescriptor *sortOrderDescriptor = [[NSSortDescriptor alloc] initWithKey:@"sortOrder" ascending:YES];
  NSArray *discriptors = [NSArray arrayWithObjects:sortOrderDescriptor, nil];
  sortedArrayServiceTypes = [arrayServiceTypes sortedArrayUsingDescriptors:discriptors];
  
  // Читаем сервисы
  
  for (NSDictionary *diction in services)
  {
    NSString *sidService = [[diction objectForKey:@"id"] stringValue];
    NSString *name = [diction objectForKey:@"name"];
    NSString *altName = [diction objectForKey:@"altName"];
    NSString *fullName = [diction objectForKey:@"fullName"];
    NSString *image = [diction objectForKey:@"image"];
    NSString *verifyType = [diction objectForKey:@"verifyType"];
    NSString *legalName = [diction objectForKey:@"legalName"];
    NSString *inn = [diction objectForKey:@"inn"];
    NSString *minSum = [diction objectForKey:@"minSum"];
    NSString *maxSum = [diction objectForKey:@"maxSum"];
    NSString *support = [diction objectForKey:@"support"];
    NSString *system = [diction objectForKey:@"system"];
    NSString *code = [diction objectForKey:@"code"];
    NSString *active = [diction objectForKey:@"active"];
    NSDictionary *serviceType = [diction objectForKey:@"serviceType"];
    NSDictionary *area = [diction objectForKey:@"area"];
    NSDictionary *providerType = [diction objectForKey:@"providerType"];
    
    [arrayServices addObject:[[OperatorsInit alloc] initOperator:sidService name:name altName:altName fullName:fullName image:image verifyType:verifyType legalName:legalName inn:inn minSum:minSum maxSum:maxSum support:support system:system code:code active:active serviceType:serviceType area:area providerType:providerType]];
  }
  
  //Читаем формы для сервисов
  for (NSDictionary *diction in forms)
  {
    NSString *fid = [diction objectForKey:@"id"];
    NSString *fcode = [diction objectForKey:@"code"];
    NSDictionary *ffilereferenceSubPart = [diction objectForKey:@"fileReferenceSubPart"];
    [arrayForms addObject:[[FormsInit alloc] initForms:fid code:fcode fileReferenceSubPart:ffilereferenceSubPart]];
  }
  [[self tableView] reloadData];
  
  ////-----------------------------------Конец работы с локальным файлом
  
  
////-----------------------------------Кусок ниже для работы с файлом в сети
  
 //   if (connection)
 //     {
 //       webData = [[NSMutableData alloc] init];
 //     }
}

/*-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
  [webData setLength:0];
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
  [webData appendData:nil];
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
  NSLog(@"Fail with error");
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
  NSDictionary *allDataDictionary = [NSJSONSerialization JSONObjectWithData:localData options:0 error:nil];
  NSDictionary *dataUp = [allDataDictionary objectForKey:@"data"];
  NSDictionary *dataDown = [dataUp objectForKey:@"data"];
  NSArray *serviceType = [dataDown objectForKey:@"serviceTypes"];
  NSArray *services = [dataDown objectForKey:@"services"];
  NSArray *forms = [dataDown objectForKey:@"forms"];
  
  for (NSDictionary *diction in serviceType)
  {
    // Читаем типы сервисов
    NSString *sidServiceType =  [[diction objectForKey:@"id"] stringValue];
    NSString *name = [diction objectForKey:@"name"];
    NSString *sortOrder = [diction objectForKey:@"sortOrder"];
    NSString *logo = [diction objectForKey:@"logo"];
    NSString *level = [[diction objectForKey:@"level"] stringValue];
    if ([level isEqualToString:@"1"])
    {
      [arrayServiceTypes addObject:[[ServicesInit alloc]initService:sidServiceType name:name sortOrder:sortOrder logo:logo level:level]];
    }
    else
    {
      continue;
    }
  }
  NSSortDescriptor *sortOrderDescriptor = [[NSSortDescriptor alloc] initWithKey:@"sortOrder" ascending:YES];
  NSArray *discriptors = [NSArray arrayWithObjects:sortOrderDescriptor, nil];
  sortedArrayServiceTypes = [arrayServiceTypes sortedArrayUsingDescriptors:discriptors];
  
    // Читаем сервисы
  
  for (NSDictionary *diction in services)
  {
    NSString *sidService = [[diction objectForKey:@"id"] stringValue];
    NSString *name = [diction objectForKey:@"name"];
    NSString *altName = [diction objectForKey:@"altName"];
    NSString *fullName = [diction objectForKey:@"fullName"];
    NSString *image = [diction objectForKey:@"image"];
    NSString *verifyType = [diction objectForKey:@"verifyType"];
    NSString *legalName = [diction objectForKey:@"legalName"];
    NSString *inn = [diction objectForKey:@"inn"];
    NSString *minSum = [diction objectForKey:@"minSum"];
    NSString *maxSum = [diction objectForKey:@"maxSum"];
    NSString *support = [diction objectForKey:@"support"];
    NSString *system = [diction objectForKey:@"system"];
    NSString *code = [diction objectForKey:@"code"];
    NSString *active = [diction objectForKey:@"active"];
    NSDictionary *serviceType = [diction objectForKey:@"serviceType"];
    NSDictionary *area = [diction objectForKey:@"area"];
    NSDictionary *providerType = [diction objectForKey:@"providerType"];
    
    [arrayServices addObject:[[OperatorsInit alloc] initOperator:sidService name:name altName:altName fullName:fullName image:image verifyType:verifyType legalName:legalName inn:inn minSum:minSum maxSum:maxSum support:support system:system code:code active:active serviceType:serviceType area:area providerType:providerType]];
  }
  
  //Читаем формы для сервисов
  for (NSDictionary *diction in forms)
  {
    NSString *fid = [diction objectForKey:@"id"];
    NSString *fcode = [diction objectForKey:@"code"];
    NSDictionary *ffilereferenceSubPart = [diction objectForKey:@"fileReferenceSubPart"];
    [arrayForms addObject:[[FormsInit alloc] initForms:fid code:fcode fileReferenceSubPart:ffilereferenceSubPart]];
  }
  [[self tableView] reloadData];
}*/
 ////-----------------------------------Конец работы с фалом в сети

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [arrayServiceTypes count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  static NSString* cellIdentifier = @"Cell";
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
  if (!cell)
  {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
  }
  o = [[NSObject alloc] init];
  o = [sortedArrayServiceTypes objectAtIndex:indexPath.row];
  
  cell.textLabel.text = [o valueForKey:@"name"];
  cell.detailTextLabel.text = [o valueForKey:@"sid"];
  return cell;
}

#pragma mark - SearchBar
-(void) searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{

}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
  if ([[segue identifier] isEqualToString:@"ShowOperators"])
    {
      OperatorsView *ov = [segue destinationViewController];
      
      NSIndexPath *indexPath = nil;
      NSObject *chosenServiceType = nil;
      NSMutableArray *selectedOperators = [[NSMutableArray alloc] init];
      indexPath = [self.tableView indexPathForSelectedRow];
      
      chosenServiceType = arrayServiceTypes[indexPath.row];
      NSString *chosenServiceTypeID = [chosenServiceType valueForKey:@"sid"];
      NSString *chosenServiceTypeName = [chosenServiceType valueForKey:@"name"];
      for (NSDictionary *sarr in arrayServices)
      {
        NSDictionary *operatorServiceType = [sarr valueForKey:@"serviceType"];
        NSString *operatorServiceTypeID = [[operatorServiceType valueForKey:@"id"] stringValue];
        BOOL operatorStatus = [[sarr valueForKey:@"active"] boolValue];
        //NSString *operatorSID = [sarr valueForKey:@"sid"];
        
        if ([operatorServiceTypeID isEqualToString:chosenServiceTypeID] && operatorStatus == TRUE)
          //&& [operatorSID isEqualToString:@"1199"])
        {
          [selectedOperators addObject:sarr];
        }
      }
      [ov setOperators:selectedOperators];
      [ov setServiceTitle:chosenServiceTypeName];
      [ov setOperatorForm:arrayForms];
    }
}


@end
