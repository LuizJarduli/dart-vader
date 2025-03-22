#!/usr/bin/make -f

# Define shell
SHELL := /bin/bash

# Project configuration
DART := dart
GENERATED_FILE := lib/constants/audio_assets.dart

# Default target
.DEFAULT_GOAL := help

.PHONY: help build clean verify format test analyze publish

help:
	@echo "Available commands:"
	@echo "  build      - Build project and generate assets"
	@echo "  clean      - Clean generated files and build directory"
	@echo "  verify     - Verify project setup and dependencies"
	@echo "  format     - Format dart files"
	@echo "  test       - Run tests"
	@echo "  analyze    - Analyze code"
	@echo "  help       - Show this help message"
	@echo "  publish    - Publish package to pub.dev"

build: verify
	@echo "🚀 Building project..."
	@$(DART) pub get
	@$(DART) run build_runner build --delete-conflicting-outputs
	@$(DART) run tool/generate_audio_assets.dart
	@echo "✅ Build completed"

clean:
	@echo "🧹 Cleaning generated files..."
	@rm -rf $(GENERATED_FILE)
	@rm -rf .dart_tool
	@echo "✅ Clean completed"

verify:
	@echo "🔍 Verifying project setup..."
	@command -v $(DART) >/dev/null 2>&1 || { echo "Dart is not installed"; exit 1; }
	@test -f pubspec.yaml || { echo "pubspec.yaml not found"; exit 1; }
	@echo "✅ Verification completed"

format:
	@echo "📝 Formatting code..."
	@$(DART) format .
	@$(DART) fix --apply
	@echo "✅ Format completed"

test:
	@echo "🧪 Running tests..."
	@$(DART) test
	@echo "✅ Tests completed"

analyze:
	@echo "📊 Analyzing code..."
	@$(DART) analyze
	@echo "✅ Analysis completed" 

publish:
	@echo "📦 Publishing package..."
	@$(DART) pub publish
	@echo "✅ Publish completed"
