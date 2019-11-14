//
//  ViewController.h
//  TeslTableViewLinkage
//
//  Created by yoyo on 2019/10/23.
//  Copyright © 2019 yoyo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITableView *leftTableView;

@property (weak, nonatomic) IBOutlet UITableView *rightTableView;
@end

