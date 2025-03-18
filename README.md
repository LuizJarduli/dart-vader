# dart-vader-cli

A command-line interface tool that brings the Dark Side of the Force to your terminal. Greatly inspired by [mason_cli](https://github.com/felangel/mason) package. 

## Features

- Play Darth Vader's iconic breathing sound
- "No, I am your father" famous quote
- "Nooooooo!" dramatic quote
- Display CLI version with Imperial March theme

## Getting started

```bash
dart pub global activate dart_vader_cli
```

```bash
dart_vader --help
```

## Additional information

### Platform Support

This CLI tool is designed to work across multiple platforms:

- ✅ Windows
- ✅ macOS 
- ✅ Linux

### Commands

| Command | Description |
|---------|-------------|
| `breathing` | Play Darth Vader's iconic breathing sound |
| `im-your-father` | "No, I am your father" famous quote |
| `no` | "Nooooooo!" dramatic quote |
| `version` | Display CLI version with Imperial March theme |

### Architecture

Built following MVVM and Clean Architecture principles:

- Platform-agnostic audio playback service
- Command pattern for extensible CLI operations
- Dependency injection for better testability
- Error handling and logging

### Dependencies

- `cli_completion` - For command auto-completion
- `mason_logger` - Structured logging and CLI output
- Platform-specific audio libraries:
  - Windows: `windows_audio`
  - macOS/Linux: `audioplayers`

### Error Handling

The CLI gracefully handles errors and provides meaningful feedback:

- Audio playback failures
- Invalid commands
- Platform compatibility issues

All commands return appropriate exit codes to integrate well with scripts and other tools.

### License

This project is licensed under the BSD 3-Clause License - see the [LICENSE](LICENSE) file for details.

### Disclaimer

This project is a fan-made creation and is not affiliated with, endorsed, or sponsored by Disney, Lucasfilm Ltd., or any related entities. All Star Wars characters, names, and related elements are trademarks and copyrights of Disney and Lucasfilm Ltd. 

I do not claim ownership over Darth Vader, Star Wars, or any associated intellectual property. This project is intended for personal, non-commercial use and is created out of appreciation for the Star Wars universe.

All rights to the Star Wars franchise and its characters belong to Disney and Lucasfilm Ltd. Please support the official releases.