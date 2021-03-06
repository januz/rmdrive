
<!-- README.md is generated from README.Rmd. Please edit that file -->

# rmdrive <img src="man/figures/rmdrive_hex.png" align="right" width ="150" height="165"/>

`rmdrive` provides convenience functions to copy `.Rmd` files to Google
Drive for synchronous collaborative editing, then return them back to a
local `.Rmd` file for rendering.

# Installation

This package is not on CRAN. To install it, please run the following
code:

``` r
remotes::install_github("januz/rmdrive")
```

# How to use

While the functions in this package can accommodate different workflows,
it has been designed with the following workflow in mind:

1.  The main contributor to a data science project (the first author in
    an academic context) develops the analysis code and writes a first
    draft of the manuscript associated with the project on their local
    computer using, e.g., RStudio.
2.  When the project reaches a state in which the main contributor would
    like to facilitate feedback from other contributors to the project,
    they
      - share the project by giving contributors access to the
        associated Git repository.
      - upload the fist draft of the manuscript to a shared Google Drive
        document using `rmdrive::upload_rmd()`.
3.  All contributors review and edit the manuscript draft by using
    ‘Suggesting’ mode and comments in Google Drive
4.  If contributors would like to render a version of the manuscript
    including their suggestions, they
    1.  temporarily [accept all
        suggestions](https://support.google.com/docs/answer/6033474?co=GENIE.Platform%3DDesktop&hl=en).
    2.  use `rmdrive::render_rmd()` to render the changed script
        manuscript locally.
    3.  use `Undo` in Google Drive to show changes as suggestions again.
5.  After all contributors have finished their review, the main
    contributor resolves all comments and accepts/rejects suggestions in
    Google Drive, using `rmdrive::render_rmd()` intermittently to render
    the changed manuscript locally.
6.  The main contributor downloads the final manuscript containing all
    changes using `rmdrive::download_rmd()` and commits it to the Git
    repository.
7.  If, at a later point, the main contributor adds more substantive
    changes to the manuscript and would like the contributors to review
    the manuscript again, they can upload the newest local version to
    the same Google Drive document used before using
    `rmdrive::update_rmd()` and go through the above steps again.

# Documentation

The package has 4 main functions:

  - `upload_rmd()` uploads a local `.Rmd` file to Google Drive
  - `update_rmd()` uploads a local `.Rmd` file to an already existing
    file in Google Drive
  - `download_rmd()` downloads a file from Google Drive and saves it as
    a local `.Rmd` file if its content has changed
  - `render_rmd()` executes `download_rmd()` and renders the resulting
    `.Rmd` file using `rmarkdown::render()`

All functions have the same four arguments to specify which local `.Rmd`
file and Google Drives file to operate on (demonstrated here with
`upload_rmd()`:

``` r
rmdrive::upload_rmd(
  file       = "path/to/local-rmd-file"   # specifies the local `.Rmd` file (without extension)
  gfile      = "google-drive-file"        # specifies the name of the file on Google Drive (optional; defaults to `basename(file)`)
  path       = "folder/sub-folder"        # specifies a folder in Google Drive (optional; if not specified, the home directory of My Drive or the Team Drive is used)
  team_drive = "Team Drive Name"          # specifies the name of Team Drive (optional; if not specified, My Drive is used)
)
```
