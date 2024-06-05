#include <iostream>
#include "../Logs/Logs.h"
#include "../DrawingEngine/DrawingEngine.h"
#include <any>
#include <memory>
#include <vector>
using namespace std;

class Cli: public DrawingEngine{

	private:

		shared_ptr<char> wall = make_shared<char>();
		shared_ptr<char> route = make_shared<char>();

	public:

		Cli(any widthI, any heightI, any wallI, any routeI): DrawingEngine(widthI, heightI){
			writeToLogs("CLI created");
			if(!checkIfCorrect() or !setVar<char>(wall, wallI, "wall") or !setVar<char>(route, routeI, "route")){
				setNotCorrected();
			}
		}
		
		void print(vector<vector<int>> grid){
			for(int v = 0; v < getVar<int>("height"); v++){
				for(int i = 0; i < getVar<int>("width"); ++i){
					char toPrint = (grid[v][i]==0) ? getVar<char>("route") : getVar<char>("wall");
					cout<<toPrint;
				}
				cout<<endl;
			}
		}
};
