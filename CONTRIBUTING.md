# Contributing to the Student Depression Predictor project

This guide explains how to change the analysis, add a package, or update the published report. For a substantial change, discuss it with the team in a GitHub issue first. Keep each contribution focused and make changes on a branch, not directly on `main`.

## Fixing typos and editing the report

Make report edits in the Quarto source, [`reports/Student_Depression_Analysis.qmd`](reports/Student_Depression_Analysis.qmd), not in the rendered HTML or PDF. Render the report in the container and inspect the output before opening a pull request.

## Setting up the project

Follow the [README Usage setup steps](README.md#usage) to install Docker, clone the repository, make an SSH key, and download the image. Those setup steps are not repeated here. Run host-side commands from the repository root.

Before starting the container, check that Git has your name and the email associated with your GitHub account:

```bash
git config --global user.name
git config --global user.email
```

If either command prints nothing, configure them on your computer. The Compose file shares your `~/.gitconfig` with the container:

```bash
git config --global user.name "Your Name"
git config --global user.email "you@example.com"
```

## Working in the container with Positron

Install [Positron](https://positron.posit.co/download.html) on your computer. Its Remote SSH feature is built in. Each time you work on the project, start the container from a terminal on your computer:

```bash
docker compose up -d
docker compose ps
```

Check that `analysis-env` is running. In Positron, open the Command Palette (`Cmd+Shift+P` on macOS or `Ctrl+Shift+P` on Windows), run **Remote SSH: Show Remote Menu**, choose **Connect to Host**, and enter `root@localhost:2222`. If prompted, select Linux as the remote platform and trust the host.

The new Positron window may initially show no folder. Open `/workspace`, which is the project directory shared with the container. Select `/opt/venv/bin/python` as the Python interpreter; this is the project environment built from `uv.lock`. Do not select a local `.venv` or the container's system Python.

Run the report from a terminal in the remote Positron window:

```bash
cd /workspace
uv run quarto render
```

When finished, close the remote window and stop and remove the container from a terminal on your computer:

```bash
docker compose down
```

### If the SSH connection fails

The key setup and the warning about Docker creating a folder named `~/.ssh/id_ed25519.pub` are in the [README setup steps](README.md#usage). Also check that `~/.gitconfig` is a file, not a directory; configure your Git name and email on the host before starting Compose.

If SSH asks for a password, confirm that your public key is named `~/.ssh/id_ed25519.pub` and that the path in `docker-compose.yml` matches it. If Positron reports that the remote host identification has changed after an image update, remove the old host key and reconnect:

```bash
ssh-keygen -R "[localhost]:2222"
```

If port `2222` is already in use, change the host-side port (the first number) in `docker-compose.yml` and connect Positron to `root@localhost:<port>`. On Linux, an SSH key ownership or permissions error may require a change to the SSH server configuration in the `Dockerfile`; coordinate that change with the team, then pull the rebuilt image.

For further details, see the course's [step-by-step Positron SSH guide](https://ubc-mds.github.io/DSCI_522_dsci-workflows_students/assignments/milestone2.html#positron-ssh).

## Adding or updating a package

On a feature branch, add the package with an exact version from the container terminal:

```bash
uv add <package>==<version>
```

Commit the updated `pyproject.toml` and `uv.lock` together, then push the branch. Wait for GitHub Actions to publish the new image and update the tag in `docker-compose.yml`. From a terminal on your computer in the repository root, get the workflow's commit and pull the new image:

```bash
git pull
docker compose pull
```

If the container is running, recreate it to use the new image:

```bash
docker compose down
docker compose up -d
```

Open a pull request into `main`. After it is merged, GitHub Actions builds and publishes the image for `main` and updates its Compose tag. Once that workflow finishes, teammates should pull the latest `main` commit and image before continuing to work:

```bash
git pull
docker compose pull
```

## Publishing the report

The GitHub Pages report is the self-contained HTML copy at `docs/index.html`. After re-rendering the report, copy the new HTML file there from the repository root and include it in your commit:

```bash
cp reports/Student_Depression_Analysis.html docs/index.html
```

In PowerShell, the equivalent command is:

```powershell
Copy-Item reports/Student_Depression_Analysis.html docs/index.html
```

Then push the change so GitHub Pages can publish the updated report. The repository already contains `docs/.nojekyll`; keep it in place.

## Pull request process

Create a focused branch from an up-to-date `main` for each change, using a name that describes the work, such as `update-readme` or `add-eda-figure`. Make clear commits and open a pull request into `main` that explains what changed and links the relevant issue. Before opening the pull request, run `uv run quarto render` in the container and inspect the generated report. At least one teammate must review the pull request before it is merged.

Use GitHub issues to coordinate with the team; the milestone expects at least three issues per team member on average. If you used an AI tool, describe which tool you used and how in the pull request, and verify any generated changes before proposing them.

## Code of Conduct

This project follows the [Contributor Code of Conduct](CODE_OF_CONDUCT.md). By participating, you agree to abide by its terms.

## Attribution

These guidelines are adapted from the [DSCI 522 breast cancer predictor project template](https://github.com/UBC-MDS/DSCI_522_project-template-breast-cancer-predictor).
