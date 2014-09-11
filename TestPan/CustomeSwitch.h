//
//  CustomeSwetch.h
//  TestPan
//
//  Created by yitu on 14-9-1.
//  Copyright (c) 2014年 yitu. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CustomeSwitch : UIView<UIGestureRecognizerDelegate>

//property
@property(nonatomic,strong)UIImage *thumbCloseImage;
@property(nonatomic,strong)UIImage *thumbOpenImage;
@property(nonatomic,strong)UIImage *closeBgImage;
@property(nonatomic,strong)UIImage *openBgImage;
@property(nonatomic,strong)UIView *bgView;
@property(nonatomic,strong)UIView *thumbView;
@property(nonatomic,weak)id target;
@property(nonatomic,assign)SEL selector;
//methods
//initial method
/**
 *  custome initial method
 *
 *  @param frame        frame
 *  @param closeImage   thumb close image must set value
 *  @param openImage    thumb open image
 *  @param closeBgImage backgroud close image must set value
 *  @param openBgImage  backgroud open image
 */
- (id)initWithFrame:(CGRect)frame
    thumbCloseImage:(UIImage *)closeImage
     thumbOpenImage:(UIImage *)openImage
       closeBgImage:(UIImage *)closeBgImage
        openBgImage:(UIImage *)openBgImage;

/**
 *  property switch state
 */
@property(nonatomic,getter=isOn) BOOL on;
/**
 *  change switch state
 *
 *  @param on       on or off
 *  @param animated if animate
 */
- (void)setOn:(BOOL)on animated:(BOOL)animated; // does not send action
/**
 *  target action callback
 *
 *  @param target   target
 *  @param selector callback selector
 */
- (void)addTarget:(id)target selector:(SEL)selector;
@end
