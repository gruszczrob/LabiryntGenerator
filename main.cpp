#include <iostream>
#include "./DrawingEngineFactory/DrawingEngineFactory.h"
#include "./Logs/Logs.h"
#include <memory>
#include <vector>

using namespace std;

int main(){
	writeToLogs("App start");
	//creating drawing engine factory with specific style of drawing
	DrawingEngineFactory def = DrawingEngineFactory(0);
	//creating drawing engine and taking poiter to it
	shared_ptr<DrawingEngine> engine = def.createEngine(3,4, 'r', 'w');
	//creating vector of vector of integers to print
	vector<vector<int>> toPrint ({{0, 1, 1}, {1 , 0, 1}, {1, 0, 1}, {1, 0, 0}});
	//printing
	(*engine).print(toPrint);
	return 0;
}
