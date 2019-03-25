//
//  ViewController.m
//  ZAGradientRectView
//
//  Created by zhiang on 2019/3/25.
//  Copyright © 2019 fugui. All rights reserved.
//

#import "ViewController.h"
#import "ZAGradientRectView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    ZAGradientRectView *v1 = [[ZAGradientRectView alloc] initWithFrame:CGRectMake(50, 50, 200, 200)];
    [self.view addSubview:v1];
    [v1 setRate:0.75 startColor:[UIColor colorWithRed:255/255.0 green:162/255.0 blue:84/255.0 alpha:1] endColor:[UIColor colorWithRed:255/255.0 green:217/255.0 blue:80/255.0 alpha:1]];
    
    ZAGradientRectView *v2 = [[ZAGradientRectView alloc] initWithFrame:CGRectMake(50, 300, 200, 200)];
    [self.view addSubview:v2];
    [v2 setRate:0.33 startColor:[UIColor colorWithRed:60/255.0 green:165/255.0 blue:244/255.0 alpha:1] endColor:[UIColor colorWithRed:104/255.0 green:192/255.0 blue:255/255.0 alpha:1]];
    
}


@end
