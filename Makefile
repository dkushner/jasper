sync_files := Cargo.lock rust-toolchain
source_files := $(patsubst %, servo/%, $(sync_files))

sync: $(sync_files)

clean:
	rm Cargo.lock rust-toolchain

info:
	@echo "Process utilities for setting up and updating build environment."

update:
	@echo "Updating servo submodule..."
	git submodule update --init

servo/%: update

$(sync_files): %: servo/%
	cp $< $@

.PHONY: info update