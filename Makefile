SRC_DIR := ./src
OBJ_DIR_GUI := ./src/obj/gui
OBJ_DIR_TUI := ./src/obj/tui
dummy_build_gui := $(shell mkdir -p $(OBJ_DIR_GUI))
dummy_build_tui := $(shell mkdir -p $(OBJ_DIR_TUI))
SRC_FILES := $(wildcard $(SRC_DIR)/*.cpp)
OBJ_FILES_GUI := $(patsubst $(SRC_DIR)/%.cpp,$(OBJ_DIR_GUI)/%.o,$(SRC_FILES))
OBJ_FILES_TUI := $(patsubst $(SRC_DIR)/%.cpp,$(OBJ_DIR_TUI)/%.o,$(SRC_FILES))
CPPFLAGS := -O3 -std=c++14 -nostdlib -fno-exceptions
CXXFLAGS += -MMD

OS := $(shell uname)
CPU := $(shell uname -m)
DTZ := $(shell date "+%Z")
ifeq ($(CPU),x86_64)
ABI := AMD64
else
CPU := aarch64
ABI := ARM64
endif

all:		.hostenv tui gui
gui:		.hostenv obj/$(CPU)/$(ABI)/$(OS)/main_gui
tui:		.hostenv obj/$(CPU)/$(ABI)/$(OS)/main_tui
install:	clean .hostenv tui gui inst

.hostenv:
ifeq ($(OS), Windows)
	@echo "USER=%USERNAME%" > .hostenv
	@echo "HOME=%HOMEPATH%" >> .hostenv
	@echo "PWD=%CD%" >> .hostenv
else
	@echo "USER=$(USER)" > .hostenv
	@echo "HOME=$(HOME)" >> .hostenv
	@echo "PWD=$(PWD)" >> .hostenv
endif
	@echo $(CPU) > arch
	@echo $(OS) > platform
	@echo $(ABI) > abi
	@echo "ROOT=$(PWD)" >> .hostenv
	@echo "HE_VER=2" >> .hostenv
	@echo "OS=$(OS)" >> .hostenv
	@echo "CPU=$(CPU)" >> .hostenv
	@echo "ABI=$(ABI)" >> .hostenv
	@echo "TZ=$(DTZ)" >> .hostenv

snapshot:
	rm -f snapshot.zip
	zip -9q snapshot.zip \
		obj/x86_64/AMD64/Darwin \
		obj/x86_64/AMD64/Linux \
		obj/aarch64/ARM64/Linux \
		obj/aarch64/ARM64/Darwin \
		obj/vp64/VP64/sys/boot_image \
		`find obj -name "main_gui.exe"` \
		`find obj -name "main_tui.exe"`

inst:
	@./stop.sh
	@./obj/$(CPU)/$(ABI)/$(OS)/main_tui -e obj\vp64\VP64\sys\boot_image -l 000-009 -l 001-009 -l 002-009 -l 003-009 -l 004-009 -l 005-009 -l 006-009 -l 007-009 -l 008-009 &
	@./obj/$(CPU)/$(ABI)/$(OS)/main_tui -e obj\vp64\VP64\sys\boot_image -l 000-008 -l 001-008 -l 002-008 -l 003-008 -l 004-008 -l 005-008 -l 006-008 -l 007-008 -l 008-009 &
	@./obj/$(CPU)/$(ABI)/$(OS)/main_tui -e obj\vp64\VP64\sys\boot_image -l 000-007 -l 001-007 -l 002-007 -l 003-007 -l 004-007 -l 005-007 -l 006-007 -l 007-008 -l 007-009 &
	@./obj/$(CPU)/$(ABI)/$(OS)/main_tui -e obj\vp64\VP64\sys\boot_image -l 000-006 -l 001-006 -l 002-006 -l 003-006 -l 004-006 -l 005-006 -l 006-007 -l 006-008 -l 006-009 &
	@./obj/$(CPU)/$(ABI)/$(OS)/main_tui -e obj\vp64\VP64\sys\boot_image -l 000-005 -l 001-005 -l 002-005 -l 003-005 -l 004-005 -l 005-006 -l 005-007 -l 005-008 -l 005-009 &
	@./obj/$(CPU)/$(ABI)/$(OS)/main_tui -e obj\vp64\VP64\sys\boot_image -l 000-004 -l 001-004 -l 002-004 -l 003-004 -l 004-005 -l 004-006 -l 004-007 -l 004-008 -l 004-009 &
	@./obj/$(CPU)/$(ABI)/$(OS)/main_tui -e obj\vp64\VP64\sys\boot_image -l 000-003 -l 001-003 -l 002-003 -l 003-004 -l 003-005 -l 003-006 -l 003-007 -l 003-008 -l 003-009 &
	@./obj/$(CPU)/$(ABI)/$(OS)/main_tui -e obj\vp64\VP64\sys\boot_image -l 000-002 -l 001-002 -l 002-003 -l 002-004 -l 002-005 -l 002-006 -l 002-007 -l 002-008 -l 002-009 &
	@./obj/$(CPU)/$(ABI)/$(OS)/main_tui -e obj\vp64\VP64\sys\boot_image -l 000-001 -l 001-002 -l 001-003 -l 001-004 -l 001-005 -l 001-006 -l 001-007 -l 001-008 -l 001-009 &
	@./obj/$(CPU)/$(ABI)/$(OS)/main_tui -e obj\vp64\VP64\sys\boot_image -l 000-001 -l 000-002 -l 000-003 -l 000-004 -l 000-005 -l 000-006 -l 000-007 -l 000-008 -l 000-009 -run apps/terminal/install.lisp

obj/$(CPU)/$(ABI)/$(OS)/main_gui:	$(OBJ_FILES_GUI)
ifeq ($(OS),Darwin)
	c++ -o $@ $^ \
		-F/Library/Frameworks \
		$(SRC_DIR)/libusb/macos/$(CPU)/libusb-1.0.a \
		-framework CoreFoundation \
		-framework IOKit \
		-framework SDL2
endif
ifeq ($(OS),Linux)
	c++ -o $@ $^ \
		-pthread \
		-L/usr/local/lib -lusb-1.0 \
		$(shell sdl2-config --libs)
endif

obj/$(CPU)/$(ABI)/$(OS)/main_tui:	$(OBJ_FILES_TUI)
ifeq ($(OS),Darwin)
	c++ -o $@ $^ \
		$(SRC_DIR)/libusb/macos/$(CPU)/libusb-1.0.a \
		-framework CoreFoundation \
		-framework IOKit
endif
ifeq ($(OS),Linux)
	c++ -o $@ $^ \
		-pthread \
		-L/usr/local/lib -lusb-1.0
endif

$(OBJ_DIR_GUI)/%.o: $(SRC_DIR)/%.cpp
ifeq ($(OS),Darwin)
	c++ $(CPPFLAGS) $(CXXFLAGS) -c -D_GUI=GUI \
		-I/Library/Frameworks/SDL2.framework/Headers/ \
		-I$(SRC_DIR)/libusb/ \
		-o $@ $<
endif
ifeq ($(OS),Linux)
	c++ $(CPPFLAGS) $(CXXFLAGS) -c -D_GUI=GUI \
		-I/usr/include/SDL2/ \
		-I/usr/local/include/libusb-1.0/ \
		-o $@ $<
endif

$(OBJ_DIR_TUI)/%.o: $(SRC_DIR)/%.cpp
ifeq ($(OS),Darwin)
	c++ $(CPPFLAGS) $(CXXFLAGS) -c \
		-I$(SRC_DIR)/libusb/ \
		-o $@ $<
endif
ifeq ($(OS),Linux)
	c++ $(CPPFLAGS) $(CXXFLAGS) -c \
		-I/usr/local/include/libusb-1.0/ \
		-o $@ $<
endif

clean:
	rm -f .hostenv
	rm -rf $(OBJ_DIR_GUI)/*
	rm -rf $(OBJ_DIR_TUI)/*
	rm -rf obj/
	unzip -nq snapshot.zip

 -include $(OBJ_FILES_GUI:.o=.d)
 -include $(OBJ_FILES_TUI:.o=.d)