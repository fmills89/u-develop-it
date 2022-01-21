drop table if exists votes;
DROP TABLE IF EXISTS candidates;
DROP TABLE IF EXISTS parties;
drop table if exists voters;

CREATE TABLE parties (
  id INTEGER AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  description TEXT
);

CREATE TABLE candidates (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    party_id integer,
    industry_connected BOOLEAN NOT NULL,
    CONSTRAINT fk_party FOREIGN KEY (party_id) REFERENCES parties(id) ON DELETE SET NULL
);

create table voters (
  id integer AUTO_INCREMENT PRIMARY KEY,
  first_name varchar(30) not null,
  last_name varchar(30) not null,
  email varchar(50) not null,
  created_at datetime default current_timestamp
);

create table votes (
  id integer AUTO_INCREMENT PRIMARY KEY,
  voter_id integer not null,
  candidate_id integer not null,
  created_at datetime default current_timestamp,
  CONSTRAINT uc_voter unique (voter_id),
  CONSTRAINT fk_voter FOREIGN KEY (voter_id) REFERENCES voters(id) on delete cascade,
  CONSTRAINT fk_candidate FOREIGN KEY (candidate_id) REFERENCES candidates(id) on delete cascade
);

