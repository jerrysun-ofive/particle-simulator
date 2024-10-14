CXX = g++
OUTPUT = app

CXX_FILES = $(wildcard ./src/*.cpp)
CXX_FLAGS = -Wall -g -std=c++17 -DGL_SILENCE_DEPRECATION

LIB_DIR = src/vendors/lib
INCLUDE_DIR = src/vendors/include

# Adding GLEW include and library paths
GLEW_INCLUDE = /opt/homebrew/include
GLEW_LIB = /opt/homebrew/lib/libGLEW.a

# Adjusting LDFLAGS to link GLEW statically
LDFLAGS = -L$(LIB_DIR) $(GLEW_LIB) -framework Cocoa -framework OpenGL -framework IOKit -lglfw.3

all: $(OUTPUT)

$(OUTPUT): $(CXX_FILES:.cpp=.o)
	$(CXX) $(CXX_FLAGS) -o $@ $^ $(LDFLAGS) -Wl,-rpath,$(LIB_DIR)

%.o: %.cpp
	$(CXX) $(CXX_FLAGS) -c -o $@ $< -I $(INCLUDE_DIR) -I $(GLEW_INCLUDE)

clean:
	rm -f $(OUTPUT) $(CXX_FILES:.cpp=.o)
