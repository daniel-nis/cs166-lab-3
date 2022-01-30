DROP TABLE IF EXISTS Place CASCADE;
DROP TABLE IF EXISTS Telephone CASCADE;
DROP TABLE IF EXISTS Musician CASCADE;
DROP TABLE IF EXISTS Lives CASCADE;
DROP TABLE IF EXISTS Instrument CASCADE;
DROP TABLE IF EXISTS Plays CASCADE;
DROP TABLE IF EXISTS Album CASCADE;
DROP TABLE IF EXISTS Song CASCADE;
DROP TABLE IF EXISTS Perform CASCADE;

CREATE TABLE Place (address CHAR(30) NOT NULL,
        		PRIMARY KEY(address));

CREATE TABLE Telephone (phone_no INTEGER,
        		address CHAR(30),
        		FOREIGN KEY(address) REFERENCES Place(address));

CREATE TABLE Musician (ssn INTEGER NOT NULL,
			name CHAR(30) NOT NULL,
			address CHAR(30) NOT NULL,
			PRIMARY KEY(ssn),
			FOREIGN KEY(address) REFERENCES Place(address));

CREATE TABLE Lives (ssn INTEGER NOT NULL,
			address CHAR(30) NOT NULL,
			PRIMARY KEY(ssn, address),
			FOREIGN KEY(ssn) REFERENCES Musician(ssn),
			FOREIGN KEY(address) REFERENCES Place(address));

CREATE TABLE Instrument (instrid INTEGER NOT NULL,
			dname CHAR(30),
			key CHAR(30),
			PRIMARY KEY(instrid));

CREATE TABLE Plays (instrid INTEGER,
			ssn INTEGER,
        		PRIMARY KEY(ssn, instrid),
        		FOREIGN KEY(ssn) REFERENCES Musician(ssn),
        		FOREIGN KEY(instrid) REFERENCES Instrument(instrid));

CREATE TABLE Album (albumidentifier INTEGER NOT NULL,
			copyrightDate DATE,
			speed INTEGER,
			title CHAR(30),
			producer INTEGER NOT NULL,
			ssn CHAR(11),
			PRIMARY KEY(albumidentifier), 
 			FOREIGN KEY(producer) REFERENCES Musician(ssn));

CREATE TABLE Song (songid INTEGER NOT NULL,
			author CHAR(30) NOT NULL,
			title CHAR(30) NOT NULL,
			albumidentifier INTEGER,
			appears INTEGER,
			PRIMARY KEY(songid),
			FOREIGN KEY(appears) REFERENCES Album(albumidentifier));

CREATE TABLE Perform (songid INTEGER NOT NULL,
			ssn INTEGER NOT NULL,
			PRIMARY KEY(songid, ssn),
			FOREIGN KEY(ssn) REFERENCES Musician(ssn),
			FOREIGN KEY(songid) REFERENCES Song(songid));
