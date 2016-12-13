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
   CREATE TABLE matches (id SERIAL PRIMARY KEY,
                         winner INTEGER references players (id),
                         loser INTEGER references players (id));




--
