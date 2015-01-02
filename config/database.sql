PRAGMA foreign_keys=1;
DROP TABLE Member;
DROP TABLE Classes;
DROP TABLE ClassMember;
DROP TABLE Exercises;
DROP TABLE ExerciseSet;
DROP TABLE ClassExerciseSet;
DROP TABLE MemberInventory;
DROP TABLE Itens;
DROP TABLE MemberEvents;
DROP TABLE MemberAnswers;

CREATE TABLE Members(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  username VARCHAR UNIQUE,
  password VARCHAR,
  first_name VARCHAR,
  last_name VARCHAR,
  birth_date DATE,
  gender VARCHAR,
  email VARCHAR,
  usertype VARCHAR,
  points INTEGER DEFAULT 100
);

CREATE TABLE Classes(
id INTEGER PRIMARY KEY AUTOINCREMENT,
name VARCHAR
);

CREATE TABLE ClassMember(
memberId INTEGER REFERENCES Members(id),
classId INTEGER REFERENCES Classes(id),
score INTEGER CHECK(score>-1),
UNIQUE (memberId, classId)
);

CREATE TABLE Exercises(
id INTEGER PRIMARY KEY AUTOINCREMENT,
points INTEGER default 50,
name VARCHAR
);

CREATE TABLE ExerciseOptions(
id INTEGER PRIMARY KEY AUTOINCREMENT,
exerciseId INTEGER REFERENCES Exercises(id),
description VARCHAR
);

CREATE TABLE ExerciseRightAnswer(
exerciseId INTEGER REFERENCES Exercises(id),
optionId INTEGER REFERENCES ExerciseOptions(id)
);

CREATE TABLE Sets(
id INTEGER PRIMARY KEY AUTOINCREMENT,
name VARCHAR DEFAULT 'Untitled', 
-- CHANGE DEFAULT
teacher_id INTEGER REFERENCES Members(id),
itenID INTEGER REFERENCES Itens(id)
);

CREATE TABLE ExerciseSet(
setId INTEGER REFERENCES Sets(id),
exerciseId INTEGER REFERENCES Exercises(id)
);

CREATE TABLE ClassExerciseSet(
setId INTEGER REFERENCES Sets(id),
classId INTEGER REFERENCES Classes(id)
);

CREATE TABLE Itens(
id INTEGER PRIMARY KEY AUTOINCREMENT,
part INTEGER,
name VARCHAR,
img_location VARCHAR,
description VARCHAR,
price INTEGER
);

CREATE TABLE MemberInventory(
memberId INTEGER REFERENCES Members(id),
itenId INTEGER REFERENCES Itens(id)
);

CREATE TABLE MemberEvents(
memberId INTEGER REFERENCES Members(id),
classId INTEGER REFERENCES Classes(id),
description VARCHAR
);

CREATE TABLE AvatarUser(
  memberId INTEGER REFERENCES Members(id),
  part0 INTEGER REFERENCES Itens(id),
  part1 INTEGER REFERENCES Itens(id),
  part2 INTEGER REFERENCES Itens(id)
);

CREATE TABLE MemberAnswers(/*ACRESCENTAR AO TRIGGER*/
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  memberId INTEGER REFERENCES Members(id),
  classId INTEGER REFERENCES Classes(id),
  setId INTEGER REFERENCES Sets(id),
  points INTEGER,
  UNIQUE (memberId, classId, setId)
);

CREATE TABLE MemberAnswersOptions(/*ACRESCENTAR AO TRIGGER*/
  maId INTEGER REFERENCES MemberAnswers(id),
  exerciseId INTEGER REFERENCES Exercises(id),
  optionId INTEGER REFERENCES ExerciseOptions(id)
);


CREATE TRIGGER on_class_delete BEFORE DELETE ON Classes BEGIN
  DELETE FROM ClassMember WHERE classId = old.id;
  DELETE FROM ClassExerciseSet WHERE classId = old.id;
  DELETE FROM MemberEvents WHERE classId = old.id;
  DELETE FROM MemberAnswers WHERE classId = old.id;
