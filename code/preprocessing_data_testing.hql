## step 1: move 1k test users to hadoop
scp -i ~/Desktop/Rec_Team/keys/jjanzen ~/UST_GPS/SEIS_734/project/testdata.csv a149174-a@pdl01bdput251:/home/a149174-a/
make a dir to put the file in:  hadoop fs -mkdir /teamspace/bdpexpp01/test_nb_model/
hadoop fs -copyFromLocal /home/a149174-a/testdata.csv  /teamspace/bdpexpp01/test_nb_model

## step 2: create table with 1k test users in hive
CREATE EXTERNAL TABLE IF NOT EXISTS expp_team.million_test ( 
user string, 
song string,
play_count int) 
ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' 
LOCATION '/teamspace/bdpexpp01/test_nb_model/';

## step 3: splits test users song in 1st half (predictor)
CREATE TABLE IF NOT EXISTS expp_team.million_test_first_half AS 
select a.user, c.count_songs, a.song, a.play_count, b.rank from expp_team.million_test a
join (
SELECT user, song,
ROW_NUMBER() OVER(PARTITION BY user order by user) as rank
FROM expp_team.million_test ) b 
on a.user = b.user
and a.song = b.song
JOIN (
SELECT user, count(distinct song) as count_songs
FROM expp_team.million_test
GROUP BY user) c 
on a.user = c.user
WHERE b.rank <= (c.count_songs*0.5); 

where user ='124ba030ef61af9eeea0489f9287438b4e27ce25'

## step 4: splits test users song for 2nd half (predicted)
CREATE TABLE IF NOT EXISTS expp_team.million_test_second_half AS 
select a.user, c.count_songs, a.song, a.play_count, b.rank from expp_team.million_test a
join (
SELECT user, song,
ROW_NUMBER() OVER(PARTITION BY user order by user) as rank
FROM expp_team.million_test ) b 
on a.user = b.user
and a.song = b.song
JOIN (
SELECT user, count(distinct song) as count_songs
FROM expp_team.million_test
GROUP BY user) c 
on a.user = c.user
WHERE b.rank > (c.count_songs*0.5); 
