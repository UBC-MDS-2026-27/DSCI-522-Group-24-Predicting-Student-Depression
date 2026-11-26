# Predicting Student Depression

**Authors:** Isaac Wu, Quinn Scheider, Ankit Chhikara, and Shrey Mudgal

Course project for DSCI 522 (Reproducible and Trustworthy Data Science Workflows) in the Master of Data Science program at the University of British Columbia.

## About

This project explores student depression using the [Student Depression Detection Dataset](https://www.kaggle.com/datasets/mkhoirulmustaqim/student-depression-detection-dataset). It contains 4,464 student records, 12 predictor variables covering demographic, socioeconomic, academic, relationship, and health information, and a binary `Depression` outcome (`Yes` or `No`).

The analysis cleans and inspects the data, performs exploratory data analysis, and compares logistic regression with a majority-class baseline. The data is split into stratified training and test sets (80/20, random seed 42). Five-fold stratified cross-validation is used on the training data, and final metrics are reported on the held-out test data.

On the held-out test set, logistic regression achieved an accuracy of 0.971, precision of 0.961, recall of 0.929, and F1 score of 0.945. The majority-class baseline achieved an accuracy of 0.731. These results apply to this dataset and split and do not establish that the model generalizes to other student populations.

**Limitations:** Health-condition categories are strongly associated with the depression labels in this dataset and may inflate model performance. This possible source of target leakage warrants further investigation. This model is for an academic project only and must not be used to diagnose depression or make decisions about an individual's care.

## Report

Read the [published HTML report](https://ubc-mds-2026-27.github.io/DSCI-522-Group-24-Predicting-Student-Depression/) or open the [PDF report](reports/Student_Depression_Analysis.pdf). The editable [Quarto source](reports/Student_Depression_Analysis.qmd) is also available.

## Usage

We run the analysis in a Docker container so that users share the same software and package versions. The image is published on [Docker Hub](https://hub.docker.com/r/qscheide/dsci-522-group-24-predicting-student-depression).

### Setup

Install and launch [Docker](https://www.docker.com/get-started/), then clone this repository and move into its root directory:

```bash
git clone https://github.com/UBC-MDS-2026-27/DSCI-522-Group-24-Predicting-Student-Depression.git
cd DSCI-522-Group-24-Predicting-Student-Depression
```

If you do not already have an Ed25519 SSH key, make one before running Docker Compose. Press Enter at each prompt to accept the defaults:

```bash
ssh-keygen -t ed25519
```

Without this key, Docker may create a folder named `~/.ssh/id_ed25519.pub`, and SSH access to the container will fail. If that happens, stop Compose and confirm that this path is an accidentally created empty folder, not a key file. Remove the folder with `rmdir ~/.ssh/id_ed25519.pub` on macOS/Linux or `Remove-Item "$HOME\.ssh\id_ed25519.pub"` in PowerShell, then create the key and retry.

Download the project image:

```bash
docker compose pull
```

Run all commands below from the repository root. This project uses Python, so render the report in the container with:

```bash
docker compose run --rm analysis-env uv run quarto render
```

The repository's [`_quarto.yml`](_quarto.yml) already lists `reports/*.qmd`, so no report path needs to be added to the render command. The HTML and PDF reports are written next to their source in `reports/`, and the processed dataset is updated at `data/processed/student_depression_clean.csv`. The HTML is self-contained. The raw dataset is included at `data/raw/Student_Depression_Dataset.csv`; if it is missing, the analysis downloads it from Kaggle using `kagglehub`, which requires an internet connection.

The `--rm` option removes the container automatically when rendering finishes. The container includes Quarto and the Python version selected by [`.python-version`](.python-version); Python packages are specified in [`pyproject.toml`](pyproject.toml) and locked in [`uv.lock`](uv.lock).

## Contributing

See [`CONTRIBUTING.md`](CONTRIBUTING.md) for setup and instructions on changing the analysis.

## AI use

We used [ChatGPT](https://chatgpt.com/) GPT-6 to resolve Git-related merge conflicts, explain error messages and other code-related issues, and assist with writing and debugging code for our analysis. We used [DeepSeek](https://www.deepseek.com/en/) 4.1 Flash to draft and revise the repository documentation, specifically [`CONTRIBUTING.md`](CONTRIBUTING.md) and [`LICENSE.md`](LICENSE.md); DeepSeek was not used in the data analysis. In addition, we used Gemini for checking grammars and documentations. All AI-generated changes were reviewed, tested, and edited by the authors, who take full responsibility for the content of this repository.

Example prompts:

- “Are there any remaining issues with the YAML header, Python setup chunk, or citations?”
- “What does `git pull --ff-only` do, and when should I use it?”
- “I have started my work, i already created a branch locally and i have edited the code of conduct .md file. However, i did a merging on the comment regarding the report. Do i need to pull again since there might be changes when i want to push, What do you advice just to avoid merge conflicts.”
- “Instead of me saying almost always 3, can i use proportion, then the 2 charts in the middle of my plot is shifted, anything wrong with my code?”

## License

The analysis report is licensed under [CC BY-NC-ND 4.0](https://creativecommons.org/licenses/by-nc-nd/4.0/), and the software code is licensed under the [MIT License](LICENSE.md). See [`LICENSE.md`](LICENSE.md) for the full terms.

## References

- mkhoirulmustaqim. (n.d.). *Student Depression Detection Dataset* [Data set]. Kaggle. [Dataset page](https://www.kaggle.com/datasets/mkhoirulmustaqim/student-depression-detection-dataset).
- Additional research, software, and AI references are listed in the [analysis report](reports/Student_Depression_Analysis.html).