END;

CREATE TRIGGER on_member_delete BEFORE DELETE ON Members BEGIN
  DELETE FROM ClassMember WHERE memberId = old.id;
  DELETE FROM MemberInventory WHERE memberId = old.id;
  DELETE FROM MemberEvents WHERE memberId = old.id;
END;

CREATE TRIGGER on_itens_delete BEFORE DELETE ON Itens BEGIN
  UPDATE Sets SET itenId = null WHERE itenID = old.id;
  DELETE FROM MemberInventory WHERE itenId = old.id;
END;

CREATE TRIGGER on_set_delete BEFORE DELETE ON Sets BEGIN
  DELETE FROM ClassExerciseSet WHERE setID = old.id;
	DELETE FROM ExerciseSet WHERE setID = old.id;
END;

CREATE TRIGGER on_exercise_delete BEFORE DELETE ON Exercises BEGIN
  DELETE FROM ExerciseRightAnswer WHERE exerciseId = old.id;
  DELETE FROM ExerciseOptions WHERE exerciseId = old.id;
  DELETE FROM ExerciseSet WHERE exerciseId = old.id;
END;

insert into Members (first_name, last_name, email, birth_date, gender, usertype, password, username) values ('Benjamin', 'Hayes', 'bhayes0@narod.ru', '7/8/2014', 'Male', 'teacher', 'J5eFdrH3G8HU', 'bhayes0');
insert into Members (first_name, last_name, email, birth_date, gender, usertype, password, username) values ('Evelyn', 'Lopez', 'elopez1@vinaora.com', '4/7/2014', 'Female', 'teacher', 'rlPc4Nzhz1', 'elopez1');
insert into Members (first_name, last_name, email, birth_date, gender, usertype, password, username) values ('Marilyn', 'Hansen', 'mhansen2@hibu.com', '10/8/2014', 'Female', 'teacher', 'r262xzI6Cy', 'mhansen2');
insert into Members (first_name, last_name, email, birth_date, gender, usertype, password, username) values ('Annie', 'Pierce', 'apierce3@sitemeter.com', '12/28/2013', 'Female', 'student', 'SpIC9P', 'apierce3');
insert into Members (first_name, last_name, email, birth_date, gender, usertype, password, username) values ('Jose', 'Smith', 'jsmith4@twitpic.com', '5/2/2014', 'Male', 'teacher', 'fQPlQcss', 'jsmith4');
insert into Members (first_name, last_name, email, birth_date, gender, usertype, password, username) values ('Heather', 'Simmons', 'hsimmons5@dot.gov', '1/22/2014', 'Female', 'student', 'vvHpbn73Z', 'hsimmons5');
insert into Members (first_name, last_name, email, birth_date, gender, usertype, password, username) values ('Kevin', 'Hamilton', 'khamilton6@gov.uk', '3/21/2014', 'Male', 'teacher', '6FGvGpgRe', 'khamilton6');
insert into Members (first_name, last_name, email, birth_date, gender, usertype, password, username) values ('Sarah', 'Woods', 'swoods7@about.com', '11/6/2014', 'Female', 'teacher', '5Qg94GkvS', 'swoods7');
insert into Members (first_name, last_name, email, birth_date, gender, usertype, password, username) values ('Barbara', 'Clark', 'bclark8@seesaa.net', '4/2/2014', 'Female', 'student', 'CNwBUhYCFEV', 'bclark8');
insert into Members (first_name, last_name, email, birth_date, gender, usertype, password, username) values ('Carl', 'Simmons', 'csimmons9@apple.com', '12/31/2013', 'Male', 'student', 'oGuMGVPWSPyy', 'csimmons9');
insert into Members (first_name, last_name, email, birth_date, gender, usertype, password, username) values ('Denise', 'Ruiz', 'druiza@wp.com', '1/26/2014', 'Female', 'teacher', 'nzuFotbv4YEx', 'druiza');
insert into Members (first_name, last_name, email, birth_date, gender, usertype, password, username) values ('Jeremy', 'Carroll', 'jcarrollb@1und1.de', '11/17/2014', 'Male', 'teacher', '4k68pLkv', 'jcarrollb');
insert into Members (first_name, last_name, email, birth_date, gender, usertype, password, username) values ('Jesse', 'Gutierrez', 'jgutierrezc@reddit.com', '11/15/2014', 'Male', 'student', 'VUs9u8WH', 'jgutierrezc');
insert into Members (first_name, last_name, email, birth_date, gender, usertype, password, username) values ('Scott', 'Green', 'sgreend@sakura.ne.jp', '7/11/2014', 'Male', 'teacher', 'hqWoI9q', 'sgreend');
insert into Members (first_name, last_name, email, birth_date, gender, usertype, password, username) values ('Debra', 'Harris', 'dharrise@livejournal.com', '2/18/2014', 'Female', 'teacher', 'MhxJUqMCDMba', 'dharrise');
insert into Members (first_name, last_name, email, birth_date, gender, usertype, password, username) values ('Eugene', 'Hansen', 'ehansenf@google.de', '3/26/2014', 'Male', 'teacher', '1RvOAz3', 'ehansenf');
insert into Members (first_name, last_name, email, birth_date, gender, usertype, password, username) values ('Doris', 'Payne', 'dpayneg@flickr.com', '6/27/2014', 'Female', 'student', 'Cov3G7Q', 'dpayneg');
insert into Members (first_name, last_name, email, birth_date, gender, usertype, password, username) values ('Richard', 'Riley', 'rrileyh@eventbrite.com', '5/31/2014', 'Male', 'student', 'J8DjCUT', 'rrileyh');
insert into Members (first_name, last_name, email, birth_date, gender, usertype, password, username) values ('Jason', 'Coleman', 'jcolemani@biblegateway.com', '9/29/2014', 'Male', 'student', 'ur8agYnKtmql', 'jcolemani');
insert into Members (first_name, last_name, email, birth_date, gender, usertype, password, username) values ('Kathryn', 'Frazier', 'kfrazierj@harvard.edu', '10/3/2014', 'Female', 'student', 'WpSQOi8OGG', 'kfrazierj');
insert into Members (first_name, last_name, email, birth_date, gender, usertype, password, username) values ('Arthur', 'Lewis', 'alewisk@pen.io', '8/17/2014', 'Male', 'student', 'i1mUbbw9TbK', 'alewisk');
insert into Members (first_name, last_name, email, birth_date, gender, usertype, password, username) values ('Mildred', 'Diaz', 'mdiazl@chron.com', '5/23/2014', 'Female', 'teacher', 'lzfn1i', 'mdiazl');
insert into Members (first_name, last_name, email, birth_date, gender, usertype, password, username) values ('Sandra', 'Perez', 'sperezm@flickr.com', '10/11/2014', 'Female', 'student', 'HQ6ASZjF2m', 'sperezm');
insert into Members (first_name, last_name, email, birth_date, gender, usertype, password, username) values ('Janice', 'Davis', 'jdavisn@creativecommons.org', '8/2/2014', 'Female', 'teacher', 'Pqgit8tX0gn', 'jdavisn');
insert into Members (first_name, last_name, email, birth_date, gender, usertype, password, username) values ('Wanda', 'Ramirez', 'wramirezo@purevolume.com', '9/5/2014', 'Female', 'teacher', 'QvIFIrwk', 'wramirezo');
insert into Members (first_name, last_name, email, birth_date, gender, usertype, password, username) values ('Anna', 'Stanley', 'astanleyp@hp.com', '6/14/2014', 'Female', 'student', 'N0akvVWg3t', 'astanleyp');
insert into Members (first_name, last_name, email, birth_date, gender, usertype, password, username) values ('Billy', 'Harris', 'bharrisq@scribd.com', '3/23/2014', 'Male', 'teacher', 'mEge7KUO1C6', 'bharrisq');
insert into Members (first_name, last_name, email, birth_date, gender, usertype, password, username) values ('Brandon', 'Kelly', 'bkellyr@wsj.com', '11/19/2013', 'Male', 'teacher', 'BWGwWWpctCW', 'bkellyr');
insert into Members (first_name, last_name, email, birth_date, gender, usertype, password, username) values ('Martin', 'Rivera', 'mriveras@scribd.com', '4/22/2014', 'Male', 'teacher', 'yeLriGU0t', 'mriveras');
insert into Members (first_name, last_name, email, birth_date, gender, usertype, password, username) values ('Ann', 'Murray', 'amurrayt@weather.com', '6/15/2014', 'Female', 'teacher', 'DE2AQ4Xcz', 'amurrayt');
insert into Members (first_name, last_name, email, birth_date, gender, usertype, password, username) values ('Ernest', 'Gomez', 'egomezu@intel.com', '1/20/2014', 'Male', 'teacher', 'MGx8Gdbq', 'egomezu');
insert into Members (first_name, last_name, email, birth_date, gender, usertype, password, username) values ('Rebecca', 'Berry', 'rberryv@acquirethisname.com', '4/30/2014', 'Female', 'teacher', 'ia3jpn', 'rberryv');
insert into Members (first_name, last_name, email, birth_date, gender, usertype, password, username) values ('Julia', 'Vasquez', 'jvasquezw@xinhuanet.com', '5/14/2014', 'Female', 'student', 'ifOME1ZLfU', 'jvasquezw');
insert into Members (first_name, last_name, email, birth_date, gender, usertype, password, username) values ('Michael', 'Garza', 'mgarzax@yolasite.com', '5/20/2014', 'Male', 'teacher', 'cIUe8E', 'mgarzax');
insert into Members (first_name, last_name, email, birth_date, gender, usertype, password, username) values ('Tina', 'Perkins', 'tperkinsy@va.gov', '11/5/2014', 'Female', 'teacher', 'jGpsBS', 'tperkinsy');
insert into Members (first_name, last_name, email, birth_date, gender, usertype, password, username) values ('Kimberly', 'Griffin', 'kgriffinz@sbwire.com', '9/21/2014', 'Female', 'student', 'nsrZaylvK', 'kgriffinz');
insert into Members (first_name, last_name, email, birth_date, gender, usertype, password, username) values ('Donna', 'Ramos', 'dramos10@marriott.com', '5/5/2014', 'Female', 'teacher', '2NpdCWsfvqu', 'dramos10');
insert into Members (first_name, last_name, email, birth_date, gender, usertype, password, username) values ('Fred', 'Castillo', 'fcastillo11@irs.gov', '7/7/2014', 'Male', 'student', 'VVaLn278t', 'fcastillo11');
insert into Members (first_name, last_name, email, birth_date, gender, usertype, password, username) values ('Amy', 'Miller', 'amiller12@amazonaws.com', '7/27/2014', 'Female', 'student', 'eOerybB78Y', 'amiller12');
insert into Members (first_name, last_name, email, birth_date, gender, usertype, password, username) values ('Carl', 'Johnston', 'cjohnston13@unicef.org', '5/20/2014', 'Male', 'teacher', 'nUpPhbWwLA', 'cjohnston13');
insert into Members (first_name, last_name, email, birth_date, gender, usertype, password, username) values ('Karen', 'Larson', 'klarson14@huffingtonpost.com', '1/30/2014', 'Female', 'student', 'oXXIuk', 'klarson14');
insert into Members (first_name, last_name, email, birth_date, gender, usertype, password, username) values ('Judy', 'James', 'jjames15@ebay.co.uk', '2/22/2014', 'Female', 'teacher', 'rId3AvJ87kSM', 'jjames15');
insert into Members (first_name, last_name, email, birth_date, gender, usertype, password, username) values ('Jimmy', 'Mendoza', 'jmendoza16@go.com', '12/26/2013', 'Male', 'student', '3vzKTm', 'jmendoza16');
insert into Members (first_name, last_name, email, birth_date, gender, usertype, password, username) values ('Joan', 'Greene', 'jgreene17@jigsy.com', '12/26/2013', 'Female', 'student', 'r2ovu1HD', 'jgreene17');
insert into Members (first_name, last_name, email, birth_date, gender, usertype, password, username) values ('Johnny', 'Sims', 'jsims18@lycos.com', '1/28/2014', 'Male', 'student', 'W7U6gQJDs', 'jsims18');
insert into Members (first_name, last_name, email, birth_date, gender, usertype, password, username) values ('Ashley', 'Lopez', 'alopez19@mediafire.com', '3/9/2014', 'Female', 'student', 'bLTn26', 'alopez19');
insert into Members (first_name, last_name, email, birth_date, gender, usertype, password, username) values ('Douglas', 'Anderson', 'danderson1a@ocn.ne.jp', '10/26/2014', 'Male', 'student', 'KefozB4J', 'danderson1a');
insert into Members (first_name, last_name, email, birth_date, gender, usertype, password, username) values ('Frank', 'Watson', 'fwatson1b@ameblo.jp', '3/4/2014', 'Male', 'student', 'KcdpTcjSmQND', 'fwatson1b');
insert into Members (first_name, last_name, email, birth_date, gender, usertype, password, username) values ('Barbara', 'Diaz', 'bdiaz1c@cyberchimps.com', '7/26/2014', 'Female', 'student', 'KbCysAYpd2', 'bdiaz1c');
insert into Members (first_name, last_name, email, birth_date, gender, usertype, password, username) values ('Lawrence', 'Long', 'llong1d@sun.com', '3/2/2014', 'Male', 'student', 'tWXOqAxu', 'llong1d');

