# Contributing to the Student Depression Predictor project

This outlines how to propose a change to the Student Depression Predictor project.

### Fixing typos

Small edits can be made in the GitHub web interface in the `.qmd` source file,
but make sure you render the report to confirm that your edits
are correct.

### Prerequisites

Commits should be small and incremental, so that if there is a problem, it is an
easy revert. Always make sure that you are working on your own branch and not on
the `main` branch.

### Setting up the project

Install [uv](https://docs.astral.sh/uv/getting-started/installation/) and
[Quarto](https://quarto.org/docs/get-started/), then clone the repository and
create the virtual environment from the root of the repository:

``` bash
git clone https://github.com/UBC-MDS-2026-27/DSCI-522-Group-24-Predicting-Student-Depression.git
cd DSCI-522-Group-24-Predicting-Student-Depression
uv sync
```

To render the HTML and PDF reports:

``` bash
uv run quarto render
```

To preview the report while editing:

``` bash
uv run quarto preview reports/Student_Depression_Analysis.qmd
```

If your change needs a new Python package, add it with `uv add <package>`
(this pins an exact version in `pyproject.toml` and updates `uv.lock`),
and commit both files.

### Pull request process

1. Do not commit to the `main` branch.
2. Create a branch and make sure the branch name describes the work you want to do
   (for example, `fix-readme-typo` or `add-eda-figure`).
3. Keep the branch small and focused on one piece of work.
4. Make sure your commit messages are clear and describe what each commit changes.
5. Once your work is complete, push your branch to GitHub.
6. Open a pull request into `main`, and make sure the pull request description
   contains information describing what you changed.
7. Create an issue or ask a team member to review your pull request.
8. Wait for one person to review the pull request, and only merge it once it has
   been reviewed.

### Using AI

You can use tools like ChatGPT or Claude to help with code writing and/or understanding, or fixing unexpected errors. Please make sure you understand and check the results as you are responsible for the code you put into your branch and pull request. Please mention what tool you used and what you used it for in your pull request description. Opening issues, opening pull requests, reviewing and merging pull requests must be executed by humans, not AI tools.

### Code of Conduct

Please note that this project is released with a [Contributor Code of
Conduct](CODE_OF_CONDUCT.md). By participating in this project you agree to
abide by its terms.

### Attribution

These contributing guidelines were adapted from the breast cancer predictor
project template used in DSCI 522:
[DSCI_522_project-template-breast-cancer-predictor](https://github.com/UBC-MDS/DSCI_522_project-template-breast-cancer-predictor).
