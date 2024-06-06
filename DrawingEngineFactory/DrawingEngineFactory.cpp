#include "DrawingEngineFactory.h"

DrawingEngineFactory::DrawingEngineFactory(any engineI) : ClassFactory() {
	 setVar(engine, engineI, "engine");
}

shared_ptr<DrawingEngine> DrawingEngineFactory::createEngine(int widthI, int heightI, char wallI, char routeI) {
	switch (getVar<int>("engine")) {
		case 0:
				engineCreated = make_shared<Cli>(Cli(widthI, heightI, wallI, routeI));
				break;
		// Add cases for other types of drawing engines here
		default:
				writeToLogs("Drawing Engine Factory: Unknown engine type given");
				cout << "Unknown engine type given" << endl;
				break;
	}
	return engineCreated;
}

