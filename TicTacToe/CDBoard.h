//
//  CDBoard.h
//  TicTacToe
//
//  Created by Chad Donohue on 3/23/14.
//  Copyright (c) 2014 Donohue. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CDBoardCellState.h"

@interface CDBoard : NSObject

- (CDBoardCellState) cellStateAtRow:(NSInteger)row andColumn:(NSInteger)column;

- (BOOL) setCellState:(CDBoardCellState)cellState forRow:(NSInteger)row andColumn:(NSInteger)column;

- (void) clearBoard;

- (BOOL) isBoardFull;

- (NSArray *) checkForWinAtRow:(NSInteger)row andColumn:(NSInteger)column;

@end
