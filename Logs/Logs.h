#ifndef LOGS_H
#define LOGS_H

#include <iostream>
#include <fstream>
#include <chrono>
#include <ctime>
#include <string>

using namespace std;

extern const string LogFileName;

string getNowTime();
void writeToLogs(string message);

#endif /* LOGS_H */

