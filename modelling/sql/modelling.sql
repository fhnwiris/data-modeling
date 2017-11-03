CREATE TABLE Projekt (
  ID               INTEGER NOT NULL PRIMARY KEY, 
  Projektname      varchar(255) NOT NULL, 
  ProjektleitungID integer(10) NOT NULL, 
  FOREIGN KEY(ProjektleitungID) REFERENCES Mitarbeitende(ID));
CREATE TABLE Abteilung (
  ID             INTEGER NOT NULL PRIMARY KEY, 
  Abteilungsname varchar(255) NOT NULL, 
  KostenstelleID integer(10) NOT NULL, 
  FOREIGN KEY(KostenstelleID) REFERENCES Kostenstelle(ID));
CREATE TABLE Mitarbeitende (
  ID          INTEGER NOT NULL PRIMARY KEY, 
  Vorname     varchar(255) NOT NULL, 
  Nachname    varchar(255) NOT NULL, 
  AbteilungID integer(10) NOT NULL, 
  FOREIGN KEY(AbteilungID) REFERENCES Abteilung(ID));
CREATE TABLE Projektteam (
  MitarbeitendeID integer(10) NOT NULL, 
  ProjektID       integer(10) NOT NULL, 
  PRIMARY KEY (MitarbeitendeID, 
  ProjektID), 
  FOREIGN KEY(MitarbeitendeID) REFERENCES Mitarbeitende(ID), 
  FOREIGN KEY(ProjektID) REFERENCES Projekt(ID));
CREATE TABLE Kostenstelle (
  ID          INTEGER NOT NULL PRIMARY KEY, 
  Bezeichnung varchar(255) NOT NULL);
CREATE TABLE Glas (
  ID          INTEGER NOT NULL PRIMARY KEY, 
  Bezeichnung varchar(255) NOT NULL, 
  Zusatzinfos varchar(255) NOT NULL);
CREATE TABLE Getraenk (
  ID          INTEGER NOT NULL PRIMARY KEY, 
  Bezeichnung varchar(255) NOT NULL, 
  Glas        varchar(255) NOT NULL, 
  GlasID      integer(10) NOT NULL, 
  FOREIGN KEY(GlasID) REFERENCES Glas(ID));
CREATE TABLE Getraenkebestandteil (
  GetraenkID integer(10) NOT NULL, 
  ZutatID    integer(10) NOT NULL, 
  PRIMARY KEY (GetraenkID, 
  ZutatID), 
  FOREIGN KEY(GetraenkID) REFERENCES Getraenk(ID), 
  FOREIGN KEY(ZutatID) REFERENCES Zutat(ID));
CREATE TABLE Zutat (
  ID           INTEGER NOT NULL PRIMARY KEY, 
  Bezeichnung  varchar(255) NOT NULL, 
  ZutatenartID integer(10) NOT NULL, 
  LieferantID  integer(10) NOT NULL, 
  FOREIGN KEY(LieferantID) REFERENCES Lieferant(ID), 
  FOREIGN KEY(ZutatenartID) REFERENCES Zutatenart(ID));
CREATE TABLE Lieferant (
  ID                  INTEGER NOT NULL PRIMARY KEY, 
  Name                varchar(255) NOT NULL, 
  Adresse             varchar(255) NOT NULL, 
  Zahlungsbedingungen varchar(255) NOT NULL);
CREATE TABLE Zutatenart (
  ID                INTEGER NOT NULL PRIMARY KEY, 
  Bezeichnung       varchar(255) NOT NULL, 
  Konsumationsfrist varchar(255) NOT NULL);
CREATE TABLE Agent (
  ID       INTEGER NOT NULL PRIMARY KEY, 
  Name     varchar(255) NOT NULL, 
  Email    varchar(255) NOT NULL, 
  Password varchar(255) NOT NULL);
CREATE TABLE Customer (
  ID      INTEGER NOT NULL PRIMARY KEY, 
  Name    varchar(255) NOT NULL, 
  Email   varchar(255) NOT NULL, 
  Mobile  varchar(255) NOT NULL, 
  AgentID integer(10) NOT NULL, 
  FOREIGN KEY(AgentID) REFERENCES Agent(ID));
