#pragma once 

#include <memory>
#include <string>
#include <vector>
#include <utility>

class Node {
private:
public:
    virtual ~Node() = default; 
}


////////////////////////////////////////////////////////////////////////////////


class Definition : Node {
protected:
    std::string name; 
public:
    Definition(std::string name) {
        this->name = name; 
    }
}

class Declaration : Node {
protected:
    std::string name; 
public:
    Declaration(std::string name) {
        this->name = name; 
    }
}

class Statement : Node {
protected:
public:
    Statement(std::string name) {
        this->name = name; 
    }
}

class Expression : Node {
protected:
public:
    Expression(std::string name) {
        this->name = name; 
    }
}


////////////////////////////////////////////////////////////////////////////////


class FunctionDefinition : Definition {
public:
    FunctionDefinition(std::string name) {
        this->name = name; 
    }
}; 










