# Project structure
SRC_DIR ?= src
BIN_DIR ?= target
CSS_FILE ?= $(SRC_DIR)/style.css

# Find source files
source_files := $(shell find $(SRC_DIR) -name '*.md')
target_files := $(subst $(SRC_DIR)/,$(BIN_DIR)/,$(source_files:%.md=%.html))

# Prepare target directories if necessary
source_structure := $(shell find $(SRC_DIR) -type d)
target_structure := $(subst $(SRC_DIR)/,$(BIN_DIR)/,$(source_structure))
$(shell mkdir -p $(target_structure))


###############
# PHONY RULES #
###############

.PHONY: default
default: all

.PHONY: all ## Build everything (default)
all: $(target_files)

.PHONY: clean ## Remove all generated files
clean:
	rm -f $(target_files)

.PHONY: help ## Print this help
help:
	@echo Options
	@grep -E '^\.PHONY: [a-zA-Z_-]+ .*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = "(: |##)"}; {printf "\033[36m%-10s\033[0m %s\n", $$2, $$3}'


###############
# BUILD RULES #
###############

$(BIN_DIR)/%.html: $(addprefix $(SRC_DIR)/,%.md)
	pandoc -f markdown -t html --standalone --highlight-style kate -H $(CSS_FILE) $^ -o $@
