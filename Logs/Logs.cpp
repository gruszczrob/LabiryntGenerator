#include <iostream>
#include <fstream>
#include <chrono>
#include <ctime>


using namespace std;

const string LogFileName = "logs.txt";

string getNowTime(){
	auto now = chrono::system_clock::now();
	time_t current_time = chrono::system_clock::to_time_t(now);
	auto milliseconds = chrono::duration_cast<chrono::milliseconds>(now.time_since_epoch()).count();
	char timeString[20]; // Format: YYYY-MM-DD HH:MM:SS
	strftime(timeString, sizeof(timeString), "%Y-%m-%d %H:%M:%S", localtime(&current_time));
	return (timeString + string(".") + to_string((milliseconds % 1000)));
}

void writeToLogs(string message){
	ifstream LogsWrite(LogFileName);
	string written, line;
	while (getline (LogsWrite, line)) {
  		written += line + "\n";
	}
	LogsWrite.close();
	ofstream Logs(LogFileName);
 	Logs << written << getNowTime() << " - " << message <<endl;
	Logs.close();
}