insert into Itens (part,name, img_location, description, price) values (0,'Brown skin', 'http://i.imgur.com/Nhsz4TO.png', 'Get the summer look with this brown skin!', 53);
insert into Itens (part,name, img_location, description, price) values (0,'Yellow skin', 'http://i.imgur.com/XOpyAs4.png', 'Yellow skin? Why not?', 2);
insert into Itens (part,name, img_location, description, price) values (0,'Pink skin', 'http://i.imgur.com/FerKE2m.png', 'Do you blush frequently? This pink skin will recreate those moments!', 1);
insert into Itens (part,name, img_location, description, price) values (1,'Blue T-shirt', 'http://i.imgur.com/hMk1Sb8.png', 'Style your avatar with this cool blue t-shirt!', 94);
insert into Itens (part,name, img_location, description, price) values (1,'White T-shirt', 'http://i.imgur.com/38XEYzX.png', 'You can''t go wrong in white. This white t-shirt will suit you perfectly!', 50);
insert into Itens (part,name, img_location, description, price) values (2,'Black eyes', 'http://i.imgur.com/sS84mre.png', 'Set the color of your avatar''s eyes to black.', 85);
insert into Itens (part,name, img_location, description, price) values (2,'Red eyes', 'http://i.imgur.com/MKZdj8S.png', 'Set the color of your avatar''s eyes to red.', 76);
insert into Itens (part,name, img_location, description, price) values (2,'Green eyes', 'http://i.imgur.com/z8CqW2B.png', 'Set the color of your avatar''s eyes to green.', 81);
insert into Itens (part,name, img_location, description, price) values (2,'Brown eyes', 'http://i.imgur.com/MUM9uNj.png', 'Set the color of your avatar''s eyes to brown.', 38);

insert into AvatarUser( memberId ,part0,part1,part2) values (5,1,5,7);