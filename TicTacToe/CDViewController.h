//
//  CDViewController.h
//  TicTacToe
//
//  Created by Chad Donohue on 3/21/14.
//  Copyright (c) 2014 Donohue. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CDBoard;

@interface CDViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *imagePosition1;
@property (weak, nonatomic) IBOutlet UIImageView *imagePosition2;
@property (weak, nonatomic) IBOutlet UIImageView *imagePosition3;
@property (weak, nonatomic) IBOutlet UIImageView *imagePosition4;
@property (weak, nonatomic) IBOutlet UIImageView *imagePosition5;
@property (weak, nonatomic) IBOutlet UIImageView *imagePosition6;
@property (weak, nonatomic) IBOutlet UIImageView *imagePosition7;
@property (weak, nonatomic) IBOutlet UIImageView *imagePosition8;
@property (weak, nonatomic) IBOutlet UIImageView *imagePosition9;

@property (nonatomic, strong) NSArray *imagePositions;
@property (strong, nonatomic) CDBoard *gameBoard;

@property (weak, nonatomic) IBOutlet UILabel *messageLabel;

@property (weak, nonatomic) IBOutlet UIImage *oImg;
@property (weak, nonatomic) IBOutlet UIImage *xImg;
@property (weak, nonatomic) IBOutlet UIImage *oWinImg;
@property (weak, nonatomic) IBOutlet UIImage *xWinImg;

@property BOOL isXTurn;
@property BOOL isGameOver;
@property (weak, nonatomic) IBOutlet UIButton *restartButton;

- (IBAction)restartGame:(id)sender;

@end
