//
//  ViewController.m
//  TeslTableViewLinkage
//
//  Created by yoyo on 2019/10/23.
//  Copyright © 2019 yoyo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    
    NSArray *_leftArray;
    
    NSArray *_rightArray;
    
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _leftArray = [[NSArray alloc] initWithObjects:@"第一类",@"第二类",@"第三类",@"第四类",@"第五类",@"第六类",@"第七类",@"第八类", nil];
    
    _rightArray = [[NSArray alloc] initWithObjects:@"一",@"二",@"三",@"四",@"五",@"六",@"七",@"八",@"九",@"十",@"十一", nil];
    
    _leftTableView.delegate = self;
    _leftTableView.dataSource = self;
    
    _rightTableView.delegate = self;
    _rightTableView.dataSource = self;
    
    
    [_leftTableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:YES scrollPosition:UITableViewScrollPositionNone];
    
    
}


- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
    
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    if (tableView == _rightTableView) {
        
        return [_leftArray objectAtIndex:section];
        
    }
    
    return nil;
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    if (tableView == _rightTableView) {
        
        return [_leftArray count];
        
    }
    
    return 1;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (tableView == self.leftTableView) {
        
        return _leftArray.count;
        
    }
    
    else if (tableView == self.rightTableView) {
        
        return _rightArray.count;
        
    }
    
    return 1;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
    
    if (tableView == self.leftTableView) {
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"leftCell"];
        
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"leftCell"];
        }
        
        
        cell.textLabel.text = [_leftArray objectAtIndex:indexPath.row];
        
        return cell;
        
    }else {
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"rightCell"];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"rightCell"];
        }
        
        cell.textLabel.text = [_rightArray objectAtIndex:indexPath.row];;
        
        return cell;
        
    }
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (tableView == _leftTableView) {
        
        //        [_rightTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:indexPath.row] atScrollPosition:UITableViewScrollPositionTop animated:YES];
        
        [_rightTableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:indexPath.row] animated:YES scrollPosition:UITableViewScrollPositionTop];
        
    }
    
    else {
        
        [_leftTableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:indexPath.section inSection:0] animated:NO scrollPosition:UITableViewScrollPositionTop];
        
    }
    
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    
    NSLog(@"33333333");
    
    if (scrollView == _rightTableView) {
        
        NSIndexPath *indexPath = [[_rightTableView indexPathsForVisibleRows ] objectAtIndex:0];
        
        [_leftTableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:indexPath.section inSection:0] animated:NO scrollPosition:UITableViewScrollPositionNone];
        
    }
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    
    NSLog(@"33333333");
    
    if (scrollView == _rightTableView) {
        
        NSIndexPath *indexPath = [[_rightTableView indexPathsForVisibleRows] objectAtIndex:0];
        
        [_leftTableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:indexPath.section inSection:0] animated:NO scrollPosition:UITableViewScrollPositionNone];
        
    }
    
}

//-(void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView {
//    
//    NSLog(@"33333333");
//    
//    if (scrollView == _rightTableView) {
//        
//        NSIndexPath *indexPath = [[_rightTableView indexPathsForVisibleRows] objectAtIndex:0];
//        
//        [_leftTableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:indexPath.section inSection:0] animated:NO scrollPosition:UITableViewScrollPositionNone];
//        
//    }
//    
//}
//
////滑动停止时执行
//-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
//    
//    NSLog(@"33333333");
//    
//    if (scrollView == _rightTableView) {
//        
//        NSIndexPath *indexPath = [[_rightTableView indexPathsForVisibleRows] objectAtIndex:0];
//        
//        [_leftTableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:indexPath.section inSection:0] animated:NO scrollPosition:UITableViewScrollPositionNone];
//        
//    }
//    
//}
@end
