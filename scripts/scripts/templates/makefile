main: *.cpp
	g++ *.cpp -o main

run:
	./main

gcc: *.cpp
	g++-10 *.cpp -o main
	./main

clean:
	rm -f *.o main

all: main run clean
	@echo "Done"

tar:
	rm -f u18053239.tar.gz
	tar -czvf u18053239.tar.gz *.cpp *.h makefile
