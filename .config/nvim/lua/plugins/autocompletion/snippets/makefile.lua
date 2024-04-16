local ls = require('luasnip')
local s = ls.snippet
local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets("make", {
    s("!cp", fmt([[ 
        CC = g++
        CFLAGS = -Wall -g
        TARGET ?= main
        INPUT_FILES = $(wildcard inputs/*)

        all: $(TARGET)

        $(TARGET):
            $(CC) $(CFLAGS) -o a.out $@.cpp

        run: $(TARGET)
            @for input in $(INPUT_FILES); do \
                echo "Input file: $$input"; \
                ./a.out < $$input; \
                echo; \
            done

        clean:
            rm -f a.out

        .PHONY: all clean run
        ]], {})
    )
})
