#include <iostream>
#include <memory>
#include <any>
#include "../Logs/Logs.h"
#include "../Cli/Cli.h"
#include "../ClassFactory/ClassFactory.h"

using namespace std;

class DrawingEngineFactory: ClassFactory{
	private:
		shared_ptr<int> engine = make_shared<int>();
		shared_ptr<DrawingEngine> engineCreated;
	public:
		DrawingEngineFactory(any engineI){
			setVar(engine, engineI, "engine");
		}
		
		shared_ptr<DrawingEngine> createEngine(int widthI, int heightI, char wallI, char routeI){
			switch(getVar<int>("engine")){
				case 0:
					engineCreated = make_shared<Cli>(Cli(widthI, heightI, wallI, routeI));
					break;
				case 1:
					//TODO: FTXUI - Create
					break;

				default:
					writeToLogs("Drawing Engine Factory: public createEngine: Bad engine given");
					cout<<"Bad engine given"<<endl;
			}
			return engineCreated;
		}
};

