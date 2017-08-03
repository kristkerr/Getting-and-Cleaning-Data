# Getting-and-Cleaning-Data 

## Introduction
This repository contains all the scripts for the project in the Coursera course: Getting and Cleaning Data. 


## Purpose
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


## The Data

  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
  
The data used in the project can be found in the link above. For a more thorough explanation of the original experiment, open the README.md file included in the link above.


## Scripts
* runAnalysis.r \- the R code that produces the tidy\_data.txt file from the data provided above. 
* tidy\_data.txt \- the data set created from the R code that pulls the mean of each activity and subject based on the variable provided. 
* Codebook.md \- the codebook for runAnalysis.r


## Install Packages
plyr package - https://cran.r-project.org/web/packages/plyr/plyr.pdf


## Set Working Directory
The runAnalysis.r script assumes that the data pulled from the data link has been unzipped and the working directory has been set to the UCI Har Dataset folder. 
