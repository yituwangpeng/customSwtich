//
//  ADVerticalSwitch.m
//  TestPan
//
//  Created by yitu on 14-9-1.
//  Copyright (c) 2014年 yitu. All rights reserved.
//

#import "ADVerticalSwitch.h"
@interface ADVerticalSwitch ()
{
    float initialY;
}

@end
@implementation ADVerticalSwitch

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
        
        
        [self createSubviews:frame];
    }
    return self;
}

- (void)createSubviews:(CGRect)frame
{
    CGRect rect = frame;
    rect.origin.x = 0;
    rect.origin.y = 0;
    
    self.bgView = [[UIView alloc] initWithFrame:rect];
    if (self.closeBgImage) {
        self.bgView.backgroundColor = [UIColor colorWithPatternImage:self.closeBgImage];
    }else{
        self.bgView.backgroundColor = [UIColor redColor];
        
    }
    [self addSubview:self.bgView];
    
    rect.origin.x = 0;
    rect.origin.y = rect.size.height - rect.size.width;
    rect.size.height = rect.size.width;
    
    self.thumbView = [[UIView alloc] initWithFrame:rect];
    if (self.thumbCloseImage) {
        self.thumbView.backgroundColor = [UIColor colorWithPatternImage:self.thumbCloseImage];
    }else{
        self.thumbView.backgroundColor = [UIColor yellowColor];
        
    }
    [self addSubview:self.thumbView];
    
    //pan手势
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(coverPan:)];
    panGestureRecognizer.maximumNumberOfTouches = 1;
    panGestureRecognizer.minimumNumberOfTouches = 1;
    panGestureRecognizer.delegate = self;
    //tap
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(covertap:)];
    tapGestureRecognizer.delegate = self;
    
    self.thumbView.userInteractionEnabled = YES;//open userInterfaction
    [self.thumbView addGestureRecognizer:panGestureRecognizer];
    [self.thumbView addGestureRecognizer:tapGestureRecognizer];
    
    //initial state is off
    self.on = NO;
}
#pragma mark - gesture methods
//pan method
- (void)coverPan:(UIPanGestureRecognizer *)sender
{
    
    CGPoint translatedPoint = [sender translationInView:self];
    
    [sender setTranslation:CGPointMake(0, 0) inView:self];
    switch (sender.state) {
        case UIGestureRecognizerStateBegan:
            initialY  = self.thumbView.center.y;
            break;
            
        case UIGestureRecognizerStateChanged:
            
            if ( (sender.view.center.y + translatedPoint.y >= self.frame.size.width/2) && (sender.view.center.y + translatedPoint.y <= self.frame.size.height -self.frame.size.width/2)) {
                sender.view.center = CGPointMake(sender.view.center.x,sender.view.center.y + translatedPoint.y);
                
                [sender setTranslation:CGPointMake(0, 0) inView:self];
            }else{
                if(sender.view.center.y + translatedPoint.y > self.frame.size.height -self.frame.size.width/2){
                    sender.view.center = CGPointMake(self.frame.size.width/2, self.frame.size.height -self.frame.size.width/2);
                }else{
                    sender.view.center = CGPointMake(self.frame.size.width/2, self.frame.size.width/2);
                    
                }
                
                [sender setTranslation:CGPointMake(0, 0) inView:self];
            }
            
            break;
            
        case UIGestureRecognizerStateEnded: {
            if (sender.view.center.y <= self.frame.size.height/2) {
                if (initialY > self.frame.size.height/2) {
                    [self open];
                }
                [self setOn:YES animated:YES];
            }else{
                
                if (initialY < self.frame.size.height/2) {
                    [self close];
                }
                [self setOn:NO animated:YES];
            }
            
        }
        default:
            break;
    }
}
//tap method
- (void)covertap:(UITapGestureRecognizer *)sender
{
    initialY  = self.thumbView.center.y;
    if(initialY < self.frame.size.height/2){//关闭
        [self setOn:NO animated:YES];
        [self close];
    }else{//打开
        [self setOn:YES animated:YES];
        [self open];
    }
}
#pragma mark - callback
- (void)open
{
    if(self.target && self.selector)
    {
        [self.target performSelector:self.selector withObject:@(YES) afterDelay:0];
    }
}
- (void)close
{
    if(self.target && self.selector)
    {
        [self.target performSelector:self.selector withObject:@(NO) afterDelay:0];
    }
    
}

#pragma mark - setter  method

- (void)setOn:(BOOL)on animated:(BOOL)animated; // does not send action
{
    self.on = on;
    if(animated){
        [UIView animateWithDuration:0.2f animations:^{
            [self reloadViewWithState:on];
        } completion:^(BOOL finished) {
            
        }];
        
    }else{
        [self reloadViewWithState:on];
    }
}
#pragma mark - private method - reload view
- (void)reloadViewWithState:(BOOL)on
{
    if(on){
        self.thumbView.center = CGPointMake(self.thumbView.center.x ,self.frame.size.width/2);
        //bgview
        if (self.openBgImage) {
            self.bgView.backgroundColor = [UIColor colorWithPatternImage:self.openBgImage];
        }else if(self.closeBgImage){
            self.bgView.backgroundColor = [UIColor colorWithPatternImage:self.closeBgImage];
            
        }else{
            self.bgView.backgroundColor = [UIColor colorWithRed:0 green:1 blue:0
                                                          alpha:1];
        }
        //thumbview
        if (self.thumbOpenImage) {
            self.thumbView.backgroundColor = [UIColor colorWithPatternImage:self.thumbOpenImage];
        }else if(self.thumbCloseImage){
            self.thumbView.backgroundColor = [UIColor colorWithPatternImage:self.thumbCloseImage];
        }else{
            self.thumbView.backgroundColor = [UIColor colorWithRed:0 green:1 blue:0
                                                             alpha:1];
        }
        
    }else{
        self.thumbView.center = CGPointMake(self.thumbView.center.x,self.frame.size.height - self.frame.size.width/2);
        //bgview
        if (self.closeBgImage) {
            self.bgView.backgroundColor = [UIColor colorWithPatternImage:self.closeBgImage];
        }else if(self.openBgImage){
            self.bgView.backgroundColor = [UIColor colorWithPatternImage:self.openBgImage];
        }
        else{
            self.bgView.backgroundColor = [UIColor colorWithRed:1 green:0 blue:0
                                                          alpha:1];
        }
        
        //thumbview
        if (self.thumbCloseImage) {
            self.thumbView.backgroundColor = [UIColor colorWithPatternImage:self.thumbCloseImage];
        }else if(self.thumbOpenImage){
            self.thumbView.backgroundColor = [UIColor colorWithPatternImage:self.thumbOpenImage];
            
        }else{
            self.thumbView.backgroundColor = [UIColor colorWithRed:0 green:1 blue:0
                                                             alpha:1];
        }
        
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
