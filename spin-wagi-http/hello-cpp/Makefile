# Point this to your local installation of the WASI SDK.
WASI_CC ?= /opt/wasi-sdk/bin/clang++

build:
	$(WASI_CC) --target=wasm32-wasi hello.cpp -o hello.wasm
