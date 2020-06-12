/*!
   \file q_learning.h
   \author MMteam
   \brief Header file to declare the functions used to implement the MM brain.
   \details This header file contains only declarations of the functions.
   \see q_learning.c
   \date 2020
*/


#ifndef Q_LEARNING_H
#define Q_LEARNING_H

#include <maze.h>
#include <micromouse.h>
#include <queue.h>
#include <stdbool.h>
#include <stdint.h>
#include<stdio.h>
#include<stdlib.h>
#include<unistd.h>
#include<float.h>


typedef struct cell{
	double *directions;
} cell;


struct QMAZE {
   int16_t 	Qsize;
   char **  Qmaze;
   cell **rValues;
   cell **qValues;
   int StartX, StartY;
   int GoalX, GoalY;
   int QRowCol;
};


char get_Qmaze_cell(struct QMAZE Qmaze, int x, int y);
int Qmaze_cell_has_wall(struct QMAZE Qmaze, int x, int y, int wall_id);
void set_Qmaze_cell(struct QMAZE Qmaze, char value, int x, int y);
double get_QTable_cell(struct QMAZE Qmaze, int i, int j, int dirId);
void set_QTable_cell(struct QMAZE Qmaze, int i, int j, int dirId, double value);
double get_rValues_cell(struct QMAZE Qmaze, int i, int j, int dirId);
void set_rValues_cell(struct QMAZE Qmaze, int i, int j, int dirId, double value);
struct QMAZE init_Qmaze(int size);
void break_Qmaze_Cell_Walls(struct QMAZE Qmaze, int x, int y, bool top, bool bottom, bool left, bool right);
void add_Qmaze_Cell_Walls(struct QMAZE Qmaze, int x, int y, bool top, bool right, bool bottom, bool left);
struct QMAZE init_Qmaze(int size);
struct QMAZE logical_to_Qmaze(struct Maze logicalmaze );
void print_Qmaze_Cell_Walls(struct QMAZE Qmaze, int x, int y);
void print_Qmaze(struct QMAZE maze);
void print_QTable(struct QMAZE maze);
void move(int direction, struct QMAZE Qmaze);
int bestDirection(int *direction, struct QMAZE Qmaze);
void restart(struct QMAZE Qmaze);
void printSleepClear(int sleepMS, struct QMAZE Qmaze);
void qLearning(struct QMAZE Qmaze);
Queue_XY QLPath(struct QMAZE Qmaze);

#endif