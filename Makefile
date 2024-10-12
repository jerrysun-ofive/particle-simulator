CXX = g++
OUTPUT = app

CXX_FILES = $(wildcard ./src/*.cpp)
CXX_FLAGS = -Wall -g -std=c++17 -DGL_SILENCE_DEPRECATION

LIB_DIR = src/vendors/lib
INCLUDE_DIR = src/vendors/include

# Adjusting LDFLAGS
LDFLAGS = -lglfw.3 -framework Cocoa -framework OpenGL -framework IOKit

all: $(OUTPUT)

$(OUTPUT): $(CXX_FILES:.cpp=.o)
	$(CXX) $(CXX_FLAGS) -o $@ $^ -L$(LIB_DIR) $(LDFLAGS) -Wl,-rpath,$(LIB_DIR)

%.o: %.cpp
	$(CXX) $(CXX_FLAGS) -c -o $@ $< -I $(INCLUDE_DIR)

clean:
	rm -f $(OUTPUT) $(CXX_FILES:.cpp=.o)
