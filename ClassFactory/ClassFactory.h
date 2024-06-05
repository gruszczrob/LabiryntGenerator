#ifndef CLASSFACTORY_H
#define CLASSFACTORY_H
#include <iostream>
#include <memory>
#include <any>
#include <unordered_map>
#include "../Logs/Logs.h"
#include <vector>
#include <variant>

using namespace std;

class UnorderPointersMap {
	private:
		using VarType = variant<shared_ptr<int>, shared_ptr<float>, shared_ptr<string>, shared_ptr<char>, shared_ptr<bool>>;
    	unordered_map<string, VarType> myList;

	public:
    	template <typename T>
    	void addItem(const string& key, shared_ptr<T> item) {
        	myList[key] = item;
    	}

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

    	bool isExisting(const string& key) const {
        	return myList.find(key) != myList.end();
    	}
};

class ClassFactory{
	private:
		shared_ptr<bool> isCorrect = make_shared<bool>(true);
		UnorderPointersMap unorderedPointersMap;

	protected:

        void setNotCorrected(){
			setVar<bool>(isCorrect, false);
		}

		template <typename T>
		bool setVar(shared_ptr<T>& VarPtr,any input, const string name = ""){
			try{
				*VarPtr = any_cast<T>(input);
				if(name != ""){
					unorderedPointersMap.addItem<T>(name, VarPtr);
				}
				return true;
			}catch(const exception& e){
				cout<<"Invalid input"<<endl;
				writeToLogs(string("Error in private setVar: ") + string(e.what()));
				return false;
			}
		}

	public:
		ClassFactory(){
			writeToLogs("Drawable Engine Factory created");	
		};

		template <typename T> 
		bool setVar(const string& varName, T input){
			try{
				if (unorderedPointersMap.isExisting(varName)) {
					unorderedPointersMap.getItem<T>(varName) = input;
				} else {
					cout << "Variable not found" << endl;
					writeToLogs("Error in public setVar: variable not found");
					return false;
				}
				return true;
			}catch(const exception& e){
				writeToLogs(string("Error in public setVar: ") + string(e.what()));
				return false;
			}
		}

		template <typename T>
		T getVar(const string& varName){
			if(!checkIfCorrect()){
				cout<<"This class contains error, one of arguments in constructor was in incorrect type"<<endl;
				return T();
			}else{
				if(unorderedPointersMap.isExisting(varName)){
					return unorderedPointersMap.getItem<T>(varName);
				}else{
					writeToLogs("Error in public getVar: variable not found");
					cout<<"Variable not found"<<endl;
					return T();
				}
			}
		}

		bool checkIfCorrect(){
			return *(isCorrect.get());
		}
};
#endif /* CLASSFACTORY_H */
