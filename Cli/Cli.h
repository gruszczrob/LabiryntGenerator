#ifndef CLI_H
#define CLI_H

#include <iostream>
#include <any>
#include <memory>
#include <vector>
#include "../Logs/Logs.h"
#include "../DrawingEngine/DrawingEngine.h"

using namespace std;

class Cli : public DrawingEngine {
private:
	 shared_ptr<char> wall = make_shared<char>();
	 shared_ptr<char> route = make_shared<char>();

public:
	 Cli(any widthI, any heightI, any wallI, any routeI);

	 void print(vector<vector<int>> grid);
};

#endif /* CLI_H */

