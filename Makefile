CLANG_BIN=/home/imcoelho/git-reps/make-llvm/build/bin
BINARYEN_BIN=/home/imcoelho/git-reps/binaryen/build/bin
WABT_BIN=/home/imcoelho/git-reps/wabt/build
WABT_BIN_NEW=/home/imcoelho/git-reps/wabt/bin

all: examples

srctest:
	# verify output without specific extension
	#emcc --std=c++17 src/test.cpp -s WASM=1 -o build/dapp.wasm
	#-s SIDE_MODULE=1 -Oz -s ONLY_MY_CODE=1
	#em++ --std=c++17 src/test.cpp -s WASM=1 -s SIDE_MODULE=1 -Oz -s ONLY_MY_CODE=1 -o build/dapp.wasm
	#em++ --std=c++17 src/test.cpp -s WASM=1 -s SIDE_MODULE=1 -s "EXPORTED_FUNCTIONS=['NeoMain']" -O3 -s ONLY_MY_CODE=1 -o build/dapp.wasm

	$(CLANG_BIN)/clang++ -I/usr/include/c++/4.9 -I/usr/include/x86_64-linux-gnu/c++/7 --std=c++1z -emit-llvm --target=wasm32 -Oz src/test.cpp -c -o build/dapp.bc
	$(CLANG_BIN)/llc -asm-verbose=false -o build/dapp.s build/dapp.bc
	#$(CLANG_BIN)/clang++ --std=c++1z -emit-llvm --target=wasm32 -Wl,--no-threads -Oz src/TestSimple.cpp --compile -o build/dapp.wasm
	$(BINARYEN_BIN)/s2wasm build/dapp.s > build/dapp.wast
	$(WABT_BIN)/wast2wasm build/dapp.wast > build/dapp.wasm
	$(WABT_BIN)/wast-desugar --generate-names build/dapp.wast > build/dapp.wat
	@echo "Number of Loads should be Zero. Checking!"
	@test `cat build/dapp.wat | grep -c -E 'i32.load|i64.load|i32.store|i64.store|global'` -eq 0
	@echo "Check passed!"
	@echo "Number of lines:" `wc -l build/dapp.wat`
	#$(WABT_BIN_NEW)/wat2wasm build/dapp.wast > build/dapp2.wasm
	#$(WABT_BIN_NEW)/wasm2wat build/dapp2.wasm > build/dapp2.wat

examples: HelloWorld
	@echo Building examples!

# examples
HelloWorld: examples/HelloWorld.cpp
	echo "Building example $<"
	$(CLANG_BIN)/clang++ --std=c++1z -Isrc/ -emit-llvm --target=wasm32 -O1 $< -c -o build/examples/$@.bc
	$(CLANG_BIN)/llc -asm-verbose=false -o build/examples/$@.s build/examples/$@.bc
	$(BINARYEN_BIN)/s2wasm build/examples/$@.s > build/examples/$@.wast
	@#$(WABT_BIN)/wast2wasm build/examples/$@.wast > build/examples/$@.wasm
	$(WABT_BIN)/wast-desugar --generate-names build/examples/$@.wast > build/examples/$@.wat
	@echo "Number of Loads should be Zero. Checking!"
	@test `cat build/examples/$@.wat | grep -c -E 'i32.load|i64.load|i32.store|i64.store|global'` -eq 0
	@./count_drop.sh
	@echo "Check passed!"
	@echo "Number of lines on s-expression file:" `wc -l build/examples/$@.wat`
	 

vendor:
	@echo "Install docs"
	sudo npm -g install apidoc
	@echo "Should install llvm with clang. Also binaryen and wabt"
	@echo TODO! See correct/compatible versions below on comments.


#binaryen
#b16768ec9b72d075ae2e36cc85aa216fdf4fd354

#wabt
#8e1f6031e9889ba770c7be4a9b084da5f14456a0

#llvm + clang
#(cd clang && git checkout e4de58127fa1d8d22ee8043cef9b4d8a807b6cde)
#(cd llvm && git checkout 08b86793476e08fc0937e70058e2a94808c988e7)
#(mkdir build && cd build && cmake -DLLVM_ENABLE_PROJECTS=clang -G "Unix Makefiles" -DLLVM_TARGETS_TO_BUILD= -DLLVM_EXPERIMENTAL_TARGETS_TO_BUILD=WebAssembly ../llvm)



doc:
	apidoc -i src/ -f ".*\\.hpp$$" -o docs/
