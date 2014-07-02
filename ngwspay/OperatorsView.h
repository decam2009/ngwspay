//
//  OperatorsView.h
//  ngwspay
//
//  Created by Boris Kaloshin on 6/19/14.
//  Copyright (c) 2014 Boris Kaloshin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OperatorsView : UITableViewController

@property (nonatomic, strong) NSArray *operators;
@property (nonatomic, strong) NSString *serviceTitle;
@property (nonatomic, strong) NSMutableArray *operatorForm;

@end
