# Personal MkDocs Website

A modern, responsive personal website built with MkDocs and the Material theme.

## 🚀 Features

- **Material Design**: Beautiful Material Design theme with dark/light mode support
- **Responsive Design**: Works perfectly on desktop, tablet, and mobile devices
- **Search**: Built-in search functionality
- **Social Links**: Easy integration with social media profiles
- **Docker Support**: Ready-to-use Docker containers for easy deployment
- **Git Integration**: Automatic last update tracking using git revision dates
- **Code Highlighting**: Syntax highlighting for code blocks
- **Mermaid Diagrams**: Support for creating diagrams and flowcharts

## 📁 Project Structure

```
mkdocs-personal-site/
├── docs/                    # Documentation source files
│   ├── index.md           # Homepage
│   ├── about.md           # About page
│   └── projects.md        # Projects page
├── mkdocs.yml             # MkDocs configuration
├── Dockerfile            # Docker configuration
├── docker-compose.yml    # Docker Compose configuration
├── nginx.conf            # Nginx configuration (for production)
├── requirements.txt      # Python dependencies
├── .dockerignore         # Docker ignore file
└── README.md             # This file
```

## 🛠️ Installation

### Prerequisites

- Python 3.8 or higher
- pip (Python package manager)
- Git (optional, for git integration)

### Local Development

1. **Clone the repository** (if applicable):
   ```bash
   git clone <repository-url>
   cd mkdocs-personal-site
   ```

2. **Create and activate a virtual environment** (recommended):
   ```bash
   python -m venv venv
   source venv/bin/activate  # On Windows: venv\Scripts\activate
   ```

3. **Install dependencies**:
   ```bash
   pip install -r requirements.txt
   ```

4. **Start the development server**:
   ```bash
   mkdocs serve
   ```

5. **Open your browser** and navigate to `http://localhost:8000`

### Docker Development

1. **Build the Docker image**:
   ```bash
   docker build -t mkdocs-personal-site .
   ```

2. **Run the container**:
   ```bash
   docker run -p 8000:8000 mkdocs-personal-site
   ```

3. **Open your browser** and navigate to `http://localhost:8000`

### Docker Compose Development

1. **Start the services**:
   ```bash
   docker-compose up
   ```

2. **Open your browser** and navigate to `http://localhost:8000`

3. **Stop the services** when done:
   ```bash
   docker-compose down
   ```

## 🚢 Production Deployment

### Using Docker Compose (Recommended)

1. **Build and start production services**:
   ```bash
   docker-compose --profile production up -d
   ```

2. **Check the logs**:
   ```bash
   docker-compose logs -f
   ```

3. **Stop the services**:
   ```bash
   docker-compose down
   ```

### Manual Docker Build

1. **Build the production image**:
   ```bash
   docker build -t mkdocs-personal-site:latest .
   ```

2. **Run in production mode**:
   ```bash
   docker run -d -p 80:8000 --name mkdocs-site mkdocs-personal-site:latest
   ```

### Static Site Generation

1. **Build the static site**:
   ```bash
   mkdocs build
   ```

2. **The generated site will be in the `site/` directory**

3. **Deploy the `site/` directory** to your web server

## 📝 Customization

### Editing Content

- Edit the Markdown files in the `docs/` directory
- Update the navigation in `mkdocs.yml`
- Customize the theme settings in `mkdocs.yml`

### Theme Configuration

The Material theme can be customized in `mkdocs.yml`:

```yaml
theme:
  name: material
  palette:
    - scheme: default
      primary: blue
      accent: indigo
    - scheme: slate
      primary: blue
      accent: indigo
  features:
    - navigation.tabs
    - navigation.sections
    - search.highlight
```

### Adding New Pages

1. **Create a new Markdown file** in the `docs/` directory
2. **Add it to the navigation** in `mkdocs.yml`:
   ```yaml
   nav:
     - Home: index.md
     - About: about.md
     - Projects: projects.md
     - New Page: new-page.md  # Add this line
   ```

### Adding Social Links

Update the `extra.social` section in `mkdocs.yml`:

```yaml
extra:
  social:
    - icon: fontawesome/brands/github
      link: https://github.com/yourusername
    - icon: fontawesome/brands/linkedin
      link: https://linkedin.com/in/yourusername
```

## 🔧 Configuration

### MkDocs Configuration

Main configuration is in `mkdocs.yml`:
- Site metadata (name, description, author)
- Theme settings
- Navigation structure
- Plugin configuration
- Markdown extensions

### Environment Variables

- `PYTHONUNBUFFERED=1`: Ensures Python output is not buffered

## 📊 Performance Optimization

### Caching

- Static assets are cached for 1 year in production
- Browser caching is configured via Nginx headers

### Compression

- Nginx is configured for gzip compression (if enabled)
- Static assets are served with appropriate cache headers

## 🔍 Troubleshooting

### Common Issues

1. **Port already in use**:
   - Change the port mapping in `docker-compose.yml` or use `docker run` with a different port

2. **Build errors**:
   - Check that all dependencies are installed
   - Verify the Python version (requires 3.8+)

3. **Theme not loading**:
   - Ensure the Material theme is properly installed
   - Check `mkdocs.yml` for syntax errors

### Debug Mode

Run with debug logging:
```bash
mkdocs serve --verbose
```

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- [MkDocs](https://www.mkdocs.org/) - The static site generator
- [Material for MkDocs](https://squidfunk.github.io/mkdocs-material/) - The theme
- [Docker](https://www.docker.com/) - Containerization platform

## 📞 Support

If you encounter any issues or have questions:

1. Check the [troubleshooting section](#-troubleshooting)
2. Review the [MkDocs documentation](https://www.mkdocs.org/user-guide/)
3. Open an issue in the repository

---

**Last Updated**: {git-revision-date-localized}  
**Version**: 1.0.0
