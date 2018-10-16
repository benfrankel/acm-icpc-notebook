# Project structure
SRC_DIR ?= src
BIN_DIR ?= build
HTML_DIR ?= html
PDF_DIR ?= pdf
CSS_FILE ?= style.css
PDF_FILE ?= notebook.pdf

html_dir := $(BIN_DIR)/$(HTML_DIR)
pdf_dir := $(BIN_DIR)/$(PDF_DIR)
css_file := $(SRC_DIR)/$(CSS_FILE)
pdf_file := $(BIN_DIR)/$(PDF_FILE)

# Find source files
source_files := $(shell find $(SRC_DIR) -name '*.md')
html_files := $(subst $(SRC_DIR)/,$(html_dir)/,$(source_files:%.md=%.html))
pdf_files := $(subst $(SRC_DIR)/,$(pdf_dir)/,$(source_files:%.md=%.pdf))
target_files := $(html_files) $(pdf_files) $(pdf_file)

# Prepare target directories if necessary
source_structure := $(shell find $(SRC_DIR) -type d)
target_structure := $(subst $(SRC_DIR)/,$(html_dir)/,$(source_structure))
target_structure += $(subst $(SRC_DIR)/,$(pdf_dir)/,$(source_structure))
$(shell mkdir -p $(target_structure))


###############
# PHONY RULES #
###############

.PHONY: default
default: all

.PHONY: all ## Build everything (default)
all: $(pdf_file)

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

$(pdf_file): $(html_files)
	./print.js $(html_dir) $(pdf_dir) $(subst $(html_dir)/,,$(html_files))
	pdfunite $(pdf_files) $(pdf_file)

$(html_dir)/%.html: $(addprefix $(SRC_DIR)/,%.md) $(css_file)
	pandoc -f markdown -t html --standalone --highlight-style kate -H $(css_file) $^ -o $@
