//
//  ViewController.m
//  Amenities
//
//  Created by Shaik Ghouse Basha on 18/03/16.
//  Copyright © 2016 Shaik Ghouse Basha. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate>
@property (strong, nonatomic) IBOutlet UIScrollView *mScrollView;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *mHotelWidthConstraint;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *mRoommWidthConstraint;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *mFoodWidthConstraint;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *mMainWidthConstraint;
@property (strong, nonatomic) IBOutlet UILabel *mAniLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    self.mHotelWidthConstraint.constant = self.mRoommWidthConstraint.constant = self.mFoodWidthConstraint.constant = self.view.frame.size.width;
    self.mMainWidthConstraint.constant  = self.view.frame.size.width * 3.0;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (IBAction)buttonAction:(id)sender {
    
    CGRect frame = self.mScrollView.frame;
    frame.origin.x = frame.size.width * [sender tag];
    frame.origin.y = 0;
    [self.mScrollView scrollRectToVisible:frame animated:YES];
    NSUInteger pageNo = [sender tag];
    [self animateLabel:pageNo];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    NSUInteger pageNo = (self.mScrollView.contentOffset.x+50) / (self.view.frame.size.width);
    
    [self animateLabel:pageNo];
}

-(void)animateLabel:(NSUInteger)pageNo {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:0.2
                              delay:0
                            options:UIViewAnimationOptionCurveEaseIn
                         animations:^{
                             // moves label down 100 units in the y axis
                             CGFloat labelWidth = self.mAniLabel.frame.size.width * pageNo;
                             self.mAniLabel.transform = CGAffineTransformMakeTranslation(labelWidth, 0);
                         }
                         completion:^(BOOL finished) {
                         }];
    });
}
@end
