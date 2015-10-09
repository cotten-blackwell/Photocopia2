//
//  DetailViewController.m
//  Photocopia
//
//  Created by Cotten Blackwell on 9/30/15.
//  Copyright © 2015 Cotten Blackwell. All rights reserved.
//

#import "DetailViewController.h"
#import "PhotoController.h"

@interface DetailViewController ()

@property (nonatomic) UIImageView *imageView;
@property (nonatomic) UIDynamicAnimator *animator;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //set a background color so we can see if the following statements are working...
    self.view.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.95];
    
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, -320.0, 320.0f, 320.0f)];
    [self.view addSubview:self.imageView];
    
    [PhotoController imageForPhoto:self.photo size:@"standard_resolution" completion:^(UIImage *image) {
        self.imageView.image = image;
    }];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(close)];
    [self.view addGestureRecognizer:tap];
    
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    UISnapBehavior *snap = [[UISnapBehavior alloc] initWithItem:self.imageView snapToPoint:self.view.center];
    [self.animator addBehavior:snap];
}

-(void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];

    CGSize size = self.view.bounds.size;
    CGSize imageSize = CGSizeMake(size.width, size.height);

    self.imageView.frame = CGRectMake(0.0, (size.height - imageSize.height)/2.0, imageSize.width, imageSize.height);

}


-(void)close {
    [self.animator removeAllBehaviors];
    
    UISnapBehavior *snap = [[UISnapBehavior alloc] initWithItem:self.imageView snapToPoint:CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMaxY(self.view.bounds) + 180.0f)];
    [self.animator addBehavior:snap];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
