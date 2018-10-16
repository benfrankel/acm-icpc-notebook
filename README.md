# Competitive Programming Notebook
This is an ACM ICPC resource written in Markdown that compiles to a single PDF file.

## Usage
Each markdown page in `src/` must be compiled to html, printed to PDF, then merged with the other pages into a single notebook. To build from source, proceed with the following steps:

### Prerequisites
1. [Node.js](https://nodejs.org/en/)
2. [npm](https://www.npmjs.com/)
3. [poppler](https://poppler.freedesktop.org/)
4. [pandoc](https://pandoc.org/)
5. [make](https://www.gnu.org/software/make/)

### Dependencies
Run `npm install` in the top-level directory to install Node.js dependencies.

### Build
Run `make` in the top-level directory to build the PDF.

### View
Open `build/notebook.pdf` with your document viewer.
