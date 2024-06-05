#include <iostream>
#include <memory>
#include "../Logs/Logs.h"
#include "../ClassFactory/ClassFactory.h"
#include <any>
#include <vector>

using namespace std;

class DrawingEngine: public ClassFactory{
	private:
		shared_ptr<int> width = make_shared<int>();
		shared_ptr<int> height = make_shared<int>();

	public:
		DrawingEngine(any widthI, any heightI): ClassFactory(){
			if(!setVar(width, widthI, "width") or !setVar(height, heightI, "height")){
				setNotCorrected();
			}
		}
		virtual void print(vector<vector<int>> grid) = 0;
};
/*
int main(){
	DrawingEngine drawingEngine = DrawingEngine(1, 2);
	cout<<drawingEngine.getVar<int>("height")<<endl;
	return 0;
}
*/
