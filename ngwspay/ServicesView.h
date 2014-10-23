//
//  services.h
//  ngwspay
//
//  Created by Boris Kaloshin on 6/17/14.
//  Copyright (c) 2014 Boris Kaloshin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ServicesView : UITableViewController <NSURLConnectionDataDelegate, UISearchDisplayDelegate, UISearchBarDelegate>

@property (nonatomic, strong) IBOutlet UISearchBar* searchBar;
@property (nonatomic, strong) NSArray* filteredData;
@end

