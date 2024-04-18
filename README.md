# Do music charts still matter in the streaming age? An analysis predicting Beyoncé’s Spotify numbers using a regression model.

## Paper Overview

Music charts are a powerful marketing tool. This paper analyzes the number of Spotify streams of a Beyoncé song based on the number of weeks it spent on the *Billboard Hot 100* utilizing data collected from Spotify and Billboard. In our negative binomial regression model, we find that the number of Spotify streams of a Beyoncé song increases as its duration on the *Billboard Hot 100* increases. Our discovery highlights the relevance of charts in shaping today’s music business industry.


## File Structure

The repo is structured as:

-   `data/analysis_data` contains the cleaned dataset that was constructed.
-   `data/raw_data` contains the raw data that was collected from Spotify and Billboard.
-   `model` contains three fitted regression models: negative binomial with default priors, negative binomial with re-specified priors, and poisson with re-specified priors. 
-   `other` contains the datasheet and sketches.
-   `paper` contains the files used to generate the paper, including the Quarto document and reference bibliography file, as well as the PDF of the paper. 
-   `scripts` contains the R scripts used to simulate, clean, test, and model the data.


## Statement on LLM usage

No LLMs were used for any aspect of this work.
