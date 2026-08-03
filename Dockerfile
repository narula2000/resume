# syntax=docker/dockerfile:1

# ---- Build stage: compiles the resume with LuaLaTeX ----
FROM debian:bookworm-slim AS build

RUN apt-get update && apt-get install -y --no-install-recommends \
    texlive-luatex \
    texlive-latex-extra \
    texlive-fonts-extra \
    fonts-font-awesome \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /resume
COPY . .

RUN lualatex -interaction nonstopmode -jobname=resume index.tex \
    && lualatex -interaction nonstopmode -jobname=resume index.tex \
    && mv resume.pdf /resume.pdf

# ---- Artifact stage: final image contains only the compiled PDF ----
FROM scratch AS artifact
COPY --from=build /resume.pdf /resume.pdf
