# Project structure
SRC_DIR ?= src
BIN_DIR ?= build
HTML_DIR ?= html
PDF_DIR ?= pdf
CSS_FILE ?= $(SRC_DIR)/style.css
PDF_FILE ?= $(BIN_DIR)/notebook.pdf

# Find source files
source_files := $(shell find $(SRC_DIR) -name '*.md')
html_files := $(subst $(SRC_DIR)/,$(BIN_DIR)/$(HTML_DIR)/,$(source_files:%.md=%.html))
pdf_files := $(subst $(SRC_DIR)/,$(BIN_DIR)/$(PDF_DIR)/,$(source_files:%.md=%.pdf))
target_files := $(html_files) $(pdf_files) $(PDF_FILE)

# Prepare target directories if necessary
source_structure := $(shell find $(SRC_DIR) -type d)
target_structure := $(subst $(SRC_DIR)/,$(BIN_DIR)/$(HTML_DIR)/,$(source_structure))
target_structure += $(subst $(SRC_DIR)/,$(BIN_DIR)/$(PDF_DIR)/,$(source_structure))
$(shell mkdir -p $(target_structure))


###############
# PHONY RULES #
###############

.PHONY: default
default: all

.PHONY: all ## Build everything (default)
all: $(PDF_FILE)

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

$(PDF_FILE): $(html_files)
	./print.js $(BIN_DIR)/$(HTML_DIR) $(BIN_DIR)/$(PDF_DIR) $(subst $(BIN_DIR)/$(HTML_DIR)/,,$(html_files))
	pdfunite $(pdf_files) $(PDF_FILE)

$(BIN_DIR)/$(HTML_DIR)/%.html: $(addprefix $(SRC_DIR)/,%.md) $(CSS_FILE)
	pandoc -f markdown -t html --standalone --highlight-style kate -H $(CSS_FILE) $^ -o $@
