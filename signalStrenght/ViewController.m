//
//  ViewController.m
//  signalStrenght
//
//  Created by ios on 09/09/17.
//  Copyright © 2017 ios. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UILabel *yourLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSTimer *timer = [NSTimer
                      scheduledTimerWithTimeInterval:(NSTimeInterval)(1.0)
                      target:self
                      selector:@selector(blink)
                      userInfo:nil
                      repeats:TRUE];
    blinkStatus = NO;
    
 
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)blink{
 

    if(blinkStatus == NO){
        _yourLabel.textColor = [UIColor whiteColor];
        blinkStatus = YES;
    }else {
        _yourLabel.textColor = [UIColor grayColor];
        blinkStatus = NO;
        
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
