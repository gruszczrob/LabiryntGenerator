#ifndef CLASS_FACTORY_H_
#define CLASS_FACTORY_H_

#include <iostream>
#include <memory>
#include <any>
#include <unordered_map>
#include <vector>
#include <variant>
#include "Logs.h"

class UnorderPointersMap {
	private:
		using VarType = std::variant<std::shared_ptr<int>, std::shared_ptr<float>, std::shared_ptr<std::string>, std::shared_ptr<char>, std::shared_ptr<bool>>;
		std::unordered_map<std::string, VarType> myList;

	public:
		template <typename T>
		void addItem(const std::string& key, T& item);

		template <typename T>
		T& getItem(const std::string& key) const;

		bool isExisting(const std::string& key) const;
};

class ClassFactory {
	private:
		bool isCorrect = true;
		UnorderPointersMap unorderedPointersMap;

	protected:
		void setNotCorrected();

		template <typename T>
		bool setVar(T& VarPtr, std::any input, const std::string& name = "");

	public:
		template <typename T>
		bool setVar(const std::string& varName, T input);

		template <typename T>
		T getVar(const std::string& varName);

		bool checkIfCorrect();
};

// Template function implementations
#include "ClassFactory.tpp"

#endif /* CLASS_FACTORY_H_ */
