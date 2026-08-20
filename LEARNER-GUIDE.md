# Data Analytics and Visualization with R — Learner Guide

**Course Code:** TGS-2026064475  
**Version:** v12.0 · 20 August 2026  
**TSC:** Analysis of Research Data · HCE-DAT-4008-1.1  

> The slide deck is concept-led. This guide contains the detailed procedures for every R lab.

## Document Version Control

| Version | Release date | Summary | Author |
|---|---|---|---|
| 11.0 | Legacy release | Legacy PPT and supporting R exercises used as the source baseline. | Tertiary Infotech Academy |
| 12.0 | 20 August 2026 | Rebuilt for TGS-2026064475; visual deck, ten self-contained R labs with Excel evidence workbooks, aligned WA/PP assessments and publication pipeline. | Dr Alfred Ang |

## Learning Outcomes

- LO1: Prepare and transform data for analysis using R.
- LO2: Summarise data with descriptive statistics, figures, graphs and tables.
- LO3: Perform quantitative data analysis and interpret the findings.
- LO4: Perform qualitative data analysis and determine significance or effect.
- LO5: Create effective data visualisations in R and interpret research findings.

## Course and Repository Access

- LMS/TMS: https://lms-tms.tertiaryinfotech.com/
- GitHub courseware: https://github.com/tertiarycourses/TGS-2026064475-Data-Analytics-and-Visualization-with-R
- Keep each numbered lab folder intact. Run its `.R` script from that folder and complete its `.xlsx` evidence workbook.

## Skills Framework Alignment

- **K1 (Knowledge):** Strengths and limitations of different statistical techniques
- **K2 (Knowledge):** Data visualisation tools
- **A1 (Ability):** Apply data transformation and preparation techniques to datasets
- **A2 (Ability):** Summarise data using descriptive statistics, figures, graphs and tables
- **A3 (Ability):** Apply appropriate statistical and analytics techniques to analyse quantitative data
- **A4 (Ability):** Apply appropriate statistical and analytics techniques to analyse qualitative data
- **A5 (Ability):** Determine significance and effect size of findings
- **A6 (Ability):** Use visualisation software to create visualisations for presenting results
- **A7 (Ability):** Identify potential interpretations for obtained results
- **A8 (Ability):** Review analysis of data to ensure accuracy
- **A9 (Ability):** Interpret research findings

## Topic 01: Data Preparation and Transformation

Research-data workflow · import/export · tidy structure · cleaning · joins · transformation

### Research data becomes evidence through a controlled workflow

- **Frame:** Define the research question, population, outcome and unit of observation.
- **Acquire:** Record source, owner, period, consent and extraction conditions.
- **Prepare:** Type, clean, transform and join without destroying source evidence.
- **Validate:** Reconcile records and totals before analysis or visualisation.

### R analysis packages form a coherent toolkit

- **Base R:** Import, inspect, reshape, model and plot with the core language.
- **tidyverse:** A consistent grammar for import, manipulation and visualisation.
- **readxl:** Reads Excel worksheets while preserving typed rectangular data.
- **ggplot2:** Builds layered graphics from data, aesthetics and geoms.

### Tidy data makes transformations composable

- **Variable:** Each measured attribute occupies one column.
- **Observation:** Each unit or event occupies one row.
- **Value:** Each cell contains one atomic value.
- **Table:** Each observational unit forms its own analytical table.

### Import is a data-contract decision

- **Delimiter:** Confirm comma, tab or other field boundaries.
- **Header:** Use stable unique names that survive refresh.
- **Type:** Declare dates, identifiers, numbers and categories deliberately.
- **Locale:** Check date order, decimal marks and character encoding.

### CSV and Excel serve different purposes

- **CSV:** Portable plain text with one table and no formulas or styles.
- **Excel:** Multiple sheets, formulas and formatted control/evidence surfaces.
- **Risk:** Spreadsheet display can hide underlying types or errors.
- **Control:** Keep an analysis-ready CSV beside the learner evidence workbook.

### Select columns to define analytical scope

- **Relevance:** Keep variables required by the question and validation controls.
- **Privacy:** Exclude identifiers or sensitive fields that are not necessary.
- **Order:** Place keys, dimensions and measures in a reviewable sequence.
- **Lineage:** Document fields removed or renamed and why.

### Filter rows with explicit inclusion rules

- **Condition:** Write the population rule before seeing the result.
- **Boolean logic:** Use AND, OR and NOT with deliberate parentheses.
- **Missing values:** NA comparisons require explicit is.na() handling.
- **Evidence:** Record input, excluded and output row counts.

### Logical operators define the population

- **AND:** Every condition must be true for a row to remain.
- **OR:** At least one condition is sufficient.
- **NOT:** Excludes a defined condition rather than an informal exception.
- **Audit:** Test rules on known boundary records before full use.

### Missingness is a pattern, not merely a nuisance

- **Unknown:** The value was not observed or recorded.
- **Not applicable:** The variable has no meaning for this observation.
- **Invalid:** A value fails type, range or relationship rules.
- **Decision:** Exclude, impute or retain with a documented rationale.

### Mutate creates derived analytical variables

- **Formula:** Express the relationship in visible code, such as BMI = weight/height².
- **Unit:** Check that source units make the result meaningful.
- **Boundary:** Test zero, negative, missing and extreme inputs.
- **Trace:** Keep the original columns beside the derived value.

### Dates turn periods into ordered evidence

- **Source:** Year and week fields need a documented calendar convention.
- **Parse:** Convert strings to true dates instead of plotting labels.
- **Validate:** Reject impossible or ambiguous dates visibly.
- **Use:** True dates enable sorting, intervals, trends and seasonality.

### Joins enrich data—and can corrupt it silently

- **Left join:** Preserves every analytical record while adding reference attributes.
- **Inner join:** Keeps only matched records and can hide missing keys.
- **Many-to-many:** Duplicates records and inflates totals when keys are not unique.
- **Control:** Check key uniqueness, unmatched keys and row preservation.

### Join type follows the analytical question

- **Left:** Keep all observations from the primary dataset.
- **Inner:** Retain only keys present in both tables when justified.
- **Full:** Surface every key from both sources for reconciliation.
- **Anti:** Isolate unmatched records as a quality exception.

