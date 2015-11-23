//
//  ViewController.m
//  RotationView
//
//  Created by Luo_Pengfei on 15/10/24.
//  Copyright © 2015年 骆朋飞. All rights reserved.
//

#import "ViewController.h"
#import "UISingleRotationGestureRecognizer.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *testView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.testView.layer.cornerRadius = 120;
    
    UISingleRotationGestureRecognizer *rotationGesture = [[UISingleRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotationAction:)];
    [self.testView addGestureRecognizer:rotationGesture];
}

-(void)rotationAction:(UISingleRotationGestureRecognizer*)rotation {
    rotation.view.transform = CGAffineTransformRotate(rotation.view.transform, rotation.rotation);
    rotation.rotation = 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
