# List available recipes
default:
    @just --list

# Build the package (macOS host only)
build:
    swift build

# Build in release configuration
release:
    swift build -c release

# Run tests
test:
    swift test

# Type-check all supported platforms
check-platforms:
    xcodebuild build -scheme sharing-cloud -destination 'generic/platform=iOS Simulator' -quiet
    xcodebuild build -scheme sharing-cloud -destination 'generic/platform=tvOS Simulator' -quiet
    xcodebuild build -scheme sharing-cloud -destination 'generic/platform=watchOS Simulator' -quiet
    xcodebuild build -scheme sharing-cloud -destination 'platform=macOS' -quiet

# Format all Swift sources in place
format:
    swift format --in-place --recursive Sources Tests Package.swift

# Check formatting without modifying files
lint:
    swift format lint --strict --recursive Sources Tests Package.swift

# Update dependencies to latest allowed versions
update:
    swift package update

# Remove build artifacts
clean:
    swift package clean

# Open the package in Xcode
xcode:
    open Package.swift
