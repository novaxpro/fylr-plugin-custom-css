
PLUGIN_NAME = custom-css
ZIP_NAME ?= $(PLUGIN_NAME).zip
BUILD_DIR = build

## Style Files
SCSS_FILES = src/webfrontend/scss/main.scss

## L10N
L10N_DIR = $(BUILD_DIR)/$(PLUGIN_NAME)/l10n
L10N_CSV_FILE = src/l10n/custom-loca.csv

all: build ## build all

loca:
	mkdir -p $(L10N_DIR)
	cp $(L10N_CSV_FILE) $(L10N_DIR)



build: clean css loca  # build all (creates build folder)
	mkdir -p $(BUILD_DIR)/$(PLUGIN_NAME)
	cp manifest.master.yml $(BUILD_DIR)/$(PLUGIN_NAME)/manifest.yml


zip: build ## build zip file for publishing
	cd $(BUILD_DIR) && zip $(ZIP_NAME) -r $(PLUGIN_NAME)

clean: ## clean build files
	rm -rf $(BUILD_DIR)

css: ## Compile SASS to CSS
	sass $(SCSS_FILES):$(BUILD_DIR)/$(PLUGIN_NAME)/webfrontend/custom-style.css
