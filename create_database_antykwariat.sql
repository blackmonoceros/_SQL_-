create database antykwariat
CREATE TABLE Gatunki (Id_gatunku INT PRIMARY KEY,
Nazwa_gatunku VARCHAR(100) NOT NULL)
  
CREATE TABLE Autorzy (Id_autora INT PRIMARY KEY, Nazwisko VARCHAR(100) NOT NULL,
Imię1 VARCHAR(100) NULL,
Imię2 VARCHAR(100) NULL,
Data_urodzenia DATE NULL)
  
CREATE TABLE Książki (Id_książki INT PRIMARY KEY,
Tytuł VARCHAR(100) NOT NULL,
Id_autora INT NOT NULL REFERENCES Autorzy(Id_autora), -- zakładamy, że każda książka
-- ma tylko jednego autora
Język_oryginału VARCHAR(100) NULL,
Rok_pierwszego_wydania INT NOT NULL,
Uwagi VARCHAR(250) NOT NULL)
  
CREATE TABLE Książki_Gatunki ( -- jedna książka może być przypisana do wielu gatunków
Id_gatunku INT REFERENCES Gatunki(Id_gatunku),
Id_książki INT REFERENCES Książki(Id_książki),
  
PRIMARY KEY(Id_gatunku, Id_książki))
  
CREATE TABLE Egzemplarze (Id_egzemplarza INT PRIMARY KEY, -- egzemplarze książek
Id_książki INT NOT NULL REFERENCES Książki(Id_książki),
Stan_egzemplarza INT NOT NULL, -- Tu wpisuje się liczby od 1 do 5,
-- 1 oznacza egzemplarzę bardzo zniszczony
-- 5 oznacza egzemplarz w idealnym stanie
Cena MONEY NULL,
Język VARCHAR(100) NOT NULL,
Wydawnictwo VARCHAR(100) NOT NULL,
Rok_wydania INT NULL,
Uwagi VARCHAR(250) NOT NULL)

INSERT INTO Gatunki (Id_gatunku, Nazwa_gatunku) VALUES
(1, 'Powieść'),
(2, 'Poezja'),
(3, 'Szkic literacki'),
(4, 'Dramat'),
(5, 'Literatura faktu'),
(6, 'Fantastyka'),
(7, 'Biografia'),
(8, 'Kryminał'),
(9, 'Historia'),
(10, 'Przygodowa');

INSERT INTO Autorzy (Id_autora, Nazwisko, Imię1, Imię2, Data_urodzenia) VALUES
(1, 'Kowalski', 'Jan', NULL, '1980-05-15'),
(2, 'Nowak', 'Anna', 'Maria', '1975-10-22'),
(3, 'Wójcik', 'Piotr', 'Tomasz', '1990-02-08'),
(4, 'Dąbrowska', 'Małgorzata', 'Irena', '1985-09-30'),
(5, 'Mazur', 'Adam', NULL, '1972-07-12'),
(6, 'Lewandowska', 'Magdalena', 'Barbara', '1995-03-18'),
(7, 'Kaczmarek', 'Andrzej', NULL, '1988-12-04'),
(8, 'Pawlak', 'Karolina', 'Joanna', '1983-06-27'),
(9, 'Michalski', 'Marek', 'Robert', '1978-11-10'),
(10, 'Szymańska', 'Ewa', 'Elżbieta', '1992-04-25');

INSERT INTO Książki (Id_książki, Tytuł, Id_autora, Język_oryginału, Rok_pierwszego_wydania,
Uwagi) VALUES
(1, 'Pan Tadeusz', 1, 'Polski', 1834, 'Klasyczna polska epopeja'),
(2, 'Sto lat samotności', 5, 'Hiszpański', 1967, 'Realizm magiczny'),
(3, 'Zbuntowana', 8, 'Polski', 2010, 'Nowoczesna powieść obyczajowa'),
(4, 'Harry Potter i Kamień Filozoficzny', 6, 'Angielski', 1997, 'Fantasy dla młodzieży'),
(5, 'Złodziejka książek', 4, 'Niemiecki', 2005, 'Historia o wojnie i ludzkiej solidarności'),
(6, 'Zabić drozda', 3, 'Angielski', 1960, 'Klasyczna amerykańska powieść'),
(7, 'Solaris', 2, 'Polski', 1961, 'Science fiction'),
(8, 'Dzieci z Bullerbyn', 7, 'Szwedzki', 1947, 'Książka dla dzieci'),
(9, 'Opowieści z Narnii', 10, 'Angielski', 1950, 'Fantasy dla dzieci'),
(10, 'Panienka z okienka', 9, 'Polski', 1988, 'Przygodowa powieść młodzieżowa');

INSERT INTO Książki_Gatunki (Id_gatunku, Id_książki) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

INSERT INTO Egzemplarze (Id_egzemplarza, Id_książki, Stan_egzemplarza, Cena, Język,
Wydawnictwo, Rok_wydania, Uwagi) VALUES
(1, 1, 4, 29.99, 'Polski', 'Wydawnictwo A', 2010, 'Egzemplarz używany'),
(2, 2, 5, 39.99, 'Hiszpański', 'Wydawnictwo B', 2015, 'Nowy egzemplarz'),
(3, 3, 3, 24.99, 'Polski', 'Wydawnictwo C', 2012, 'Egzemplarz w dobrym stanie'),
(4, 4, 2, 19.99, 'Angielski', 'Wydawnictwo D', 2000, 'Egzemplarz lekko zniszczony'),
(5, 5, 1, 49.99, 'Niemiecki', 'Wydawnictwo E', 2007, 'Egzemplarz w idealnym stanie'),
(6, 6, 5, 29.99, 'Angielski', 'Wydawnictwo F', 2018, 'Nowy egzemplarz'),
(7, 7, 4, 34.99, 'Polski', 'Wydawnictwo G', 2015, 'Egzemplarz używany'),
(8, 8, 3, 14.99, 'Szwedzki', 'Wydawnictwo H', 1995, 'Egzemplarz w dobrym stanie'),
(9, 9, 2, 44.99, 'Angielski', 'Wydawnictwo I', 2003, 'Egzemplarz lekko zniszczony'),
(10, 10, 1, 19.99, 'Polski', 'Wydawnictwo J', 1990, 'Egzemplarz w idealnym stanie');
