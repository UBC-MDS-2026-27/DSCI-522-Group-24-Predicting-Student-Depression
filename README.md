# Predicting Student Depression

**Authors:** Isaac Wu, Quinn Scheider, Ankit Chhikara, and Shrey Mudgal

Course project for DSCI 522 (Reproducible and Trustworthy Data Science Workflows) in the Master of Data Science program at the University of British Columbia.

## About

This project explores student depression using the [Student Depression Detection Dataset](https://www.kaggle.com/datasets/mkhoirulmustaqim/student-depression-detection-dataset). It contains 4,464 student records, 12 predictor variables covering demographic, socioeconomic, academic, relationship, and health information, and a binary `Depression` outcome (`Yes` or `No`).

The analysis cleans and inspects the data, performs exploratory data analysis, and compares logistic regression with a majority-class baseline. The data is split into stratified training and test sets (80/20, random seed 42). Five-fold stratified cross-validation is used on the training data, and final metrics are reported on the held-out test data.

On the held-out test set, logistic regression achieved an accuracy of 0.971, precision of 0.961, recall of 0.929, and F1 score of 0.945. The majority-class baseline achieved an accuracy of 0.731. These results apply to this dataset and split and do not establish that the model generalizes to other student populations.

**Limitations:** Health-condition categories are strongly associated with the depression labels in this dataset and may inflate model performance. This possible source of target leakage warrants further investigation. This model is for an academic project only and must not be used to diagnose depression or make decisions about an individual's care.

## Report

Read the [published HTML report](https://ubc-mds-2026-27.github.io/DSCI-522-Group-24-Predicting-Student-Depression/reports/Student_Depression_Analysis.html) or open the [PDF report](reports/Student_Depression_Analysis.pdf). The editable [Quarto source](reports/Student_Depression_Analysis.qmd) is also available.

## Usage

Install [uv](https://docs.astral.sh/uv/getting-started/installation/) and [Quarto](https://quarto.org/docs/get-started/). The project requires Python 3.13 or later; the repository's [`.python-version`](.python-version) selects Python 3.14.

Clone the repository and move into the project directory:

```bash
git clone https://github.com/UBC-MDS-2026-27/DSCI-522-Group-24-Predicting-Student-Depression.git
cd DSCI-522-Group-24-Predicting-Student-Depression
```

Create the project environment and install its dependencies:

```bash
uv sync
```

Render the HTML and PDF reports from the repository root:

```bash
uv run quarto render
```

The reports are written next to their source in `reports/`. The HTML is self-contained. The raw dataset is included at `data/raw/Student_Depression_Dataset.csv`. If the raw file is unavailable, the analysis code downloads it from Kaggle using `kagglehub`, which requires an internet connection.

## Dependencies

- [Python](https://www.python.org/) 3.13 or later (3.14 selected in `.python-version`)
- [uv](https://docs.astral.sh/uv/) for environment and dependency management
- [Quarto](https://quarto.org/) for rendering the report
- Python packages listed in [`pyproject.toml`](pyproject.toml) and locked in [`uv.lock`](uv.lock), including pandas, NumPy, scikit-learn, Altair, and kagglehub


### Kaggle API Setup (Optional for Public Dataset)
The dataset (`mkhoirulmustaqim/student-depression-detection-dataset`) is publicly hosted on Kaggle, so `kagglehub.dataset_download()` runs without authentication by default. 

If you encounter a `403 Forbidden` or rate-limit error during the fallback download, configure your Kaggle API token:
1. Log in to [Kaggle](https://www.kaggle.com/), go to **Settings** → **API**, and click **Create New Token** to download `kaggle.json`.
2. Place `kaggle.json` in your system's default directory:
   - **macOS / Linux:** `~/.kaggle/kaggle.json` (run `chmod 600 ~/.kaggle/kaggle.json`)
   - **Windows:** `C:\Users\<YourUsername>\.kaggle\kaggle.json`
   

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
