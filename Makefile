.PHONY: all
all: test

test: pony-first_test
	./pony-first_test

pony-first_test: main.pony
	ponyc -d --pic .

clean:
	@rm -f ./pony-first_test
