//
//  ADRootViewController.m
//  TestPan
//
//  Created by yitu on 14-7-26.
//  Copyright (c) 2014年 yitu. All rights reserved.
//

#import "ADRootViewController.h"
#import "CustomeSwitch.h"
#import "ADHorizontalSwitch.h"
#import "ADVerticalSwitch.h"
@interface ADRootViewController ()
{
    UIView *testView;
    float initialY;
}
@end

@implementation ADRootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    ADHorizontalSwitch *cusSwitch = [[ADHorizontalSwitch alloc] initWithFrame:CGRectMake(20, 50, 402/2, 236/2)
                                                    thumbCloseImage:[UIImage imageNamed:@"switch_button_moon_big"]
                                                     thumbOpenImage:[UIImage imageNamed:@"switch_button_sun_big"]
                                                       closeBgImage:[UIImage imageNamed:@"switch_bg_off_big"]
                                                        openBgImage:[UIImage imageNamed:@"switch_bg_on_big"]];
   
//   [cusSwitch setOn:YES animated:NO];
    [cusSwitch addTarget:self selector:@selector(ifOpenHoriSwitch:)];
   [self.view addSubview:cusSwitch];
    
    
    ADVerticalSwitch *cusSwitch2 = [[ADVerticalSwitch alloc] initWithFrame:CGRectMake(20, 300, 236/2, 402/2)
                                                              thumbCloseImage:[UIImage imageNamed:@"switch_button_moon_big"]
                                                               thumbOpenImage:[UIImage imageNamed:@"switch_button_sun_big"]
                                                                 closeBgImage:[UIImage imageNamed:@"switch_bg_off_big1"]
                                                                  openBgImage:[UIImage imageNamed:@"switch_bg_on_big1"]];
    
 
    [cusSwitch2 addTarget:self selector:@selector(ifOpenVertiSwitch:)];

    [self.view addSubview:cusSwitch2];

    
}
- (void)ifOpenHoriSwitch:(id)obj
{
    if([obj boolValue] == YES){
        NSLog(@"水平开关打开");
    }else{
        NSLog(@"水平开关关闭");

    }
}
- (void)ifOpenVertiSwitch:(id)obj
{
    if([obj boolValue] == YES){
        NSLog(@"垂直开关打开");
    }else{
        NSLog(@"垂直开关关闭");
        
    }

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
