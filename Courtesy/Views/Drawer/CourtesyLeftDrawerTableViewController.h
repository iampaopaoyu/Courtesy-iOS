//
//  CourtesyLeftDrawerTableViewController.h
//  Courtesy
//
//  Created by i_82 on 2016-02-20.
//  Copyright (c) 2016 82Flex. All rights reserved.
//

#import "CourtesyQRScanViewController.h"

@interface CourtesyLeftDrawerTableViewController : UITableViewController <CourtesyQRCodeScanDelegate>
- (void)shortcutScan;
- (void)shortcutCompose;
@end
