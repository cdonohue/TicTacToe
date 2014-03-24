//
//  CDViewController.m
//  TicTacToe
//
//  Created by Chad Donohue on 3/21/14.
//  Copyright (c) 2014 Donohue. All rights reserved.
//

#import "CDViewController.h"
#import "CDBoard.h"
#import "CDBoardCellState.h"

@interface CDViewController ()

@end

@implementation CDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
  self.gameBoard = [[CDBoard alloc] init];
  
  self.oImg = [UIImage imageNamed:@"otile"];
  self.xImg = [UIImage imageNamed:@"xtile"];
  self.oWinImg = [UIImage imageNamed:@"otileWin"];
  self.xWinImg = [UIImage imageNamed:@"xtileWin"];
  
  self.imagePositions = @[
                    @[self.imagePosition1,
                      self.imagePosition2,
                      self.imagePosition3],
                    @[self.imagePosition4,
                      self.imagePosition5,
                      self.imagePosition6],
                    @[self.imagePosition7,
                      self.imagePosition8,
                      self.imagePosition9],
                      ];
  self.isXTurn = YES;
  self.isGameOver = NO;
  self.messageLabel.text = @"X's turn";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) makeMoveAtRow:(NSUInteger)row andColumn:(NSUInteger)column withImage:(UIImageView *)imageView {
  if ([self.gameBoard setCellState:(self.isXTurn) ? BoardCellStateCross : BoardCellStateNought forRow:row andColumn:column]) {
    CGRect frame = imageView.frame;
    imageView.frame = CGRectMake(frame.origin.x, frame.origin.y - 8, frame.size.width, frame.size.height);
    imageView.alpha = 0;
    imageView.image = (self.isXTurn) ? self.xImg : self.oImg;
    [UIView animateWithDuration:0.25 animations:^{
      imageView.alpha = 1;
      CGRect frame = imageView.frame;
      imageView.frame = CGRectMake(frame.origin.x, frame.origin.y + 8, frame.size.width, frame.size.height);
    }];
    
    // check for win or tie
    NSArray *winTiles = [self.gameBoard checkForWinAtRow:row andColumn:column];
    if (winTiles != nil) {
      for (NSArray *winTile in winTiles) {
        NSNumber *x = winTile[0];
        NSNumber *y = winTile[1];
        NSArray *imageRow = [self.imagePositions objectAtIndex:[x intValue]];
        UIImageView *tile = [imageRow objectAtIndex:[y intValue]];
        tile.image = (self.isXTurn) ? self.xWinImg : self.oWinImg;
        self.messageLabel.text = (self.isXTurn) ? @"X's win!" : @"O's win!";
      }
      self.isGameOver = YES;
    } else if ([self.gameBoard isBoardFull]) {
      self.messageLabel.text = @"Tie game...";
      self.isGameOver = YES;
    } else {
      self.isXTurn = !self.isXTurn;
      self.messageLabel.text = (self.isXTurn) ? @"X's turn" : @"O's turn";
    }
  }
}

- (void) removeTile:(UIImageView *)imageView {
  [UIView animateWithDuration:0.25 animations:^{
    imageView.alpha = 0;
  }];
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
  if (!self.isGameOver) {
    UITouch *touch = [[event allTouches] anyObject];
    for (int i = 0; i < self.imagePositions.count; i++) {
      NSArray *row = [self.imagePositions objectAtIndex:i];
      for (int j = 0; j < row.count; j++) {
        UIImageView *imageView = [row objectAtIndex:j];
        if (CGRectContainsPoint(imageView.frame, [touch locationInView:self.view])) {
          [self makeMoveAtRow:(NSUInteger)i andColumn:(NSUInteger)j withImage:imageView];
        }
      }
    }
  }
}

- (IBAction)restartGame:(id)sender {
  for (int i = 0; i < self.imagePositions.count; i++) {
    NSArray *row = [self.imagePositions objectAtIndex:i];
    for (int j = 0; j < row.count; j++) {
      [self removeTile:[row objectAtIndex:j]];
    }
  }

  [self.gameBoard clearBoard];
  self.isGameOver = NO;
  self.isXTurn = !self.isXTurn;
  self.messageLabel.text = (self.isXTurn) ? @"X's turn" : @"O's turn";
}

@end
