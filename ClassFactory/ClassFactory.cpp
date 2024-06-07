#include "ClassFactory.h"

using namespace std;

bool UnorderPointersMap::isExisting(const string& key) const {
	 return myList.find(key) != myList.end();
}


void ClassFactory::setNotCorrected() {
	 setVar<bool>(isCorrect, false);
}

bool ClassFactory::checkIfCorrect() {
	 return isCorrect;
}

