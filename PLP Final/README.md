**Using R to Discriminate FT-IR spectroscopy results from samples of Gin, Rum, and Whiskey**

**Introduction** :

Alcohol is a day-to-day, friendly, and common beverage that plays an important role in the lives of people all around the world. Along with that, the issue of fake alcohols has also been emerging in recent years, pushing forward more precise ways to qualify the alcohols. In my project, I will propose a combination of FTIR approach and computational calculation to identify/ construct models that can help classify the alcohols. The R project is the language that is chosen to analyze the data observed from the FTIR spectrum scan.

The code will extract the spectrum as a matrix of intensity and wavenumbers. After that, the data set will be shortened through two main ways : using Standard Derivatives and using Random Forest – since the feature size is huge and that it will falsify the distance formula if we take in all features. The reduced matrix will be used to compute in the Mahalanobis Distance and extract a distance representation of each datapoint away from its types.

**To run the code:** First, save the datasets to your computer (they contain no harm so do not worry!). The folder will contain two R codes – one to graph the spectrum and the other to calculate distances.

- Run the SpectrumGraph.R file and fill in the paths to the folders containing one set of data type. The code will also ask for the name of the data that you would want to label it.
- Run the Distance.R file and fill in the paths to the folders containing one set of data type. The code will also ask for the name of the data that you would want to label it. Besides, turn of the first plot to also receive the plot for Random Forest Distribution.
