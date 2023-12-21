
PLUGIN_NAME = custom-css
ZIP_NAME ?= $(PLUGIN_NAME).zip
BUILD_DIR = build

## Style Files
SCSS_FILES = src/webfrontend/scss/main.scss


all: build ## build all



build: clean css  # build all (creates build folder)
	mkdir -p $(BUILD_DIR)/$(PLUGIN_NAME)
	cp manifest.master.yml $(BUILD_DIR)/$(PLUGIN_NAME)/manifest.yml


zip: build ## build zip file for publishing
	cd $(BUILD_DIR) && zip $(ZIP_NAME) -r $(PLUGIN_NAME)

clean: ## clean build files
	rm -rf $(BUILD_DIR)

css: ## Compile SASS to CSS
	sass $(SCSS_FILES):$(BUILD_DIR)/$(PLUGIN_NAME)/webfrontend/custom-style.css
