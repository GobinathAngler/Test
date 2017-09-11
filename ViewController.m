//
//  ViewController.m
//  autolay
//
//  Created by ios on 29/08/17.
//  Copyright © 2017 ios. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UITableView *myTblView;
@property (strong, nonatomic) IBOutlet UIImageView *imgView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.myTblView registerNib:[UINib nibWithNibName:NSStringFromClass([TableViewCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([TableViewCell class])];
    

    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)action:(id)sender {
    
    //1
    NSURL *url = [NSURL URLWithString:
                  @"http://upload.wikimedia.org/wikipedia/commons/7/7f/Williams_River-27527.jpg"];
    
    // 2
    NSURLSessionDownloadTask *downloadPhotoTask = [[NSURLSession sharedSession]
                                                   downloadTaskWithURL:url completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error) {
                                                       // 3
                                                       UIImage *downloadedImage = [UIImage imageWithData:
                                                                                   [NSData dataWithContentsOfURL:location]];
                                                       
                                                       _imgView.image = downloadedImage;
                                                       
                                                   }];
    
    
    
    // 4	
    [downloadPhotoTask resume];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 10;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    TableViewCell *aCell = [tableView dequeueReusableCellWithIdentifier: NSStringFromClass([TableViewCell class])];
    aCell.topGrayView.backgroundColor = [UIColor lightGrayColor];
    aCell.cellImgView.image = [UIImage imageNamed:@"7.jpeg"];
    return aCell;
    
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return UITableViewAutomaticDimension;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