### Reshaping changes structure, not meaning

- **Long:** One measurement column plus key/value variables supports grouping and plotting.
- **Wide:** Repeated categories occupy columns for comparison or delivery.
- **Identifier:** Keys must remain stable through every pivot.
- **Reconcile:** Totals and distinct observations should remain explainable.

### Aggregation changes the unit of observation

- **Group:** Define the dimensions that create each summary row.
- **Measure:** Choose sum, count, mean or another statistic intentionally.
- **Denominator:** Retain n and exposure when comparing groups.
- **Risk:** Aggregates can conceal within-group variation and missingness.

### Pipes make the analytical story readable

- **Sequence:** Each operation receives the result of the previous stage.
- **Names:** Assign meaningful intermediate outputs at review boundaries.
- **Debug:** Inspect after import, join, filter and aggregation gates.
- **Reproducibility:** The same source and code should recreate the result.

### Reconciliation catches silent loss

- **Rows:** Input = retained + documented exclusions.
- **Keys:** Distinct business keys remain unique where required.
- **Totals:** Material measures agree before and after transformation.
- **Exceptions:** Unmatched, invalid or missing records are countable and owned.

### A release-ready dataset carries evidence

- **Source:** Origin, extraction date and owner.
- **Code:** Versioned script and package/session information.
- **Controls:** Row, key, total and exception checks.
- **Limitations:** Known missingness, bias, transformations and allowed use.

### Lab 1: Prepare and Transform Dengue Surveillance Data

**Alignment:** LO1 · A1  
**R script:** `lab-01-data-preparation.R`  
**Excel evidence:** `lab-01-data-preparation.xlsx`  
**Expected output:** A reproducible clean dengue time-series dataset, transformation log and reconciliation evidence.  

Import weekly dengue surveillance data, inspect types and missingness, filter a defined population, construct dates and export a controlled analysis table.

#### Before you begin

- Keep the script, workbook and data folder together.
- Read the workbook scenario, definitions and controls before running code.
- Run the script from the lab folder and preserve source CSV files.

#### Detailed procedure

1. Open the lab folder and review the scenario, data dictionary and control totals in the Excel workbook.
   - **Action/evidence:** Open lab-01-data-preparation.xlsx and data/dengue.csv
2. Set the R working directory to this lab folder or open the folder as an RStudio Project.
   - **Action/evidence:** Use Session > Set Working Directory > To Source File Location
3. Run the script section that imports the CSV without changing the source file.
   - **Action/evidence:** source('lab-01-data-preparation.R', echo = TRUE)
4. Inspect column names, types, record count, distinct case types and missing values.
   - **Action/evidence:** Review str(), summary(), table() and colSums(is.na()) output
5. Keep complete Dengue records and construct a Monday date from year and epidemiological week.
   - **Action/evidence:** Verify clean_dengue contains year, eweek, type_dengue, number and date
6. Reconcile input, excluded and output rows and review the exported transformation log.
   - **Action/evidence:** Open outputs/lab-01-transformation-log.csv
7. Inspect the generated time-series plot and record one defensible observation in the Evidence sheet.
   - **Action/evidence:** Open outputs/lab-01-dengue-trend.png
8. Save the workbook evidence and retain the R console output.
   - **Action/evidence:** Complete the Evidence and Reflection sheets

#### Troubleshooting

- File not found: confirm the working folder and data filename.
- Package unavailable: use the supplied base-R fallback and read the console message.
- Unexpected categories: inspect unique values and standardise deliberately.
- Control mismatch: stop interpretation and trace the divergence.

#### Acceptance

> The script runs without error, output rows reconcile to input less documented exclusions, dates are valid, and the clean CSV and plot are created.

### Lab 2: Join, Reshape and Aggregate Vaccination Data

**Alignment:** LO1 · A1 · A8  
**R script:** `lab-02-join-reshape.R`  
**Excel evidence:** `lab-02-join-reshape.xlsx`  
**Expected output:** A joined long-form vaccination dataset, unmatched-key report, annual summary and transformation audit.  

Standardise vaccination and clinic reference data, join on controlled keys, reshape between wide and long forms and produce an auditable annual summary.

#### Before you begin

- Keep the script, workbook and data folder together.
- Read the workbook scenario, definitions and controls before running code.
- Run the script from the lab folder and preserve source CSV files.

#### Detailed procedure

