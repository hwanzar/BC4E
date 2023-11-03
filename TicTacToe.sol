// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract TicTacToe {
    function isWinning(uint8[3][3] memory board) public pure returns (bool) {
        // Check rows for a win
        for (uint8 i = 0; i < 3; i++) {
            if (board[i][0] == 1 && board[i][1] == 1 && board[i][2] == 1) {
                return true; 
            }
            if (board[i][0] == 0 && board[i][1] == 0 && board[i][2] == 0) {
                return true; 
            }
        }
        for (uint8 j = 0; j < 3; j++) {
            if (board[0][j] == 1 && board[1][j] == 1 && board[2][j] == 1) {
                return true; 
            }
            if (board[0][j] == 0 && board[1][j] == 0 && board[2][j] == 0) {
                return true; 
            }
        }
        if (board[0][0] == 1 && board[1][1] == 1 && board[2][2] == 1) {
            return true; 
        }
        if (board[0][0] == 0 && board[1][1] == 0 && board[2][2] == 0) {
            return true; 
        }//cheochinh
        

        if (board[0][2] == 1 && board[1][1] == 1 && board[2][0] == 1) {
            return true; 
        }
        
        if (board[0][2] == 0 && board[1][1] == 0 && board[2][0] == 0) {
            return true; 
        }//cheophu

        return false;
    }


    function checkWin() public pure returns (bool) {
        uint8[3][3] memory board = [
            [1, 0, 0],
            [0, 0, 1],
            [0, 1, 1]
        ];
        return isWinning(board);
    }
}