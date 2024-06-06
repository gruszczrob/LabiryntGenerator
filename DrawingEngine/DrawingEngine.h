#ifndef DRAWINGENGINE_H
#define DRAWINGENGINE_H

#include <iostream>
#include <memory>
#include <any>
#include <vector>
#include "../Logs/Logs.h"
#include "../ClassFactory/ClassFactory.h"

using namespace std;

class DrawingEngine : public ClassFactory {
private:
    shared_ptr<int> width = make_shared<int>();
    shared_ptr<int> height = make_shared<int>();

public:
    DrawingEngine(any widthI, any heightI);

    virtual void print(vector<vector<int>> grid) = 0;
};

#endif /* DRAWINGENGINE_H */