1. Review the vaccination and clinic reference tables plus their keys in the workbook.
   - **Action/evidence:** Open lab-02-join-reshape.xlsx and data/*.csv
2. Run the script and inspect uniqueness of vaccination_type in the clinic reference.
   - **Action/evidence:** source('lab-02-join-reshape.R', echo = TRUE)
3. Standardise text keys by trimming whitespace and applying consistent case.
   - **Action/evidence:** Inspect the standardise_key() function and key audit
4. Join the vaccination observations to the clinic reference using a left join.
   - **Action/evidence:** Verify the joined row count equals the vaccination input row count
5. Review and resolve any unmatched keys before interpreting the summary.
   - **Action/evidence:** Open outputs/lab-02-unmatched-keys.csv
6. Create annual totals by vaccine group and a wide comparison table.
   - **Action/evidence:** Open outputs/lab-02-annual-summary.csv and lab-02-wide-summary.csv
7. Check totals before and after reshaping and record the result in the Control sheet.
   - **Action/evidence:** Input doses must equal grouped-summary doses
8. Write one limitation about aggregation or key quality in the Evidence sheet.
   - **Action/evidence:** Complete Evidence!B6:B8

#### Troubleshooting

- File not found: confirm the working folder and data filename.
- Package unavailable: use the supplied base-R fallback and read the console message.
- Unexpected categories: inspect unique values and standardise deliberately.
- Control mismatch: stop interpretation and trace the divergence.

#### Acceptance

> The left join preserves all source rows, unmatched keys are zero or documented, and total doses reconcile across input, long and wide summaries.


## Topic 02: Data Summary

Data types · descriptive statistics · distribution · grouped summaries · basic plots and tables

### Variable type determines valid summaries

- **Nominal:** Categories with no inherent order.
- **Ordinal:** Categories with an order but not equal intervals.
- **Discrete:** Countable numeric outcomes.
- **Continuous:** Measurements on an interval or ratio scale.

### Qualitative and quantitative answer different questions

- **Qualitative:** What kinds, themes or experiences occur?
- **Quantitative:** How many, how much or how strongly?
- **Mixed evidence:** Counts locate patterns; text explains context and meaning.
- **Risk:** Do not turn labels into arithmetic merely by coding numbers.

### Frequency tables reveal category structure

- **Count:** Number of observations in each level.
- **Proportion:** Count divided by a clearly stated denominator.
- **Missing:** Display unknown or excluded categories explicitly.
- **Comparison:** Use common denominators when comparing groups.

### Mean describes balance; median describes position

- **Mean:** Uses every value and is sensitive to extremes.
- **Median:** Splits ordered observations into two halves.
- **Symmetry:** Mean and median are usually close.
- **Skew:** Their separation is a warning to inspect distribution.

### Mean and median respond differently to outliers

- **Baseline:** Without extremes, centre measures often agree.
- **Outlier:** A large value pulls the mean more than the median.
- **Choice:** Select the statistic that answers the research question.
- **Disclosure:** Report distribution and sample size beside the centre.

### Trimmed means trade sensitivity for robustness

- **Rule:** Remove a fixed proportion from each tail before averaging.
- **Benefit:** Reduces the influence of extreme observations.
- **Cost:** Discarded tails may contain real, important cases.
- **Use:** Compare trim levels rather than selecting one after the fact.

### Range is simple but fragile

- **Definition:** Maximum minus minimum.
- **Strength:** Easy to calculate and explain.
- **Weakness:** Depends on only two observations.
- **Use:** Pair with IQR or standard deviation and the distribution.

### Variance and standard deviation quantify spread

- **Variance:** Average squared deviation, estimated with n−1 for a sample.
- **SD:** Square root of variance in the original unit.
- **Meaning:** Larger SD means observations are more dispersed around the mean.
- **Limit:** Strong skew or outliers can make SD hard to interpret alone.

### The IQR focuses on the middle half

- **Q1:** 25% of observations lie at or below this value.
- **Q3:** 75% lie at or below this value.
- **IQR:** Q3 − Q1, resistant to tail extremes.
- **Outlier rule:** 1.5 × IQR flags values for investigation, not automatic deletion.

### A five-number summary sketches the distribution

- **Minimum:** Lowest observed value.
- **Quartiles:** Q1, median and Q3 locate the middle structure.
- **Maximum:** Highest observed value.
- **Review:** Compare with units, n and possible data-entry errors.

### Histograms depend on bin choices

- **Bins:** Intervals convert continuous values into counts.
- **Shape:** Reveal skew, modes, gaps and tails.
- **Sensitivity:** Different widths can hide or exaggerate patterns.
- **Control:** Use a defensible rule and show the underlying range.

### Box plots make group comparison compact

- **Box:** Middle 50% from Q1 to Q3.
- **Line:** Median within the box.
- **Whiskers:** Typical range under the chosen convention.
- **Points:** Potential outliers requiring context and validation.

### Grouped summaries require denominators

- **n:** Shows how much evidence supports each group statistic.
- **Missing:** State whether excluded cases differ by group.
- **Unequal groups:** Precision and visual weight differ with sample size.
- **Aggregation:** Do not compare sums where rates or means answer the question.

### Sampling links observed data to a population

- **Population:** All units the research decision concerns.
- **Sample:** Observed subset used to estimate population characteristics.
- **Parameter:** Unknown population quantity.
- **Statistic:** Sample-based estimate that varies across samples.

### Sampling distributions explain uncertainty

- **Repeated samples:** The same statistic takes different values.
- **Standard error:** Expected variability of an estimate across samples.
- **Sample size:** Larger n usually improves precision, not representativeness.
- **Bias:** Systematic selection errors remain even with more data.

### Accuracy review precedes interpretation

- **Recompute:** Check a material statistic by an independent method.
- **Reconcile:** Counts and grouped totals agree with source data.
- **Inspect:** Plots reveal impossible values or unexpected shapes.
- **Document:** Record exclusions, rounding, units and package versions.

### Summary tables should carry meaning

- **Title:** State population, measure and period.
- **Units:** Keep kg, cases, percent and counts explicit.
- **Precision:** Round only for communication; retain underlying values.
- **Footnote:** Explain missing data, denominators and method choices.

### A defensible summary separates signal from caveat

- **Pattern:** What centre, spread or group difference is observed?
- **Magnitude:** How large is it in the original unit?
- **Uncertainty:** How much evidence and variability surround it?
- **Limit:** What should the reader not conclude from the summary?

### Lab 3: Summarise Centre, Spread and Distribution

**Alignment:** LO2 · A2 · A8  
**R script:** `lab-03-descriptive-statistics.R`  
**Excel evidence:** `lab-03-descriptive-statistics.xlsx`  
**Expected output:** A descriptive-statistics table, distribution plot, outlier review and accuracy checklist.  

Compare mean, trimmed mean and median, quantify variability and inspect how outliers affect health-service waiting-time summaries.

#### Before you begin

- Keep the script, workbook and data folder together.
- Read the workbook scenario, definitions and controls before running code.
- Run the script from the lab folder and preserve source CSV files.

#### Detailed procedure

1. Read the analytical question, variable definition and units in the workbook.
   - **Action/evidence:** Open lab-03-descriptive-statistics.xlsx
2. Run the R script and inspect missingness and the distribution before calculating summaries.
   - **Action/evidence:** source('lab-03-descriptive-statistics.R', echo = TRUE)
3. Compare mean, 10% and 20% trimmed means with the median.
   - **Action/evidence:** Open outputs/lab-03-summary.csv
4. Calculate range, variance, standard deviation, IQR and selected percentiles.
   - **Action/evidence:** Review the metric definitions in the Learner Guide
5. Identify possible outliers using the 1.5 × IQR rule without deleting them automatically.
   - **Action/evidence:** Open outputs/lab-03-outliers.csv
6. Inspect the histogram and box plot and explain skew or unusual values.
   - **Action/evidence:** Open outputs/lab-03-distribution.png
7. Recalculate one statistic independently in the Excel Control sheet.
   - **Action/evidence:** Compare Excel check with R output
8. State which measure of centre is most defensible and why.
   - **Action/evidence:** Complete the Evidence sheet

#### Troubleshooting

- File not found: confirm the working folder and data filename.
- Package unavailable: use the supplied base-R fallback and read the console message.
- Unexpected categories: inspect unique values and standardise deliberately.
- Control mismatch: stop interpretation and trace the divergence.

#### Acceptance

> R and Excel checks agree, units and sample size are stated, outliers remain traceable, and the chosen centre measure matches the observed distribution.

### Lab 4: Build Grouped Tables and Basic Plots

**Alignment:** LO2 · A2 · A8  
**R script:** `lab-04-grouped-summary.R`  
**Excel evidence:** `lab-04-grouped-summary.xlsx`  
**Expected output:** Frequency/proportion tables, grouped numerical summaries, bar and box plots, and a denominator audit.  

Summarise health observations by category, preserve denominators and review the accuracy of proportions, grouped means and basic plots.

#### Before you begin

- Keep the script, workbook and data folder together.
- Read the workbook scenario, definitions and controls before running code.
- Run the script from the lab folder and preserve source CSV files.

#### Detailed procedure

1. Review categorical and numerical variable types in the workbook data dictionary.
   - **Action/evidence:** Open lab-04-grouped-summary.xlsx
2. Run the script and confirm levels, missing values and group sample sizes.
   - **Action/evidence:** source('lab-04-grouped-summary.R', echo = TRUE)
3. Create frequency and proportion tables for chest-pain category and smoking status.
   - **Action/evidence:** Open outputs/lab-04-frequency-table.csv
4. Calculate grouped means, medians and standard deviations for weight.
   - **Action/evidence:** Open outputs/lab-04-grouped-statistics.csv
5. Create a bar chart for counts and a box plot for weight by chest-pain category.
   - **Action/evidence:** Open outputs/lab-04-grouped-plots.png
6. Verify proportions sum to 1 within rounding tolerance and all groups state n.
   - **Action/evidence:** Review outputs/lab-04-control.csv
7. Compare the plot with the table and flag any interpretation not supported by both.
   - **Action/evidence:** Complete Evidence!B6
8. Save the evidence workbook with one accurate group comparison and one limitation.
   - **Action/evidence:** Complete the Evidence sheet

#### Troubleshooting

- File not found: confirm the working folder and data filename.
- Package unavailable: use the supplied base-R fallback and read the console message.
- Unexpected categories: inspect unique values and standardise deliberately.
- Control mismatch: stop interpretation and trace the divergence.

#### Acceptance

> Counts reconcile to the dataset, proportions sum to 100% within rounding, every grouped statistic includes n, and the written comparison matches both tables and plots.


## Topic 03: Quantitative Data Analysis

Correlation · regression · hypothesis testing · effect size · ANOVA · interpretation

### Quantitative analysis begins with a model of the question

- **Outcome:** The response to explain, compare or predict.
- **Predictor:** A measured factor believed to relate to the outcome.
- **Design:** Paired, independent, observational or experimental.
- **Assumptions:** Conditions required for valid estimation or testing.

### Covariance and correlation describe co-movement

- **Covariance:** Direction and joint variability in combined units.
- **Correlation:** Standardised direction and strength from −1 to +1.
- **Positive:** Variables tend to increase together.
- **Negative:** One tends to decrease as the other increases.

### Correlation strength and direction

- **Near +1:** Strong positive linear association.
- **Near 0:** Little linear association, though nonlinear structure may exist.
- **Near −1:** Strong negative linear association.
- **Caution:** Outliers and restricted ranges can dominate the coefficient.

### Pearson and rank correlation make different assumptions

- **Pearson:** Measures linear association between quantitative variables.
- **Spearman:** Measures monotonic association using ranks.
- **Choice:** Inspect form, scale and outliers before selecting.
- **Report:** Coefficient, interval, p-value, n and a scatter plot.

### Correlation is not causation

- **Confounding:** A third factor may drive both variables.
- **Reverse direction:** The assumed predictor may actually respond to the outcome.
- **Selection:** Observed units may not represent the population.
- **Evidence:** Causal claims require design, timing and alternative explanations.

### Linear regression expresses an average relationship

- **Intercept:** Expected outcome when predictors equal zero.
- **Slope:** Expected outcome change per unit of predictor.
- **Error:** Observed minus modelled outcome.
- **Fit:** Estimated line minimises squared residuals.

### Regression coefficients need units and conditions

- **Direction:** Positive or negative adjusted relationship.
- **Magnitude:** Change in outcome units per predictor unit.
- **Condition:** Other included predictors held constant.
- **Limit:** Interpret within the observed data range.

### R-squared measures explained variation

- **Range:** Usually 0 to 1 for models with an intercept.
- **Meaning:** Share of outcome variation explained in this sample.
- **Adjusted:** Penalises predictors that add little information.
- **Limit:** High fit does not prove causation or future accuracy.

### Residuals reveal model mismatch

- **Randomness:** No systematic curve or pattern across fitted values.
- **Spread:** Variability should not fan out dramatically.
- **Outliers:** Large residuals require context and sensitivity review.
- **Dependence:** Time or clusters can violate independence.

### Hypothesis testing is a pre-specified decision rule

- **H0:** Baseline model or no-effect statement.
- **H1:** Difference or direction the study is designed to detect.
- **Alpha:** Chosen false-positive risk threshold.
- **Evidence:** Test statistic and p-value under H0 assumptions.

### P-values have a narrow meaning

- **Conditional:** Calculated assuming H0 and the test assumptions.
- **Extremeness:** Probability of data at least this extreme under H0.
- **Not effect:** Does not tell how large or useful the finding is.
- **Not truth:** Is not the probability that H0 is true.

### One- and two-tailed tests answer different questions

- **Two-tailed:** Detects differences in either direction.
- **One-tailed:** Only a justified pre-specified direction counts.
- **Integrity:** Do not choose the tail after observing the result.
- **Risk:** The opposite direction may still matter operationally.

### Type I and Type II errors trade off

- **Type I:** Reject a true H0: false positive.
- **Type II:** Fail to reject a false H0: false negative.
- **Power:** Probability of detecting a meaningful true effect.
- **Design:** Sample size, variability and effect magnitude affect both.

### T-tests must match how data was collected

- **One sample:** Compare a sample mean with a benchmark.
- **Independent:** Compare two separate groups.
- **Paired:** Compare matched units or repeated measures.
- **Welch:** Allows unequal group variances and is often safer.

### Effect size complements significance

- **Mean difference:** Magnitude in the original unit.
- **Standardised:** Difference scaled by variability.
- **Interval:** Range of plausible effect values under assumptions.
- **Decision:** Compare with cost, risk and practical threshold.

### ANOVA separates within and between variation

- **Between:** Variation explained by differences among group means.
- **Within:** Variation among observations inside groups.
- **F ratio:** Between-group signal relative to within-group noise.
- **Follow-up:** Post-hoc comparisons identify which groups differ.

### Assumptions are evidence, not a checkbox

- **Independence:** Comes primarily from study design.
- **Distribution:** Inspect residuals or within-group shapes.
- **Variance:** Review group spreads; use robust alternatives when needed.
- **Sensitivity:** Check whether conclusions change under defensible choices.

### Interpretation is a structured argument

- **Estimate:** State direction and magnitude.
- **Uncertainty:** Give interval, variability and sample size.
- **Evidence:** Report test/model and p-value without overclaim.
- **Limit:** Name assumptions, design constraints and next evidence.

### Lab 5: Analyse Correlation and Regression

**Alignment:** LO3 · K1 · A3 · A7  
**R script:** `lab-05-correlation-regression.R`  
**Excel evidence:** `lab-05-correlation-regression.xlsx`  
**Expected output:** Correlation evidence, fitted regression model, diagnostic plot, prediction and limitations statement.  

Examine a quantitative relationship, fit a linear model, evaluate residuals and communicate an interpretation without causal overclaiming.

#### Before you begin

- Keep the script, workbook and data folder together.
- Read the workbook scenario, definitions and controls before running code.
- Run the script from the lab folder and preserve source CSV files.

#### Detailed procedure

1. Define the outcome, predictor, population and analytical question before running a model.
   - **Action/evidence:** Record the model design in the workbook
2. Run the script and inspect the scatter plot for direction, form and unusual observations.
   - **Action/evidence:** source('lab-05-correlation-regression.R', echo = TRUE)
3. Calculate Pearson correlation with a confidence interval and p-value.
   - **Action/evidence:** Open outputs/lab-05-correlation.csv
4. Fit the linear model and extract coefficients, R-squared and model significance.
   - **Action/evidence:** Open outputs/lab-05-model-summary.csv
5. Interpret the slope in units and distinguish association from causation.
   - **Action/evidence:** Complete Evidence!B4:B5
6. Review residual-versus-fitted and normal-Q-Q plots for visible problems.
   - **Action/evidence:** Open outputs/lab-05-model-diagnostics.png
7. Generate one within-range prediction with an interval.
   - **Action/evidence:** Open outputs/lab-05-prediction.csv
8. State one strength and two limitations of the technique.
   - **Action/evidence:** Complete the K1 reflection

#### Troubleshooting

- File not found: confirm the working folder and data filename.
- Package unavailable: use the supplied base-R fallback and read the console message.
- Unexpected categories: inspect unique values and standardise deliberately.
- Control mismatch: stop interpretation and trace the divergence.

#### Acceptance

> The model output is reproducible, coefficient and R-squared interpretations use correct units, diagnostics are reviewed, and the conclusion avoids causal claims.

### Lab 6: Test Differences and Compare Groups

**Alignment:** LO3 · K1 · A3 · A5 · A7  
**R script:** `lab-06-hypothesis-anova.R`  
**Excel evidence:** `lab-06-hypothesis-anova.xlsx`  
**Expected output:** Test-design record, t-test and ANOVA outputs, effect estimates, assumption checks and conclusion.  

Pre-specify hypotheses, run a two-sample t-test and one-way ANOVA, quantify effects and separate statistical from practical significance.

#### Before you begin

- Keep the script, workbook and data folder together.
- Read the workbook scenario, definitions and controls before running code.
- Run the script from the lab folder and preserve source CSV files.

#### Detailed procedure

1. Write the research questions, H0/H1, tail and alpha before viewing test results.
   - **Action/evidence:** Complete the Design sheet
2. Run the script and inspect group sizes, missingness, outliers and distributions.
   - **Action/evidence:** source('lab-06-hypothesis-anova.R', echo = TRUE)
3. Run Welch's two-sample t-test for weight by smoking status.
   - **Action/evidence:** Open outputs/lab-06-t-test.csv
4. Calculate the mean difference, confidence interval and standardised effect.
   - **Action/evidence:** Review outputs/lab-06-effect-size.csv
5. Run one-way ANOVA for cancer-cell count across chest-pain categories.
   - **Action/evidence:** Open outputs/lab-06-anova.csv
6. If the omnibus result is significant, review Tukey pairwise comparisons.
   - **Action/evidence:** Open outputs/lab-06-tukey.csv
7. Compare p-values with alpha and explain Type I/II risk and practical meaning.
   - **Action/evidence:** Complete the Evidence sheet
8. Record limitations and the next evidence required for a stronger conclusion.
   - **Action/evidence:** Complete Evidence!B9

#### Troubleshooting

- File not found: confirm the working folder and data filename.
- Package unavailable: use the supplied base-R fallback and read the console message.
- Unexpected categories: inspect unique values and standardise deliberately.
- Control mismatch: stop interpretation and trace the divergence.

#### Acceptance

> Test choices match the designs, hypotheses were pre-specified, effect estimates accompany p-values, and conclusions state assumptions and practical limitations.


## Topic 04: Qualitative Data Analysis

Text preparation · tokenisation · stop words · term frequency · word clouds · thematic interpretation

### Qualitative data preserves experience and context

- **Open responses:** Capture language respondents choose themselves.
- **Themes:** Recurring meanings can be coded and compared.
- **Context:** The same word can carry different meanings in different excerpts.
- **Responsibility:** Protect identity and avoid decontextualised quotation.

### A qualitative workflow remains auditable

- **Preserve:** Keep original response and stable record ID.
- **Prepare:** Create derived cleaned text without overwriting source.
- **Code:** Apply documented tokens, themes or categories.
- **Review:** Trace every claim back to representative evidence.

### Text normalisation changes the evidence

- **Case:** Lowercase merges capitalisation variants.
- **Punctuation:** Removal can change contractions, hashtags or medical codes.
- **Spelling:** Correction can merge meaning or introduce analyst judgement.
- **Audit:** Record each rule and retain the original text.

### Tokenisation defines the analytical unit

- **Word:** Simple and interpretable, but loses phrase meaning.
- **N-gram:** Preserves short phrases and negation better.
- **Sentence:** Supports context and sentiment review.
- **Theme:** Human-coded concept may be more meaningful than a token.

### Stop words reduce noise—and can remove meaning

- **General:** Common function words often add little topical information.
- **Domain:** Frequently used terms may still be important in healthcare.
- **Negation:** Removing not or no can reverse meaning.
- **Sensitivity:** Compare results before and after the list changes.

### Term frequency is a starting point

- **Count:** How often a token appears.
- **Document frequency:** How many responses contain the token.
- **Rate:** Count relative to total words or responses.
- **Limit:** Frequency alone does not establish sentiment, severity or importance.

### Term frequency changes after stop-word control

- **Raw:** High-frequency grammar terms dominate.
- **General stop list:** Topic words become more visible.
- **Domain stop list:** Prominence can change materially.
- **Evidence:** Publish the ranked table beside the visual.

### Concordance restores local context

- **Keyword:** Choose a term suggested by frequency or theory.
- **Window:** Inspect neighbouring words or full response.
- **Meaning:** Separate different uses of the same term.
- **Trace:** Retain record ID without exposing personal identity.

### A codebook turns interpretation into a process

- **Code:** Short label for a defined meaning.
- **Definition:** What is included and excluded.
- **Example:** Representative excerpt illustrating the code.
- **Decision rule:** How ambiguous cases are resolved.

### Human coding needs consistency checks

- **Calibration:** Coders discuss examples before full coding.
- **Double-code:** Independent review reveals disagreements.
- **Resolution:** Record how differences were reconciled.
- **Reflexivity:** Acknowledge how analyst perspective shapes interpretation.

### Word clouds are overview visuals, not analysis

- **Size:** Usually encodes term frequency.
- **Strength:** Rapidly surfaces prominent vocabulary.
- **Weakness:** Poor for precise comparison and hides context.
- **Companion:** Always provide a ranked table and excerpts.

### A reproducible word cloud fixes random choices

- **Seed:** Keeps the layout stable across reruns.
- **Threshold:** State minimum frequency and maximum words.
- **Palette:** Use readable, accessible colours.
- **Input:** Archive the exact ranked term table.

### Preprocessing sensitivity is an effect

- **Choice:** Stop words, stemming and token rules change counts.
- **Compare:** Measure rank and frequency shifts.
- **Interpret:** Claims robust to sensible choices are more credible.
- **Report:** Disclose choices with material impact.

### Stemming and lemmatisation trade detail for grouping

- **Stem:** Cuts words to a common root, sometimes awkwardly.
- **Lemma:** Maps variants to a dictionary form.
- **Benefit:** Combines related grammatical forms.
- **Risk:** Can merge meanings that should remain distinct.

### Qualitative significance is not only a p-value

- **Salience:** Prominence within participant accounts.
- **Coverage:** Breadth across responses or channels.
- **Contrast:** Meaningful difference between contexts.
- **Impact:** Potential consequence supported by evidence and judgement.

### Triangulation strengthens interpretation

- **Counts:** Show prevalence or distribution.
- **Excerpts:** Show meaning and context.
- **Groups:** Compare channels, time or participant categories.
- **Peer review:** Challenge selective reading and alternative explanations.

### Qualitative visuals need ethical boundaries

- **Privacy:** Remove identifiable or sensitive details.
- **Representation:** Do not let vivid quotes stand in for all respondents.
- **Proportionality:** Avoid implying population prevalence from convenience feedback.
- **Purpose:** Use only for the stated research or service-improvement need.

### A credible theme statement carries evidence and restraint

- **Theme:** Name the recurring idea precisely.
- **Support:** Provide counts, coverage and representative excerpts.
- **Variation:** Show exceptions or contrasting accounts.
- **Limit:** State sampling, coding and contextual constraints.

### Lab 7: Prepare Text and Analyse Term Frequency

**Alignment:** LO4 · K1 · A4 · A5  
**R script:** `lab-07-text-analysis.R`  
**Excel evidence:** `lab-07-text-analysis.xlsx`  
**Expected output:** Clean token table, stop-word audit, frequency table, channel comparison and interpretation notes.  

Convert feedback text into a traceable token table, remove documented stop words and compare term frequencies across service channels.

#### Before you begin

- Keep the script, workbook and data folder together.
- Read the workbook scenario, definitions and controls before running code.
- Run the script from the lab folder and preserve source CSV files.

#### Detailed procedure

1. Read the qualitative question, source context and coding limitations in the workbook.
   - **Action/evidence:** Open lab-07-text-analysis.xlsx
2. Run the script and preserve an unmodified copy of each response with its record ID.
   - **Action/evidence:** source('lab-07-text-analysis.R', echo = TRUE)
3. Normalise case and punctuation and split responses into word tokens.
   - **Action/evidence:** Inspect outputs/lab-07-tokens.csv
4. Remove blank tokens, numbers and the documented stop-word list.
   - **Action/evidence:** Open outputs/lab-07-stopword-audit.csv
5. Count terms overall and by feedback channel.
   - **Action/evidence:** Open outputs/lab-07-term-frequency.csv
6. Review high-frequency words in their original response context.
   - **Action/evidence:** Use record_id to trace tokens back to data/feedback.csv
7. Compare two channels without equating frequency with importance.
   - **Action/evidence:** Complete Evidence!B5:B7
8. Record one coding limitation and one peer-review check.
   - **Action/evidence:** Complete the Evidence sheet

#### Troubleshooting

- File not found: confirm the working folder and data filename.
- Package unavailable: use the supplied base-R fallback and read the console message.
- Unexpected categories: inspect unique values and standardise deliberately.
- Control mismatch: stop interpretation and trace the divergence.

#### Acceptance

> Every token remains traceable to a source record, exclusions are documented, frequency totals reconcile, and the interpretation uses context rather than frequency alone.

### Lab 8: Create and Critique a Word Cloud

**Alignment:** LO4 · K1 · A4 · A5 · A7  
**R script:** `lab-08-word-cloud.R`  
**Excel evidence:** `lab-08-word-cloud.xlsx`  
**Expected output:** Word-cloud image, ranked-frequency table, sensitivity comparison, excerpt evidence and limitations statement.  

Create a reproducible word cloud or frequency display, test the effect of preprocessing choices and triangulate the visual with representative excerpts.

#### Before you begin

- Keep the script, workbook and data folder together.
- Read the workbook scenario, definitions and controls before running code.
- Run the script from the lab folder and preserve source CSV files.

#### Detailed procedure

1. Review the term-frequency input and the visual question in the workbook.
   - **Action/evidence:** Open lab-08-word-cloud.xlsx
2. Run the script; it uses wordcloud when installed and a deterministic base-R layout otherwise.
   - **Action/evidence:** source('lab-08-word-cloud.R', echo = TRUE)
3. Create the ranked frequency table and retain the preprocessing settings.
   - **Action/evidence:** Open outputs/lab-08-ranked-terms.csv
4. Generate the word cloud with a fixed random seed and accessible palette.
   - **Action/evidence:** Open outputs/lab-08-word-cloud.png
5. Repeat with the domain stop-word list changed and compare the top terms.
   - **Action/evidence:** Open outputs/lab-08-sensitivity.csv
6. Trace three prominent terms back to representative source excerpts.
   - **Action/evidence:** Complete the Excerpts sheet
7. State what the cloud supports and what it cannot establish.
   - **Action/evidence:** Complete Evidence!B7:B8
8. Record an effect or salience comparison using counts/proportions, not font size alone.
   - **Action/evidence:** Complete the Evidence sheet

#### Troubleshooting

- File not found: confirm the working folder and data filename.
- Package unavailable: use the supplied base-R fallback and read the console message.
- Unexpected categories: inspect unique values and standardise deliberately.
- Control mismatch: stop interpretation and trace the divergence.

#### Acceptance

> The visual is reproducible, ranked counts are available, preprocessing sensitivity is documented, and every claim is supported by counts plus traceable excerpts.


## Topic 05: Data Visualization

Grammar of graphics · quantitative and qualitative plots · customisation · accessibility · findings

### A visualisation answers a question

- **Trend:** How does a measure change over ordered time?
- **Comparison:** Which categories are higher, lower or different?
- **Distribution:** How are values spread and where are unusual observations?
- **Relationship:** How do two quantitative variables move together?

### The grammar of graphics separates decisions

- **Data:** The analytical table and variables.
- **Aesthetics:** Mappings to x, y, colour, size, shape or group.
- **Geom:** Marks such as point, line, bar or box.
- **Layers:** Statistics, scales, coordinates, facets and annotation.

### Data and aesthetics define the visual contract

- **x/y:** Position is usually the most precise quantitative encoding.
- **Colour:** Useful for grouping but weak without redundant cues.
- **Size:** Area judgements are less precise than position or length.
- **Group:** Controls which observations connect or aggregate together.

### Geoms must match the observation and question

- **Point:** One mark per paired quantitative observation.
- **Line:** Connects ordered observations in a meaningful sequence.
- **Bar:** Compares category values using aligned lengths.
- **Box:** Summarises a quantitative distribution by group.

### Statistical transforms create derived displays

- **Count:** Bars can count records by category.
- **Bin:** Histograms group continuous values into intervals.
- **Smooth:** A fitted trend summarises relationship form.
- **Summary:** Intervals and point estimates reduce data visibly.

### Scales translate data into perception

- **Domain:** Values included in the mapping.
- **Range:** Positions, colours or sizes used on screen.
- **Breaks:** Tick marks guide interpretation.
- **Labels:** Units and formats make values legible.

### Trend visual: signal over time

- **Order:** Use a true date or other meaningful sequence.
- **Continuity:** Connect only observations that belong together.
- **Context:** Show period, unit and notable events.
- **Uncertainty:** Add intervals or caveats where estimates are noisy.

### Comparison visual: zero baseline matters

- **Bars:** Length should start at zero for honest magnitude comparison.
- **Sort:** Order categories to reveal structure.
- **Direct labels:** Reduce lookup effort where values matter.
- **Limit:** Avoid 3D effects and decorative area distortion.

### Distribution visuals reveal what averages hide

- **Histogram:** Shape across numeric intervals.
- **Box plot:** Compact group comparison of median, IQR and outliers.
- **Density:** Smoothed shape sensitive to bandwidth.
- **Raw points:** Show sample size and clusters where feasible.

### Quantitative relationship: scatter plus trend

- **Points:** Preserve individual observations.
- **Trend:** Summarise form without hiding dispersion.
- **Groups:** Colour, shape or facets expose structure.
- **Caution:** A fitted line communicates association, not causal proof.

### Qualitative plots need precise companions

- **Ranked bars:** Best for comparing term or theme frequencies.
- **Word cloud:** Useful only as an overview of prominence.
- **Heat map:** Shows frequency across groups or time.
- **Excerpts:** Restore meaning behind counts and colours.

### Facets create small multiples

- **Consistency:** Same axes and visual grammar across panels.
- **Comparison:** Group patterns become visible without overplotting.
- **Scale:** Use free scales only when comparison is not the goal.
- **Order:** Arrange panels in a meaningful sequence.

### Colour should encode, not decorate

- **Categorical:** Distinct hues for unordered groups.
- **Sequential:** Light-to-dark progression for ordered magnitude.
- **Diverging:** Two directions around a meaningful midpoint.
- **Accessibility:** Check contrast and add labels, shapes or facets.

### Annotation guides attention with evidence

- **Direct:** Label the important point or change.
- **Reference:** Add target, benchmark or event line.
- **Restraint:** Annotate the finding, not every mark.
- **Source:** Keep period, population and unit visible.

### Themes improve consistency without hiding data

- **Hierarchy:** Title, plot, annotation and source have distinct weight.
- **Typography:** Readable sizes and few font styles.
- **Grid:** Use light guides only where they help estimation.
- **Whitespace:** Separate elements and reduce cognitive load.

### Misleading visuals change the argument

- **Truncated bar axis:** Exaggerates small category differences.
- **Dual axes:** Can manufacture apparent relationships.
- **3D:** Distorts position, length and area.
- **Cherry-picking:** Selective periods or groups hide contradictory evidence.

### Visual QA is an analytical control

- **Reconcile:** Displayed values agree with the source summary.
- **Inspect:** No clipping, overlap, wrong labels or hidden categories.
- **Challenge:** Test alternative scale, grouping or period choices.
- **Accessibility:** Meaning survives greyscale and colour-vision differences.

### Interpret findings in five parts

- **Pattern:** What is visibly happening?
- **Magnitude:** How large is it and in what unit?
- **Uncertainty:** What variability or evidence limits confidence?
- **Relevance:** Why does it matter to the research decision?
- **Limit:** What conclusion is not supported?

### Lab 9: Build Layered Quantitative Visuals

**Alignment:** LO5 · K2 · A6 · A9  
**R script:** `lab-09-ggplot-visuals.R`  
**Excel evidence:** `lab-09-ggplot-visuals.xlsx`  
**Expected output:** A bar chart, faceted distribution plot and annotated scatter plot with a chart-choice rationale.  

Use the grammar of graphics to create comparison, distribution and relationship plots with truthful scales, useful labels and accessible emphasis.

#### Before you begin

- Keep the script, workbook and data folder together.
- Read the workbook scenario, definitions and controls before running code.
- Run the script from the lab folder and preserve source CSV files.

#### Detailed procedure

1. Translate each analytical question into a chart purpose and required variables.
   - **Action/evidence:** Complete the Chart Plan sheet
2. Run the script and inspect the data types and ranges before mapping aesthetics.
   - **Action/evidence:** source('lab-09-ggplot-visuals.R', echo = TRUE)
3. Create a sorted bar chart for a categorical comparison with a zero baseline.
   - **Action/evidence:** Open outputs/lab-09-comparison.png
4. Create a distribution view across meaningful groups.
   - **Action/evidence:** Open outputs/lab-09-distribution.png
5. Create a scatter plot with colour/faceting and an appropriate fitted trend.
   - **Action/evidence:** Open outputs/lab-09-relationship.png
6. Improve labels, units, theme, contrast and redundant encodings.
   - **Action/evidence:** Review the Accessibility checklist
7. Check that no scale, aspect ratio or annotation exaggerates the evidence.
   - **Action/evidence:** Complete the Truthfulness audit
8. Write one pattern, one uncertainty and one limitation for each plot.
   - **Action/evidence:** Complete the Evidence sheet

#### Troubleshooting

- File not found: confirm the working folder and data filename.
- Package unavailable: use the supplied base-R fallback and read the console message.
- Unexpected categories: inspect unique values and standardise deliberately.
- Control mismatch: stop interpretation and trace the divergence.

#### Acceptance

> All three plots answer their stated questions, remain legible without colour alone, use truthful scales and carry interpretations supported by the displayed data.

### Lab 10: Capstone: Review and Communicate Findings

**Alignment:** LO5 · K2 · A6 · A7 · A8 · A9  
**R script:** `lab-10-capstone.R`  
**Excel evidence:** `lab-10-capstone.xlsx`  
**Expected output:** An auditable analysis bundle with control log, statistical results, three decision visuals and a concise evidence-led recommendation.  

Integrate preparation, summary, modelling, text evidence and visualisation into a compact reproducible healthcare research briefing.

#### Before you begin

- Keep the script, workbook and data folder together.
- Read the workbook scenario, definitions and controls before running code.
- Run the script from the lab folder and preserve source CSV files.

#### Detailed procedure

1. Read the capstone decision question, audience and acceptance criteria.
   - **Action/evidence:** Open lab-10-capstone.xlsx
2. Run the end-to-end script and review the generated session and control logs.
   - **Action/evidence:** source('lab-10-capstone.R', echo = TRUE)
3. Verify row counts, missing values, factor levels and material totals before analysis.
   - **Action/evidence:** Open outputs/lab-10-control-log.csv
4. Review the descriptive summary, model result and qualitative frequency evidence.
   - **Action/evidence:** Open outputs/lab-10-analysis-summary.csv
5. Inspect the three decision visuals and confirm labels, units, scales and source period.
   - **Action/evidence:** Open outputs/lab-10-briefing.png
6. Challenge the first interpretation using an alternative grouping or sensitivity check.
   - **Action/evidence:** Open outputs/lab-10-sensitivity.csv
7. Write the evidence statement: pattern, magnitude, uncertainty, relevance and limitation.
   - **Action/evidence:** Complete Evidence!B4:B8
8. Run the peer-review checklist and record release owner, version and date.
   - **Action/evidence:** Complete Release Checklist and save the workbook

#### Troubleshooting

- File not found: confirm the working folder and data filename.
- Package unavailable: use the supplied base-R fallback and read the console message.
- Unexpected categories: inspect unique values and standardise deliberately.
- Control mismatch: stop interpretation and trace the divergence.

#### Acceptance

> The bundle reruns from source data, all controls pass or are explained, visuals agree with statistical outputs, and the recommendation distinguishes evidence from judgement.


## Assessment Flow

1. Complete TRAQOM / SSG digital attendance.
2. Complete assessment digital attendance.
3. Sit the 30-minute Written Assessment followed by the 90-minute Practical Performance assessment.
4. Upload the completed papers, R code and requested evidence to the LMS.
5. Sign the Assessment Summary Record.

## Support

- Email: enquiry@tertiaryinfotech.com
- Telephone: +65 6100 0613
- Website: https://www.tertiarycourses.com.sg/
