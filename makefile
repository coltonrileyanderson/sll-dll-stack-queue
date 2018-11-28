# 
# makefile 
# by Colton Andreson
# Jan 30, 2018
# 
# this is the makefile that is used to build my four different data types:
# 	sll, dll, stack, and queue. 
#
# this file has the functions make, make clean, make test, make valgrind:
# 	make clean removes all objects but source code.
# 	make compiles all source code
# 	make test runs the test files provided
# 	make valgrind run the test files provided through a memory management software
#

OBJS = integer.o real.o string.o sll.o dll.o stack.o queue.o
OOPTS = -Wall -Wextra -g -c -std=c99
LOPTS = -Wall -Wextra -g -std=c99

all : test-sll test-dll test-stack test-queue sll-0-14

test-sll : test-sll.o integer.o real.o string.o sll.o
	gcc $(LOPTS) test-sll.o integer.o real.o string.o sll.o -o test-sll

test-dll : test-dll.o integer.o real.o string.o dll.o
	gcc $(LOPTS) test-dll.o integer.o real.o string.o dll.o -o test-dll

test-stack : test-stack.o integer.o real.o string.o dll.o stack.o
	gcc $(LOPTS) test-stack.o integer.o real.o string.o dll.o stack.o -o test-stack

test-queue : test-queue.o integer.o real.o string.o sll.o queue.o
	gcc $(LOPTS) test-queue.o integer.o real.o string.o sll.o queue.o -o test-queue

sll-0-14 : sll-0-14.o integer.o real.o string.o sll.o
	gcc $(LOPTS) sll-0-14.o integer.o real.o string.o sll.o -o sll-0-14

test-sll.o : test-sll.c sll.h integer.h string.h real.h
	gcc $(OOPTS) test-sll.c

sll-0-14.o : sll-0-14.c sll.h integer.h string.h real.h
	gcc $(OOPTS) sll-0-14.c

test-dll.o : test-dll.c dll.h integer.h string.h real.h
	gcc $(OOPTS) test-dll.c

test-stack.o : test-stack.c stack.h integer.h string.h real.h
	gcc $(OOPTS) test-stack.c
	
test-queue.o : test-queue.c queue.h integer.h string.h real.h
	gcc $(OOPTS) test-queue.c

stack.o : stack.c stack.h
	gcc $(OOPTS) stack.c

queue.o : queue.c queue.h dll.h
	gcc $(OOPTS) queue.c

sll.o : sll.c sll.h
	gcc $(OOPTS) sll.c

dll.o : dll.c dll.h
	gcc $(OOPTS) dll.c

integer.o : integer.c integer.h
	gcc $(OOPTS) integer.c

real.o : real.c real.h
	gcc $(OOPTS) real.c

string.o : string.c string.h
	gcc $(OOPTS) string.c

valgrind : all
	echo testing singly-linked list
	valgrind ./test-sll
	echo
	echo testing doubly-linked list
	valgrind ./test-dll
	echo
	echo testing stack
	valgrind ./test-stack
	echo
	echo testing queue
	valgrind ./test-queue
	echo

test : all
	echo testing singly-linked list
	./test-sll
	echo
	echo testing doubly-linked list
	./test-dll
	echo
	echo testing stack
	./test-stack
	echo
	echo testing queue
	./test-queue
	echo

vgsll : all
#	echo testing
#	./sll-0-14
#	echo
	echo testing w valgrind
	valgrind ./sll-0-14
	echo

clean    :
	rm -f $(OBJS) test-*.o test-stack test-queue test-sll test-dll