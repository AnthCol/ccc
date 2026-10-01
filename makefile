CXX := g++
CXXFLAGS := -std=c++26 -Wall -Wpedantic -g

all: cc

cc: parser.tab.c lex.yy.c main.cpp
	$(CXX) $(CXXFLAGS) parser.tab.c lex.yy.c main.cpp -o ccc

parser.tab.c parser.tab.h: parser.y
	bison -d -v parser.y

lex.yy.c: lexer.l parser.tab.h
	flex lexer.l

clean:
	rm -f cc parser.tab.c parser.tab.h parser.output lex.yy.c
