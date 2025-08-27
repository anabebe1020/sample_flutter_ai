SHELL := /bin/bash

.PHONY: gen-code
gen-code:
	flutter pub run build_runner build --delete-conflicting-outputs
