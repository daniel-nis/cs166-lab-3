--DROP TABLE IF EXISTS Project;
--DROP TABLE IF EXISTS Work_Proj;
--DROP TABLE IF EXISTS Graduate;
--DROP TABLE IF EXISTS Professor;
--DROP TABLE IF EXISTS Work_Dept;
--DROP TABLE IF EXISTS Dept;
--DROP TABLE IF EXISTS Work_In;
DROP TABLE if EXISTS Professor CASCADE;
DROP TABLE if EXISTS Dept CASCADE;
DROP TABLE if EXISTS Project CASCADE;
DROP TABLE if EXISTS Graduate CASCADE;
DROP TABLE if EXISTS Work_Dept CASCADE;
DROP TABLE if EXISTS Work_In CASCADE;
DROP TABLE if EXISTS Work_Proj CASCADE;

CREATE TABLE Professor (ssn INTEGER NOT NULL,
                        name CHAR(30),
                        age CHAR(30),
                        rank CHAR(30),
                        specialty INTEGER,
                        PRIMARY KEY(ssn));

CREATE TABLE Dept (dno INTEGER NOT NULL,
                        dname CHAR(30),
                        office CHAR(30),
                        runs INTEGER,
                        PRIMARY KEY(dno),
                        FOREIGN KEY(runs) REFERENCES Professor(ssn));

CREATE TABLE Project (pno INTEGER NOT NULL,
			sponsor CHAR(30),
		 	start_date CHAR(30),
			end_date CHAR(30),
			budget INTEGER,
			manage INTEGER,
			PRIMARY KEY(pno),
			FOREIGN KEY(manage) REFERENCES Professor(ssn));

CREATE TABLE Graduate (ssn INTEGER NOT NULL,
                        name CHAR(30),
                        age INTEGER,
                        deg_pg CHAR(30),
			advise INTEGER,
			major INTEGER,
                        PRIMARY KEY(ssn),
			FOREIGN KEY(advise) REFERENCES Graduate(ssn),
			FOREIGN KEY(major) REFERENCES Dept(dno));

/*CREATE TABLE Professor (ssn INTEGER NOT NULL,
                        name CHAR(30),
                        age CHAR(30),
                        rank CHAR(30),
                        specialty INTEGER,
                        PRIMARY KEY(ssn));*/

/*CREATE TABLE Dept (dno INTEGER NOT NULL,
                        dname CHAR(30),
                        office CHAR(30),
			runs INTEGER,
                        PRIMARY KEY(dno),
			FOREIGN KEY(runs) REFERENCES Professor(ssn));*/

CREATE TABLE Work_Proj (since CHAR(30),
                        pno INTEGER NOT NULL,
                        ssn INTEGER NOT NULL,
			supervise INTEGER NOT NULL,
                        PRIMARY KEY(pno, ssn),
			FOREIGN KEY(ssn) REFERENCES Graduate(ssn),
			FOREIGN KEY(pno) REFERENCES Project(pno),
			FOREIGN KEY(supervise) REFERENCES Professor(ssn));

CREATE TABLE Work_In (pno INTEGER NOT NULL,
                        ssn INTEGER NOT NULL,
                        PRIMARY KEY(pno, ssn),
			FOREIGN KEY(pno) REFERENCES Project(pno),
			FOREIGN KEY(ssn) REFERENCES Professor(ssn));

CREATE TABLE Work_Dept (time_pc INTEGER NOT NULL,
                        dno INTEGER NOT NULL,
                        ssn INTEGER NOT NULL,
                        supervise INTEGER NOT NULL,
                        PRIMARY KEY(dno, ssn),
                        FOREIGN KEY(ssn) REFERENCES Professor(ssn),
                        FOREIGN KEY(dno) REFERENCES Dept(dno));

