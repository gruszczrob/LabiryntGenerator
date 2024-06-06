#include "ClassFactory.h"

bool UnorderPointersMap::isExisting(const string& key) const {
    return myList.find(key) != myList.end();
}

ClassFactory::ClassFactory() {
    writeToLogs("Drawable Engine Factory created");
}

void ClassFactory::setNotCorrected() {
    setVar<bool>(isCorrect, false);
}

bool ClassFactory::checkIfCorrect() {
    return *(isCorrect.get());
}

