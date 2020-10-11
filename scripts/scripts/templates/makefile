main: *.cpp
	g++ *.cpp -o main

run:
	./main

clean:
	rm -f *.o main

all: main run clean
	@echo "Done"

tar:
	tar -czvf u18053239.tar.gz *.cpp *.h makefile
