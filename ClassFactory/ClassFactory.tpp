// Template function implementations for UnorderPointersMap

template <typename T>
void UnorderPointersMap::addItem(const std::string& key, T& item) {
	std::shared_ptr<T> ptr = std::make_shared<T>(item);
	myList[key] = ptr;
}

template <typename T>
T& UnorderPointersMap::getItem(const std::string& key) const {
	auto it = myList.find(key);
	if (it != myList.end()) {
		if (auto ptr = std::get_if<std::shared_ptr<T>>(&(it->second))) {
			return **ptr;
		}
	}
	throw std::invalid_argument("Key not found or type mismatch");
}

// Template function implementations for ClassFactory

template <typename T>
bool ClassFactory::setVar(T& Var, std::any input, const std::string& name) {
	try {
		Var = std::any_cast<T>(input);
		if (!name.empty()) {
			unorderedPointersMap.addItem<T>(name, Var);
		}
		return true;
	} catch (const std::exception& e) {
		std::cout << "Invalid input" << std::endl;
		writeToLogs(string("Error in private setVar: ") + string(e.what()));
		return false;
	}
}

template <typename T>
bool ClassFactory::setVar(const std::string& varName, T input) {
	try {
		if (unorderedPointersMap.isExisting(varName)) {
			unorderedPointersMap.getItem<T>(varName) = input;
		} else {
			std::cout << "Variable not found" << std::endl;
			writeToLogs("Error in public setVar: variable not found");
			return false;
		}
		return true;
	} catch (const std::exception& e) {
	  	writeToLogs(string("Error in public setVar: ") + string(e.what()));
	  	return false;
	}
}

template <typename T>
T ClassFactory::getVar(const std::string& varName) {
	if (!checkIfCorrect()) {
	  	std::cout << "This class contains errors; one of the arguments in the constructor was of an incorrect type" << std::endl;
		throw std::runtime_error("ClassFactory contains errors");
 	} else {
	  	if (unorderedPointersMap.isExisting(varName)) {
			return unorderedPointersMap.getItem<T>(varName);
	  	} else {
			writeToLogs("Error in public getVar: variable not found");
			throw std::runtime_error("Variable not found: " + varName);
	  	}
 	}
}
