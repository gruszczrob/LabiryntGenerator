// Template function implementations for UnorderPointersMap

template <typename T>
void UnorderPointersMap::addItem(const string& key, shared_ptr<T> item) {
	myList[key] = item;
}

template <typename T>
T& UnorderPointersMap::getItem(const string& key) const {
	auto it = myList.find(key);
	if (it != myList.end()) {
		if (auto ptr = get_if<shared_ptr<T>>(&(it->second))) {
			return **ptr;
		}
	}
	throw invalid_argument("Key not found or type mismatch");
}

// Template function implementations for ClassFactory

template <typename T>
bool ClassFactory::setVar(shared_ptr<T>& VarPtr, any input, const string name) {
	try {
		*VarPtr = any_cast<T>(input);
		if (name != "") {
			unorderedPointersMap.addItem<T>(name, VarPtr);
		}
		return true;
	} catch (const exception& e) {
		cout << "Invalid input" << endl;
		writeToLogs(string("Error in private setVar: ") + string(e.what()));
		return false;
	}
}

template <typename T>
bool ClassFactory::setVar(const string& varName, T input) {
	try {
		if (unorderedPointersMap.isExisting(varName)) {
			unorderedPointersMap.getItem<T>(varName) = input;
		} else {
			cout << "Variable not found" << endl;
			writeToLogs("Error in public setVar: variable not found");
			return false;
		}
		return true;
	} catch (const exception& e) {
	  	writeToLogs(string("Error in public setVar: ") + string(e.what()));
	  	return false;
	}
}

template <typename T>
T ClassFactory::getVar(const string& varName) {
	if (!checkIfCorrect()) {
	  	cout << "This class contains error, one of arguments in constructor was in incorrect type" << endl;
	  	return T();
 	} else {
	  	if (unorderedPointersMap.isExisting(varName)) {
			return unorderedPointersMap.getItem<T>(varName);
	  	} else {
			writeToLogs("Error in public getVar: variable not found");
			cout << "Variable not found" << endl;
			return T();
	  	}
 	}
}
