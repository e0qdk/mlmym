# Development Guide

## Prerequisites

- Go 1.23.8 or later
- Basic understanding of Go web applications

## Project Structure

- `main.go` - HTTP server, middleware, templates
- `routes.go` - Handlers, Lemmy API integration  
- `state.go` - User sessions, preferences
- `templates/` - HTML templates
- `public/` - CSS, JS, assets
- `routes_test.go` - Link rewriting tests

## Dependencies

- `httprouter` - HTTP routing
- `go-lemmy` - Lemmy API client
- `goldmark` - Markdown processing
- `html/template` - Template rendering

## Development Commands

```bash
# Build the binary
make mlmym
# or
go build -v -o mlmym

# Run tests
go test
go test -v

# Development mode with hot reload
go run . --addr 0.0.0.0:8008 -w

# Make commands
make dev     # Start development environment
make serve   # Run server with file watching (port 8008)
make reload  # Watch for template/asset changes (port 8009)
```

## Key Features

- Templates cached in production, reloaded with `-w` flag
- Multi-instance vs single-instance modes via LEMMY_DOMAIN
- Link rewriting for Lemmy URLs
- Image handling for pictrs/imgur
- Session management via cookies

## Configuration

### Single Instance Mode
```bash
LEMMY_DOMAIN=discuss.online ./mlmym --addr :8080
```

### User Defaults
Environment variables: `LISTING`, `SORT`, `COMMENT_SORT`, `DARK`, `HIDE_THUMBNAILS`, `COLLAPSE_MEDIA`, `LINKS_IN_NEW_WINDOW`, `COMMENTS_IN_NEW_WINDOW`

## Development Principles

- **Maintainability**: Code should be easy to understand, modify, and extend
- **Code Review Friendly**: Changes should be clear, well-documented, and reviewable
- **Learning Oriented**: Structure should help new developers understand the codebase quickly
- **Simple Architecture**: Prefer straightforward solutions over complex abstractions