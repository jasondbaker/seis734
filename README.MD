# steps to create million-song datasets 

## preprocessing
Involves downloading the 137M rows of data and moving into hadoop to be process in hive.  Code in preprocessing_data.hql.

## preprocessing test data
Involves moving the 1k random test users into hadoop to be process in hive.  Then splits the 1k users song in half.  Code in preprocessing_data_testing.hql.

## creating models
Using NB and CF algorithms to create full datasets.  Also importing AR datasets from SAP HANA.  Output tables created for each.  Code in create_models_output.hql.

## creating test ouput
Follows similar steps as "creating models" above, but separating out testing users.  Final step was using the test users while splitting results and returns a boolean value whether the user actually listened to the song.  Code in create_testing_output.hql.  
