# NIST Open Source Portal

A comprehensive static website showcasing NIST’s open‑source portal. Powered by Jekyll, containerized for easy development, and enhanced with client‑side interactivity, it allows users to discover, search, and explore open source code projects, categories, and repository details.

---

## 🎯 Objective

- Present NIST’s open-source contribution in a searchable, categorized format.
- Enable easy extension: new tools and categories added via Markdown.
- Support modern developer workflows with containerization and CI integration.

---

## 🛠️ Solution Architecture

### The portal high level architecture.
```plaintext
                                    ┌─────────────────────────┐
                                    │    Author Content       │
                                    │ markdown files in       │
     ┌──────────────┐               │ catalog/, repo/, etc.   │
     │ Developers / │               └─────────────────────────┘
     │ Content Team │                          │
     └─────┬────────┘                          ▼
           │                           ┌─────────────────────────┐
           │   build with             │       Jekyll            │
           │   `make build`           │  - Markdown to HTML     │
           │   or via Docker          │  - Collections support  │
           │                           └─────────────────────────┘
           │                                        │
           │ serve via `make serve`, `jekyll`, or Docker
           ▼                                        ▼
┌───────────────────────┐                   ┌────────────────────────────┐
│ Local Dev/Test Server │◄──────────────────│     User Browsers          │
│   (localhost:4000)    │                   │(searchable, filterable UI) │
└───────────────────────┘                   └────────────────────────────┘
           ▲                                        ▲
           │                                        │
           └── CI builds deploy `_site/` to static host (GH Pages, Netlify, S3, etc.) ──┘
```

