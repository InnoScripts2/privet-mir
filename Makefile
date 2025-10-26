.PHONY: all build run clean cross

BINARY := privet

all: build

build:
	@mkdir -p bin || true
	go build -o bin/$(BINARY) ./...

run:
	go run main.go

clean:
	@rm -rf bin dist $(BINARY) *.exe || true

# Кросс-компиляция для популярных платформ
cross:
	@mkdir -p dist || true
	GOOS=linux GOARCH=amd64 go build -o dist/$(BINARY)-linux-amd64 ./...
	GOOS=darwin GOARCH=amd64 go build -o dist/$(BINARY)-darwin-amd64 ./...
	GOOS=windows GOARCH=amd64 go build -o dist/$(BINARY)-windows-amd64.exe ./...
