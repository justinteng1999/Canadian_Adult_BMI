# Canadian_Adult_BMI

This repo contains an R project file for "Males and People Between 45-54 Years Old are More Likely Suffering from Obesity".

It contains 3 folders: inputs, outputs, scripts. And they are organised as follows...

Inputs: 

- Source data from the Statistics Canada. Which can also be found here:
https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=1310079401
- Reference Literature 

Outputs: 

- The paper folder contains the R Markdown file to generate the paper, a pdf version of the paper, and a complete bibliography. To access the paper PDF, go here: 
https://github.com/justinteng1999/Canadian_Adult_BMI/blob/master/outputs/paper/paper.pdf

- BMI_cleaned.csv is the CSV file cleaned and produced from the original dataset of BMI_raw_data.csv


Scripts:

- 01-data_cleaning

## How to generate this paper

1. Open Canadian_Adult_BMI.Rproj in RStudio
2. Open outputs/paper/Canadian_Adults_BMI.Rmd
3. Install the necessary packages using install.package()
4. Run all code chunk from the top to bottom 
5. Generate the paper using knit 
