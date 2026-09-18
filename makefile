CC := g++
CFLAGS := -std=c++20 -Wall -Wpedantic -g

all: lexer parser compile

compile: lexer parser main.cpp
	$(CC) $(CFLAGS) parser.tab.c lex.yy.cc main.cpp -o cc

lexer: lexer.l 
	flex --header-file=lexer.hpp -o lexer.cpp lexer.l

parser: parser.y 
	bison -d -v -o parser.cpp parser.y


