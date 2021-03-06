-- Table definitions for the tournament project.
-- create database tournament
   Drop DATABASE tournament;
   CREATE DATABASE tournament;

-- connect DATABASE
   \c tournament

-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--Create table players
   CREATE TABLE players (id SERIAL PRIMARY KEY,
                         name TEXT);

-- Create table matches
   CREATE TABLE matches (match_id SERIAL PRIMARY KEY,
                         winner INTEGER references players (id),
                         loser INTEGER references players (id));


-- Create view for standings for number of wins  id,name,count of wins,count of matches
  CREATE VIEW standings AS
  SELECT players.id,players.name,
  (SELECT count(matches.winner)
      FROM matches
      WHERE players.id = matches.winner)
      AS total_wins,
  (SELECT count(matches.match_id)
      FROM matches
      WHERE players.id = matches.winner
      OR players.id = matches.loser)
      AS total_matches
  FROM players
  ORDER BY total_wins DESC, total_matches DESC;
