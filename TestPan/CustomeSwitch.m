//
//  CustomeSwetch.m
//  TestPan
//
//  Created by yitu on 14-9-1.
//  Copyright (c) 2014年 yitu. All rights reserved.
//

#import "CustomeSwitch.h"
@interface CustomeSwitch ()
{
    
}

@end

@implementation CustomeSwitch

#pragma mark - initial method
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
    }
    return self;
}
/**
 *  custome initial method
 *
 *  @param frame        frame
 *  @param closeImage   thumb close image
 *  @param openImage    thumb open image
 *  @param closeBgImage backgroud close image
 *  @param openBgImage  backgroud open image
 */
- (id)initWithFrame:(CGRect)frame
    thumbCloseImage:(UIImage *)closeImage
     thumbOpenImage:(UIImage *)openImage
       closeBgImage:(UIImage *)closeBgImage
        openBgImage:(UIImage *)openBgImage
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        if (closeImage) {
            self.thumbCloseImage = closeImage;
        }
        if (openImage) {
            self.thumbOpenImage = openImage;
        }
        if (closeBgImage) {
            self.closeBgImage = closeBgImage;
        }
        if (openBgImage) {
            self.openBgImage = openBgImage;
        }
        self.on = NO;
    }
    return self;
}

#pragma mark - interface method implement
/**
 *  change switch state
 *
 *  @param on       on or off
 *  @param animated if animate
 */
- (void)setOn:(BOOL)on animated:(BOOL)animated// does not send action

{
    self.on = on;
}
/**
 *  target action callback
 *
 *  @param target   target
 *  @param selector callback selector
 */
- (void)addTarget:(id)target selector:(SEL)selector
{
    self.target = target;
    self.selector = selector;
}

#pragma mark - setter && getter
//thumb
- (void)setThumbCloseImage:(UIImage *)thumbCloseImage
{
    _thumbCloseImage = thumbCloseImage;
    if(!self.on){
        self.thumbView.backgroundColor = [UIColor colorWithPatternImage:thumbCloseImage];
    }
}
- (void)setThumbOpenImage:(UIImage *)thumbOpenImage
{
    _thumbOpenImage = thumbOpenImage;
    if(self.on){
        self.thumbView.backgroundColor = [UIColor colorWithPatternImage:thumbOpenImage];
    }

}

//bg
- (void)setOpenBgImage:(UIImage *)openBgImage
{
    _openBgImage = openBgImage;
    if(self.on){
        self.bgView.backgroundColor = [UIColor colorWithPatternImage:openBgImage];
    }
}
- (void)setCloseBgImage:(UIImage *)closeBgImage
{
    _closeBgImage = closeBgImage;
    if(!self.on){
        self.bgView.backgroundColor = [UIColor colorWithPatternImage:closeBgImage];
    }

}
/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */

@end
