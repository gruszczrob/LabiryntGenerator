#ifndef DRAWINGENGINEFACTORY_H
#define DRAWINGENGINEFACTORY_H

#include <iostream>
#include <memory>
#include <any>
#include "../Logs/Logs.h"
#include "../Cli/Cli.h"
#include "../ClassFactory/ClassFactory.h"

using namespace std;

class DrawingEngineFactory : public ClassFactory {
private:
	shared_ptr<int> engine = make_shared<int>();
	shared_ptr<DrawingEngine> engineCreated;

public:
	DrawingEngineFactory(any engineI);

	shared_ptr<DrawingEngine> createEngine(int widthI, int heightI, char wallI, char routeI);
};

#endif /* DRAWINGENGINEFACTORY_H */

