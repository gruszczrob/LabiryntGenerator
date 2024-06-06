#ifndef CLASSFACTORY_H
#define CLASSFACTORY_H

#include <iostream>
#include <memory>
#include <any>
#include <unordered_map>
#include <vector>
#include <variant>
#include "../Logs/Logs.h"

using namespace std;

class UnorderPointersMap {
private:
	 using VarType = variant<shared_ptr<int>, shared_ptr<float>, shared_ptr<string>, shared_ptr<char>, shared_ptr<bool>>;
	 unordered_map<string, VarType> myList;

public:
	 template <typename T>
	 void addItem(const string& key, shared_ptr<T> item);

	 template <typename T>
	 T& getItem(const string& key) const;

	 bool isExisting(const string& key) const;
};

class ClassFactory {
private:
	 shared_ptr<bool> isCorrect = make_shared<bool>(true);
	 UnorderPointersMap unorderedPointersMap;

protected:
	 void setNotCorrected();

	 template <typename T>
	 bool setVar(shared_ptr<T>& VarPtr, any input, const string name = "");

public:
	 ClassFactory();

	 template <typename T>
	 bool setVar(const string& varName, T input);

	 template <typename T>
	 T getVar(const string& varName);

	 bool checkIfCorrect();
};

// Template function implementations
#include "ClassFactory.tpp"

#endif /* CLASSFACTORY_H */
