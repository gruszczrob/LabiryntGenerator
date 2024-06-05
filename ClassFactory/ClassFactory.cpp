#include <iostream>
#include <memory>
#include <any>
#include <unordered_map>
#include "../Logs/Logs.h"
#include <vector>
#include <variant>

using namespace std;

class UnorderPointersMap {

//private
	private:

//Types of variables that can be stored in unordered map
		using VarType = variant<shared_ptr<int>, shared_ptr<float>, shared_ptr<string>, shared_ptr<char>, shared_ptr<bool>>;

//Creating of unorder map
    	unordered_map<string, VarType> myList;

//public
	public:

//Implementing function addItem - adding thinks to unordered map created in private
    	template <typename T>
    	void addItem(const string& key, shared_ptr<T> item) {
        	myList[key] = item;
    	}

//Implementing function getItem - function to get variable value also for setting it
	    template <typename T>
    	T& getItem(const string& key) const {
        	auto it = myList.find(key);
        	if (it != myList.end()) {
            	if (auto ptr = get_if<shared_ptr<T>>( &(it->second) )) {
                	return **ptr;
            	}
        	}
        	throw invalid_argument("Key not found or type mismatch");
    	}

//Implementing function isExisting - function that check if key that was gives exists in map
    	bool isExisting(const string& key) const {
        	return myList.find(key) != myList.end();
    	}
};


//Main class in this file
class ClassFactory{

//private
	private:
		shared_ptr<bool> isCorrect = make_shared<bool>(false);

//unorder map that contains variable name and pointer to it, for easy access to value of variables
		UnorderPointersMap unorderedPointersMap;

//protected
	protected:

		void setNotCorrected(){
			setVar<bool>(isCorrect, true);
		}

//protected function which set value given variable to input (created just for fun (over engineering)), and I'm adding this shared_ptr to map, if there is third argument in function call
		template <typename T>
		bool setVar(shared_ptr<T>& VarPtr,any input, const string name = ""){
			try{
				*VarPtr = any_cast<T>(input);
				if(name != ""){
					unorderedPointersMap.addItem<T>(name, VarPtr);
				}
				return true;
			}catch(const exception& e){

		//If there is an error it is printing it to logs (logs.txt)  via function created by me in logs.cpp file 
				cout<<"Invalid input"<<endl;
				writeToLogs(string("Error in private setVar: ") + string(e.what()));
				return false;
			}
		}

//public:
	public:

//constructor of my stuct, need three inputs (engine, width and heigth). They are in any type, only because I don't want to have errors when i misspel something. I prefere to get my custom not.
		ClassFactory(){
			writeToLogs("Drawable Engine Factory created");	
		};

//overwriting setVar fuction, but this time it is public and anybody can access it. It is for setting value of private variables, by giving name of var (this name has to be written before in unorder map) and its new value
		template <typename T> 
		bool setVar(const string& varName, T input){
			try{
				if (unorderedPointersMap.isExisting(varName)) {
					unorderedPointersMap.getItem<T>(varName) = input;
				} else {

		//If there is an error it is printing it to logs (logs.txt)  via function created by me in logs.cpp file 
					cout << "Variable not found" << endl;
					writeToLogs("Error in public setVar: variable not found");
					return false;
				}
				return true;
			}catch(const exception& e){

		//If there is an error it is printing it to logs (logs.txt)  via function created by me in logs.cpp file 
				writeToLogs(string("Error in public setVar: ") + string(e.what()));
				return false;
			}
		}

//creating getVar funcition. This function return variable value in given type. You need only to give variable name (this name has to be written before in unorder map) and type. It won't return variable value if there was mistake in constructor using 
		template <typename T>
		T getVar(const string& varName){
			if(!checkIfCorrect()){
				cout<<"This class contains error, one of arguments in constructor was in incorrect type"<<endl;
				return T();
			}else{
				if(unorderedPointersMap.isExisting(varName)){
					return unorderedPointersMap.getItem<T>(varName);
				}else{

		//If there is an error it is printing it to logs (logs.txt)  via function created by me in logs.cpp file 
					writeToLogs("Error in public getVar: variable not found");
					cout<<"Variable not found"<<endl;
					return T();
				}
			}
		}

//creating chcekIfCorrect function. This function return isCorrect value, and is useing in getVar function.
		bool checkIfCorrect(){
			return *(isCorrect.get());
		}
};
