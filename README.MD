#Project Handbook: 
*An Analytical Survey of Song Recommendation Methods*

# Team Members

Jason Baker, 
Josh Janzen,
Nomvelo Moyo,
Timothy Stevens,
Usman Waheed

# Installing the datasets

##Download Sites:

Million Song Dataset metadata in TSV format (189MB).
1 million rows of song metadata (songId, title, artist name, release date, etc)[https://ust-datamining.s3.amazonaws.com/songs.tsv](https://ust-datamining.s3.amazonaws.com/songs.tsv)

Taste Profile Subset in TSV format (512MB).
48 million rows of song listener transactions (userId, songId, play count)[https://ust-datamining.s3.amazonaws.com/train_triplets.txt.zip](https://ust-datamining.s3.amazonaws.com/train_triplets.txt.zip)
## Preprocessing

No preprocessing is necessary to install the datasets on HANA. Use the standard HANA import functions to import the data in TSV format.

Example Song Dataset import file for HANA: [https://ust-datamining.s3.amazonaws.com/song.ctl](https://ust-datamining.s3.amazonaws.com/song.ctl)

Example Taste Profile Subset import file for HANA: [https://ust-datamining.s3.amazonaws.com/taste.ctl
](https://ust-datamining.s3.amazonaws.com/taste.ctl)

Data must be imported and pre-processed in Hadoop using Hive. The pre-processing code is located in /code/preprocessing_data.hql.

# Creating models

The HANA sql code to create the Association Rules model is located in /code/association-rules.sql

A downloadable version of the AR model generated from our training set is available at:
HANA Association Rules dataset (46MB)[https://ust-datamining.s3.amazonaws.com/ar_rules_0504.zip](https://ust-datamining.s3.amazonaws.com/ar_rules_0504.zip)
The HQL code to generate the Naive Bayes and Collaborative Filtering models is located in /code/create_models_output.hql

# Testing Process

##Generating test data

The first step in our testing process was to generate a set of training data and testing data.

The training set for our project (1.2GB) is located at: [https://ust-datamining.s3.amazonaws.com/trainingset.zip](https://ust-datamining.s3.amazonaws.com/trainingset.zip)

The testing set for our project (1MB) is located at: [https://ust-datamining.s3.amazonaws.com/testset.zip](https://ust-datamining.s3.amazonaws.com/testset.zip)

## Preprocessing test data in Hadoop
Involves moving 1k random test users into Hadoop to be processed in Hive.  Then splits the 1k users song in half.  Code is located in: /code/preprocessing_data_testing.hql.

## Creating test output
Follows similar steps as "creating models" above, but separating out testing users.  Final step was using the test users while splitting results and returning a boolean value whether the user actually listened to the song.  Code located in /code/create_testing_output.hql

## Downloading test output

Naïve Bayes Prediction Data for Testing dataset (12MB)[https://ust-datamining.s3.amazonaws.com/nb_test_out_05_08.xlsx](https://ust-datamining.s3.amazonaws.com/nb_test_out_05_08.xlsx)Collaborative Filtering Prediction Data for Testing dataset (8MB)[https://ust-datamining.s3.amazonaws.com/cf_test_output_05_08.xlsx](https://ust-datamining.s3.amazonaws.com/cf_test_output_05_08.xlsx)Association Rule Prediction Data for Testing dataset (6MB)[https://ust-datamining.s3.amazonaws.com/ar_test_out_05_08.xlsx](https://ust-datamining.s3.amazonaws.com/ar_test_out_05_08.xlsx)
