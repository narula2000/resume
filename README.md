# Vikrom's Resume

Template is a from [Avinal Kumar](https://github.com/avinal/resume)


## Requirement(s)
You must compile this resume with `XeTeX`, `XeLaTex`, `LuaTeX` or `LuaLaTeX`. *(pdfLaTex is incompatible with fontawesome)*

This resume template uses following extra packages:-
- [fontawesome](https://ctan.org/pkg/fontawesome) - For fontawesome icons
- [xcolor](https://ctan.org/pkg/xcolor) - Custom coloring
- [fontspec](https://ctan.org/pkg/fontspec) - Custom font selection
- [fancyhdr](https://ctan.org/pkg/fancyhdr) - Custom header and footer design
- [titlesec](https://ctan.org/pkg/titlesec) - Format sections, subsections, chapters
- [hyperref](https://ctan.org/pkg/hyperref) - Link and pdf options
- [geometry](https://ctan.org/pkg/geometry) - Document dimensioning

In addition to packages, [Roboto](https://fonts.google.com/specimen/Roboto) font family is required. *(Fonts are bundled with the project)*

## Docker build

Requires [Docker](https://docs.docker.com/engine/install/) with BuildKit enabled (default in modern Docker).

### Build and extract the PDF directly into the current directory

```bash
docker build --output type=local,dest=. --target artifact .
```

### Or build the image, then copy the PDF out

```bash
docker build -t resume .
docker create --name resume-build resume /bin/true
docker cp resume-build:/resume.pdf ./resume.pdf
docker rm resume-build
```

### Compile locally (without Docker)

```bash
lualatex -interaction nonstopmode -jobname=resume index.tex
lualatex -interaction nonstopmode -jobname=resume index.tex
```

The second pass resolves cross-references. Clean up the `*.aux`, `*.log`, and `*.out` artifacts afterwards.