### The portal low level architecture
```plaintext
                                 ┌──────────────────────────┐
                                 │   opensource-theme       │
                                 │  (Jekyll template repo)  │
                                 └────────────┬─────────────┘
                                              │ used by
                                              ▼
                            ┌───────────────────────────────────┐
                            │        Portal Repository         │
                            │  (Jekyll + theme + static assets)│
                            │  - Uses opensource-theme layouts │
                            │  - Contains content dirs:        │
                            │    explore/, catalog/,           │
                            │    category/, repo/              │
                            └────────────┬──────────────────────┘
                                         │
  ┌──────────────────────────────────────┼────────────────────────────────────┐
  │                                      │                                    │
  │                                      │                                    │
  ▼                                      ▼                                    ▼
┌──────────────────┐             ┌──────────────────────┐                ┌─────────────────────┐
│ opensource-data  │             │ opensource-actions   │                │ nist-software-      │
│ GitHub Action    │             │ GitHub Action        │                │ scraper (fixed      │
│ - Uses scraper   │             │ - Docker-based       │                │ version)            │
│   to gather      │             │ - Uses GraphQL       │                │                     │
│   Code.gov data  │             │   to fetch NIST      │                │                     │
│ - Generates      │             │   repos, contributors│                │                     │
│   code.json      │             │   languages          │                │                     │
│                  │             │ - Updates content in │                │                     │
│                  │             │   explore/, catalog/ │                │                     │
│                  │             │   category/, repo/   │                │                     │
└──────┬───────────┘             └────────┬─────────────┘                └────────┬────────────┘
       │                                 │                                        │
       ▼                                 │                                        ▼
   Generates                           Updates                                 Provides
   `code.json`                         portal                               Code Gov scraper
   for portal                         content                                functionality
                                       and commit                            in fixed version
       │                                 │                                        │
       └──────────────┬──────────────────┴────────────────────────────────────────┘
                      ▼
       ┌─────────────────────────────────────────────────────┐
       │        Portal Repository Ready For Build            │
       │   (Updated content dirs & code.json)                │
       └────────────┬────────────────────────────────────────┘
                    │
                    ▼
           ┌─────────────────────────┐
           │   Jekyll Build &        │
           │   Deployment Stage      │
           │ - Uses opensource-theme │
           │ - Outputs `_site/`      │
           │ - Deploys to host       │
           └─────────────────────────┘
```
## 🔄 Workflow Breakdown
1. [opensource-theme](https://github.com/usnistgov/opensource-theme)
    * Provides the underlying Jekyll layouts, includes, styles, and scripts used by the portal for consistent rendering.
2. Portal Repository
    * Contains Jekyll configuration, Markdown content directories (explore, catalog, category, repo), static assets, and references the theme.
    * Provides the structure into which both update workflows inject content.
3. [opensource-data](https://github.com/usnistgov/opensource-data)
    * Executes as a GitHub Action using the fixed nist-software-scraper.
    * Scrapes data from NIST Github org and generates code.json, which then populates the portal repository for client-side indexing and display 
4. [opensource-actions](https://github.com/usnistgov/opensource-actions)
    * Runs as a Docker-based GitHub Action using GitHub’s GraphQL API.
    * Fetches metadata (repositories, contributors, languages) for all NIST GitHub repos.
    * Updates Markdown content in explore, catalog, category, and repo in the portal, and commits those changes back github.com.
5. [nist-software-scraper](https://github.com/usnistgov/nist-software-scraper)
    * A version-locked scraper providing consistent metadata output to opensource-data for Code.gov structure compliance
6. [opensource-repo](https://github.com/usnistgov/opensource-repo)
    * A reference repository template aimed at provide better metadata capture for category, catalog and exploration in the portal.
7. Build & Deployment
    * With updated content and code.json, Jekyll builds the site using the theme.
    * The output is pushed to a static hosting service (e.g. GitHub Pages, Netlify), serving end-users with the latest content.
      
## 📁 Folder Structure

```plaintext
opensource-nist-pages/
├── _config.yml              ← Jekyll config + collection definitions
├── Gemfile                  ← Ruby dependencies
├── Makefile                 ← Common commands for build/serve/clean
├── Dockerfile & docker-compose.yml  ← Containerized development
├── .travis.yml              ← CI pipeline config
├── .codeinventory.json      ← Source file metadata
│
├── catalog/                 ← Software entries (.md with YAML front matter)
├── repo/                    ← Detailed repository Markdown
├── category/                ← Category index pages
├── _posts/                  ← Blog/news entries
├── radiuss/                 ← RADIUSS-special collection
├── explore/                 ← Data viz and word-cloud assets
│
├── _layouts/                ← Jekyll HTML layouts
├── _includes/               ← Partial templates (header/footer/navigation)
├── css/                     ← Stylesheets (Bootstrap, FontAwesome, custom)
├── js/                      ← Client-side scripts (AngularJS, D3, jQuery, search logic)
├── assets/images/           ← Logos and screenshots
│
├── about/                   ← Static about & FAQ pages
├── api/                     ← Placeholder API directory
├── index.html               ← Site homepage template
├── LICENSE                  ← MIT license
├── NOTICE                   ← Third-party notices
└── README.md                ← This documentation
```

## 📘 Technical Details

### Jekyll Build Process
* Collections: Defined in _config.yml (e.g., catalog, repo, category, radiuss, _posts)
* Markdown files with front matter are converted into HTML via layouts in _layouts/
* Includes support reusable components (_includes/header.html, _includes/footer.html, etc.)
* Indexing: JavaScript (AngularJS / jQuery) creates searchable, filterable lists at runtime

### Client-Side Features
* Search: Real-time JavaScript search across catalog and repos
* Visualizations: D3.js word clouds and charts in explore/ directory
* UI Frameworks: Bootstrap for responsiveness, Font Awesome for icons

### Development & Deployment Workflow
1- Install dependencies:
```bash
gem install bundler
bundle install
```
2- Local development:
```bash
Copy
Edit
make serve
# or via Jekyll
bundle exec jekyll serve --livereload
# or via Docker:
docker-compose build && docker-compose up
Run tests/lint, optionally integrated via .travis.yml CI
```
3- Build production site:
```bash
Copy
Edit
make build
# or
bundle exec jekyll build
```
- Site output → _site/ directory
- Deploy via your chosen static host (GitHub Pages, Netlify, AWS S3, etc.)

## ☁️ Continuous Integration
* .travis.yml runs on every push:
  - Installs dependencies
  - Builds site
  - Optionally deploys on successful builds on main branch
* Use your own CI (GitHub Actions, CircleCI) by mirroring this pipeline

## 👥 Contributing
1- Fork the repo and clone your fork
2- Create a branch:
```bash
Copy
Edit
git checkout -b feature/your-feature
```
3- Preview locally
4- Commit and PR against main (or default)
5- Follow coding standards in HTML, CSS, JS, and Markdown

## ⚖️ License
Distributed under the MIT License. See LICENSE for details.
