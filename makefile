CXX = g++ -ggdb -std=c++11
BINNAME = Splache
LINKS=
OBJ = object/Splache.o \
	object/Socket.o \
	object/HttpResponse.o \
	object/HttpRequest.o \
	object/ServerSocket.o

all: splache

pre-build:
	-@mkdir bin
	-@mkdir object

clean:
	-@rm -R object
	-@rm -R bin
	-@rm $(BINNAME)

splache : pre-build $(OBJ)
	$(CXX) $(LINKS) -o bin/$(BINNAME) $(OBJ)

	-@rm $(BINNAME)
	ln -s bin/$(BINNAME) $(BINNAME)

object/Splache.o : src/Splache.h src/Splache.cpp src/Socket.h src/HttpResponse.h src/HttpRequest.h src/ServerSocket.h src/SocketException.h
	$(CXX) -c src/Splache.cpp -o object/Splache.o

object/Socket.o : src/Socket.h src/Socket.cpp
	$(CXX) -c src/Socket.cpp -o object/Socket.o
    
object/Socket.o : /Socket.h src/Socket.cpp
	$(CXX) -c src/Socket.cpp -o object/Socket.o

object/HttpResponse.o : src/HttpResponse.h src/HttpResponse.cpp
	$(CXX) -c src/HttpResponse.cpp -o object/HttpResponse.o

object/HttpRequest.o : src/HttpRequest.h src/HttpRequest.cpp
	$(CXX) -c src/HttpRequest.cpp -o object/HttpRequest.o

object/ServerSocket.o : src/ServerSocket.h src/ServerSocket.cpp src/Socket.h src/HttpRequest.h src/HttpResponse.h src/SocketException.h
	$(CXX) -c src/ServerSocket.cpp -o object/ServerSocket.o
