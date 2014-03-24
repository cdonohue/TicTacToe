//
//  CDBoard.m
//  TicTacToe
//
//  Created by Chad Donohue on 3/23/14.
//  Copyright (c) 2014 Donohue. All rights reserved.
//

#import "CDBoard.h"

@implementation CDBoard {
  NSUInteger board[3][3];
}

- (id) init {
  if (self = [super init]) {
    [self clearBoard];
  }
  
  return self;
}

- (CDBoardCellState) cellStateAtRow:(NSInteger)row andColumn:(NSInteger)column {
  return board[row][column];
}

- (BOOL) setCellState:(CDBoardCellState)cellState forRow:(NSInteger)row andColumn:(NSInteger)column {
  if ([self cellStateAtRow:row andColumn:column] == BoardCellStateEmpty) {
    board[row][column] = cellState;
    return YES;
  } else {
    return NO;
  }
}

- (BOOL) isBoardFull {
  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      if (board[i][j] == BoardCellStateEmpty) {
        return NO;
      }
    }
  }
  return YES;
}

- (void) clearBoard {
  memset(board, BoardCellStateEmpty, sizeof(NSUInteger) * 3 * 3);
}

- (NSArray *) checkForWinAtRow:(NSInteger)row andColumn:(NSInteger)column {
  CDBoardCellState currentMoveState = [self cellStateAtRow:row andColumn:column];
  // check row
  for (int i = 0; i < 3; i++) {
    if (board[row][i] != currentMoveState) {
      break;
    }
    
    if (i == 2) {
      return @[
               @[[NSNumber numberWithInt:row], [NSNumber numberWithInt:0]],
               @[[NSNumber numberWithInt:row], [NSNumber numberWithInt:1]],
               @[[NSNumber numberWithInt:row], [NSNumber numberWithInt:2]]
             ];
    }
  }
  
  // check column
  for (int i = 0; i < 3; i++) {
    if (board[i][column] != currentMoveState) {
      break;
    }
    
    if (i == 2) {
      return @[
               @[[NSNumber numberWithInt:0], [NSNumber numberWithInt:column]],
               @[[NSNumber numberWithInt:1], [NSNumber numberWithInt:column]],
               @[[NSNumber numberWithInt:2], [NSNumber numberWithInt:column]]
               ];
    }
  }

  
  // check diagonals
  if (row == column) {
    for (int i = 0; i < 3; i++) {
      if (board[i][i] != currentMoveState) {
        break;
      }
      
      if (i == 2) {
        return @[
                 @[[NSNumber numberWithInt:0], [NSNumber numberWithInt:0]],
                 @[[NSNumber numberWithInt:1], [NSNumber numberWithInt:1]],
                 @[[NSNumber numberWithInt:2], [NSNumber numberWithInt:2]]
                 ];
      }
    }
  }
  
  for (int i = 0; i < 3; i++) {
    if (board[i][2-i] != currentMoveState) {
      break;
    }
    
    if (i == 2) {
      return @[
               @[[NSNumber numberWithInt:0], [NSNumber numberWithInt:2]],
               @[[NSNumber numberWithInt:1], [NSNumber numberWithInt:1]],
               @[[NSNumber numberWithInt:2], [NSNumber numberWithInt:0]]
               ];
    }
  }

  return nil;
}

@end
