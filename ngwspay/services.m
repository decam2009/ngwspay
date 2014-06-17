//
//  services.m
//  ngwspay
//
//  Created by Boris Kaloshin on 6/17/14.
//  Copyright (c) 2014 Boris Kaloshin. All rights reserved.
//
#define JSONFILE "http://wspay.ru/refs.json"

#import "services.h"

@interface services ()
{
  NSMutableData *webData;
  NSURLConnection *connection;
  NSMutableArray *arraySid;
  NSMutableArray *arrayName;
}
@end


@implementation services

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
    NSURL *url = [NSURL URLWithString:@JSONFILE];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    connection = [NSURLConnection connectionWithRequest:request delegate:self];
  
    arraySid = [[NSMutableArray alloc] init];
    arrayName = [[NSMutableArray alloc] init];
    if (connection)
      {
        webData = [[NSMutableData alloc] init];
      }
}

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
  [webData setLength:0];
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
  [webData appendData:data];
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
  NSLog(@"Fail with error");
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
  NSDictionary *allDataDictionary = [NSJSONSerialization JSONObjectWithData:webData options:0 error:nil];
  NSDictionary *dataUp = [allDataDictionary objectForKey:@"data"];
  NSDictionary *dataDown = [dataUp objectForKey:@"data"];
  NSArray *serviceType = [dataDown objectForKey:@"serviceTypes"];
  
  for (NSDictionary *diction in serviceType)
  {
    NSString *sid =  [[diction objectForKey:@"id"] stringValue];
    NSString *name = [diction objectForKey:@"name"];
    [arraySid addObject:sid];
    [arrayName addObject:name];
  }
  
  [[self tableView] reloadData];
}

//- (void)didReceiveMemoryWarning
//{
//    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
//}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [arraySid count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  static NSString* cellIdentifier = @"Cell";
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
  if (!cell)
  {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
  }
  cell.textLabel.text = [arrayName objectAtIndex:indexPath.row];
  cell.detailTextLabel.text = [arraySid objectAtIndex:indexPath.row];
  return cell;
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
