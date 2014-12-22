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

CREATE TABLE Avatar(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name VARCHAR,
  img_location VARCHAR
);

CREATE TABLE AvatarUser(
  avatarId INTEGER REFERENCES Avatar(id),
  memberId INTEGER REFERENCES Members(id),
  UNIQUE (memberId, avatarId)
);


CREATE TRIGGER on_class_delete BEFORE DELETE ON Classes BEGIN
  DELETE FROM ClassMember WHERE classId = old.id;
  DELETE FROM ClassExerciseSet WHERE classId = old.id;
  DELETE FROM MemberEvents WHERE classId = old.id;
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




insert into Classes (id, name) values (1, 'História');
insert into Classes (id, name) values (2, 'Matemática');
insert into Classes (id, name) values (3, 'Inglês');
insert into Classes (id, name) values (4, 'Português');
insert into Classes (id, name) values (5, 'Biologia');

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

INSERT OR IGNORE into ClassMember (memberId, classId, score) values (16, 3, 39);
INSERT OR IGNORE into ClassMember (memberId, classId, score) values (37, 2, 324);
INSERT OR IGNORE into ClassMember (memberId, classId, score) values (8, 5, 427);
INSERT OR IGNORE into ClassMember (memberId, classId, score) values (30, 3, 272);
INSERT OR IGNORE into ClassMember (memberId, classId, score) values (45, 1, 12);
INSERT OR IGNORE into ClassMember (memberId, classId, score) values (5, 1, 339);
INSERT OR IGNORE into ClassMember (memberId, classId, score) values (29, 1, 314);
INSERT OR IGNORE into ClassMember (memberId, classId, score) values (34, 4, 18);
INSERT OR IGNORE into ClassMember (memberId, classId, score) values (34, 5, 280);
INSERT OR IGNORE into ClassMember (memberId, classId, score) values (42, 2, 144);
INSERT OR IGNORE into ClassMember (memberId, classId, score) values (8, 4, 139);
INSERT OR IGNORE into ClassMember (memberId, classId, score) values (8, 1, 408);
INSERT OR IGNORE into ClassMember (memberId, classId, score) values (29, 3, 4);
INSERT OR IGNORE into ClassMember (memberId, classId, score) values (24, 1, 83);
INSERT OR IGNORE into ClassMember (memberId, classId, score) values (12, 5, 280);
INSERT OR IGNORE into ClassMember (memberId, classId, score) values (39, 1, 309);
INSERT OR IGNORE into ClassMember (memberId, classId, score) values (10, 3, 30);
INSERT OR IGNORE into ClassMember (memberId, classId, score) values (34, 5, 372);
INSERT OR IGNORE into ClassMember (memberId, classId, score) values (31, 2, 493);
INSERT OR IGNORE into ClassMember (memberId, classId, score) values (9, 1, 7);
INSERT OR IGNORE into ClassMember (memberId, classId, score) values (46, 3, 173);
INSERT OR IGNORE into ClassMember (memberId, classId, score) values (13, 4, 497);
INSERT OR IGNORE into ClassMember (memberId, classId, score) values (31, 5, 15);
INSERT OR IGNORE into ClassMember (memberId, classId, score) values (42, 2, 449);
INSERT OR IGNORE into ClassMember (memberId, classId, score) values (44, 1, 492);
INSERT OR IGNORE into ClassMember (memberId, classId, score) values (26, 2, 263);
INSERT OR IGNORE into ClassMember (memberId, classId, score) values (6, 2, 372);
INSERT OR IGNORE into ClassMember (memberId, classId, score) values (46, 4, 457);
INSERT OR IGNORE into ClassMember (memberId, classId, score) values (41, 3, 137);
INSERT OR IGNORE into ClassMember (memberId, classId, score) values (19, 4, 200);
INSERT OR IGNORE into ClassMember (memberId, classId, score) values (36, 3, 199);
INSERT OR IGNORE into ClassMember (memberId, classId, score) values (20, 4, 290);
INSERT OR IGNORE into ClassMember (memberId, classId, score) values (22, 5, 169);
INSERT OR IGNORE into ClassMember (memberId, classId, score) values (26, 1, 266);
INSERT OR IGNORE into ClassMember (memberId, classId, score) values (34, 5, 47);
INSERT OR IGNORE into ClassMember (memberId, classId, score) values (9, 4, 422);
INSERT OR IGNORE into ClassMember (memberId, classId, score) values (24, 5, 431);
INSERT OR IGNORE into ClassMember (memberId, classId, score) values (2, 1, 346);
INSERT OR IGNORE into ClassMember (memberId, classId, score) values (45, 1, 333);
INSERT OR IGNORE into ClassMember (memberId, classId, score) values (7, 2, 18);
INSERT OR IGNORE into ClassMember (memberId, classId, score) values (46, 5, 180);
INSERT OR IGNORE into ClassMember (memberId, classId, score) values (40, 1, 326);
INSERT OR IGNORE into ClassMember (memberId, classId, score) values (40, 3, 131);
INSERT OR IGNORE into ClassMember (memberId, classId, score) values (50, 4, 481);
INSERT OR IGNORE into ClassMember (memberId, classId, score) values (32, 1, 319);
INSERT OR IGNORE into ClassMember (memberId, classId, score) values (17, 2, 402);
INSERT OR IGNORE into ClassMember (memberId, classId, score) values (3, 3, 16);
INSERT OR IGNORE into ClassMember (memberId, classId, score) values (30, 4, 68);
INSERT OR IGNORE into ClassMember (memberId, classId, score) values (35, 5, 492);
INSERT OR IGNORE into ClassMember (memberId, classId, score) values (15, 5, 145);


insert into Exercises (name) values ('Neutrogena Age Defense Anti Oxidant Daily Moisturizer');
insert into Exercises (name) values ('Propranolol Hydrochloride');
insert into Exercises (name) values ('Bald Cypress');
insert into Exercises (name) values ('Heparin Sodium');
insert into Exercises (name) values ('CLONIDINE HYDROCHLORIDE');
insert into Exercises (name) values ('Deb Med Antimicrobial Foaming Hand Wash Fresh Grapefruit');
insert into Exercises (name) values ('Lithium Carbonate');
insert into Exercises (name) values ('APAP');
insert into Exercises (name) values ('Instant Hand Sanitizer TENNder CARE');
insert into Exercises (name) values ('BETULA LENTA POLLEN');
insert into Exercises (name) values ('ShopRite Ibuprofen IB');
insert into Exercises (name) values ('Diphenhydramine Hydrochloride');
insert into Exercises (name) values ('FRAXINUS VELUTINA POLLEN');
insert into Exercises (name) values ('Lidocaine Hydrochloride and Epinephrine');
insert into Exercises (name) values ('Clindamycin');
insert into Exercises (name) values ('Amlodipine besylate and Atorvastatin calcium');
insert into Exercises (name) values ('Venlafaxine');
insert into Exercises (name) values ('Hydrocortisone');
insert into Exercises (name) values ('Potassium Phosphates');
insert into Exercises (name) values ('Trandate');
insert into Exercises (name) values ('Oxybutynin Chloride');
insert into Exercises (name) values ('Auro Homeopathic Ear Relief Drops');
insert into Exercises (name) values ('Leader tussin dm max');
insert into Exercises (name) values ('Lamotrigine');
insert into Exercises (name) values ('care one pain relief pm');
insert into Exercises (name) values ('Stay Awake');
insert into Exercises (name) values ('Pollens - Trees, Cedar, Red Juniperus virginiana');
insert into Exercises (name) values ('Bronchitis and Asthma Aide');
insert into Exercises (name) values ('Citalopram');
insert into Exercises (name) values ('Prozac');
insert into Exercises (name) values ('Aspergillus terreus');
insert into Exercises (name) values ('Tramadol Hydrochloride');
insert into Exercises (name) values ('Atenolol');
insert into Exercises (name) values ('Watermelon');
insert into Exercises (name) values ('BANANA BOAT');
insert into Exercises (name) values ('FLOVENT');
insert into Exercises (name) values ('tramadol hydrochloride');
insert into Exercises (name) values ('TRICLOSAN');
insert into Exercises (name) values ('Metolazone');
insert into Exercises (name) values ('Zidovudine');
insert into Exercises (name) values ('Bisacodyl');
insert into Exercises (name) values ('Maximum Strength Heartburn Relief');
insert into Exercises (name) values ('allergy eye');
insert into Exercises (name) values ('Quinapril Hydrochloride and Hydrochlorothiazide');
insert into Exercises (name) values ('Sunmark sore throat');
insert into Exercises (name) values ('Mycophenolate Mofetil');
insert into Exercises (name) values ('NHS Spasms Weakness');
insert into Exercises (name) values ('eye itch relief');
insert into Exercises (name) values ('Gemfibrozil');
insert into Exercises (name) values ('Smut, Corn');

insert into ExerciseOptions (exerciseId, description) values (1, 'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.');
insert into ExerciseOptions (exerciseId, description) values (2, 'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.');
insert into ExerciseOptions (exerciseId, description) values (3, 'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.');
insert into ExerciseOptions (exerciseId, description) values (4, 'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.');
insert into ExerciseOptions (exerciseId, description) values (5, 'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.');
insert into ExerciseOptions (exerciseId, description) values (6, 'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.');
insert into ExerciseOptions (exerciseId, description) values (7, 'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.');
insert into ExerciseOptions (exerciseId, description) values (8, 'Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.');
insert into ExerciseOptions (exerciseId, description) values (9, 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.');
insert into ExerciseOptions (exerciseId, description) values (10, 'Fusce consequat. Nulla nisl. Nunc nisl.');
insert into ExerciseOptions (exerciseId, description) values (11, 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.');
insert into ExerciseOptions (exerciseId, description) values (12, 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.');
insert into ExerciseOptions (exerciseId, description) values (13, 'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.');
insert into ExerciseOptions (exerciseId, description) values (14, 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.');
insert into ExerciseOptions (exerciseId, description) values (15, 'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.');
insert into ExerciseOptions (exerciseId, description) values (16, 'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.');
insert into ExerciseOptions (exerciseId, description) values (17, 'In congue. Etiam justo. Etiam pretium iaculis justo.');
insert into ExerciseOptions (exerciseId, description) values (18, 'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.');
insert into ExerciseOptions (exerciseId, description) values (19, 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.');
insert into ExerciseOptions (exerciseId, description) values (20, 'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.');
insert into ExerciseOptions (exerciseId, description) values (21, 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.');
insert into ExerciseOptions (exerciseId, description) values (22, 'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.');
insert into ExerciseOptions (exerciseId, description) values (23, 'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.');
insert into ExerciseOptions (exerciseId, description) values (24, 'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.');
insert into ExerciseOptions (exerciseId, description) values (25, 'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.');
insert into ExerciseOptions (exerciseId, description) values (26, 'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.');
insert into ExerciseOptions (exerciseId, description) values (27, 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.');
insert into ExerciseOptions (exerciseId, description) values (28, 'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.');
insert into ExerciseOptions (exerciseId, description) values (29, 'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.');
insert into ExerciseOptions (exerciseId, description) values (30, 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.');
insert into ExerciseOptions (exerciseId, description) values (31, 'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.');
insert into ExerciseOptions (exerciseId, description) values (32, 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.');
insert into ExerciseOptions (exerciseId, description) values (33, 'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.');
insert into ExerciseOptions (exerciseId, description) values (34, 'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.');
insert into ExerciseOptions (exerciseId, description) values (35, 'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.');
insert into ExerciseOptions (exerciseId, description) values (36, 'Fusce consequat. Nulla nisl. Nunc nisl.');
insert into ExerciseOptions (exerciseId, description) values (37, 'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.');
insert into ExerciseOptions (exerciseId, description) values (38, 'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.');
insert into ExerciseOptions (exerciseId, description) values (39, 'Sed ante. Vivamus tortor. Duis mattis egestas metus.');
insert into ExerciseOptions (exerciseId, description) values (40, 'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.');
insert into ExerciseOptions (exerciseId, description) values (41, 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.');
insert into ExerciseOptions (exerciseId, description) values (42, 'Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.');
insert into ExerciseOptions (exerciseId, description) values (43, 'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.');
insert into ExerciseOptions (exerciseId, description) values (44, 'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.');
insert into ExerciseOptions (exerciseId, description) values (45, 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.');
insert into ExerciseOptions (exerciseId, description) values (46, 'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.');
insert into ExerciseOptions (exerciseId, description) values (47, 'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.');
insert into ExerciseOptions (exerciseId, description) values (48, 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.');
insert into ExerciseOptions (exerciseId, description) values (49, 'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.');
insert into ExerciseOptions (exerciseId, description) values (50, 'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.');


insert into ExerciseRightAnswer (exerciseId, optionId) values (12, 18);
insert into ExerciseRightAnswer (exerciseId, optionId) values (35, 19);
insert into ExerciseRightAnswer (exerciseId, optionId) values (36, 2);
insert into ExerciseRightAnswer (exerciseId, optionId) values (50, 20);
insert into ExerciseRightAnswer (exerciseId, optionId) values (49, 14);
insert into ExerciseRightAnswer (exerciseId, optionId) values (5, 28);
insert into ExerciseRightAnswer (exerciseId, optionId) values (10, 40);
insert into ExerciseRightAnswer (exerciseId, optionId) values (27, 19);
insert into ExerciseRightAnswer (exerciseId, optionId) values (36, 40);
insert into ExerciseRightAnswer (exerciseId, optionId) values (11, 7);
insert into ExerciseRightAnswer (exerciseId, optionId) values (2, 19);
insert into ExerciseRightAnswer (exerciseId, optionId) values (13, 27);
insert into ExerciseRightAnswer (exerciseId, optionId) values (28, 7);
insert into ExerciseRightAnswer (exerciseId, optionId) values (18, 24);
insert into ExerciseRightAnswer (exerciseId, optionId) values (1, 29);
insert into ExerciseRightAnswer (exerciseId, optionId) values (30, 3);
insert into ExerciseRightAnswer (exerciseId, optionId) values (48, 41);
insert into ExerciseRightAnswer (exerciseId, optionId) values (20, 34);
insert into ExerciseRightAnswer (exerciseId, optionId) values (12, 5);
insert into ExerciseRightAnswer (exerciseId, optionId) values (48, 48);
insert into ExerciseRightAnswer (exerciseId, optionId) values (29, 41);
insert into ExerciseRightAnswer (exerciseId, optionId) values (31, 11);
insert into ExerciseRightAnswer (exerciseId, optionId) values (38, 23);
insert into ExerciseRightAnswer (exerciseId, optionId) values (21, 12);
insert into ExerciseRightAnswer (exerciseId, optionId) values (42, 39);
insert into ExerciseRightAnswer (exerciseId, optionId) values (27, 9);
insert into ExerciseRightAnswer (exerciseId, optionId) values (47, 19);
insert into ExerciseRightAnswer (exerciseId, optionId) values (14, 49);
insert into ExerciseRightAnswer (exerciseId, optionId) values (21, 23);
insert into ExerciseRightAnswer (exerciseId, optionId) values (45, 43);
insert into ExerciseRightAnswer (exerciseId, optionId) values (10, 35);
insert into ExerciseRightAnswer (exerciseId, optionId) values (10, 32);
insert into ExerciseRightAnswer (exerciseId, optionId) values (1, 11);
insert into ExerciseRightAnswer (exerciseId, optionId) values (20, 29);
insert into ExerciseRightAnswer (exerciseId, optionId) values (29, 12);
insert into ExerciseRightAnswer (exerciseId, optionId) values (32, 50);
insert into ExerciseRightAnswer (exerciseId, optionId) values (9, 28);
insert into ExerciseRightAnswer (exerciseId, optionId) values (34, 39);
insert into ExerciseRightAnswer (exerciseId, optionId) values (11, 36);
insert into ExerciseRightAnswer (exerciseId, optionId) values (38, 37);
insert into ExerciseRightAnswer (exerciseId, optionId) values (23, 19);
insert into ExerciseRightAnswer (exerciseId, optionId) values (15, 14);
insert into ExerciseRightAnswer (exerciseId, optionId) values (27, 2);
insert into ExerciseRightAnswer (exerciseId, optionId) values (1, 38);
insert into ExerciseRightAnswer (exerciseId, optionId) values (35, 36);
insert into ExerciseRightAnswer (exerciseId, optionId) values (9, 26);
insert into ExerciseRightAnswer (exerciseId, optionId) values (35, 34);
insert into ExerciseRightAnswer (exerciseId, optionId) values (11, 8);
insert into ExerciseRightAnswer (exerciseId, optionId) values (49, 7);
insert into ExerciseRightAnswer (exerciseId, optionId) values (1, 41);


insert into Itens (name, img_location, description, price) values ('item', 'http://nuieee.fe.up.pt/img/feup.png', 'odio curabitur convallis duis consequat dui nec nisi volutpat eleifend donec ut dolor morbi vel lectus in', 94);
insert into Itens (name, img_location, description, price) values ('item', 'http://nuieee.fe.up.pt/img/feup.png', 'faucibus orci luctus et ultrices posuere cubilia curae duis faucibus accumsan odio', 50);
insert into Itens (name, img_location, description, price) values ('item', 'http://nuieee.fe.up.pt/img/feup.png', 'id luctus nec molestie sed justo pellentesque viverra pede ac diam cras pellentesque volutpat dui maecenas tristique', 85);
insert into Itens (name, img_location, description, price) values ('item', 'http://nuieee.fe.up.pt/img/feup.png', 'platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum', 76);
insert into Itens (name, img_location, description, price) values ('item', 'http://nuieee.fe.up.pt/img/feup.png', 'vehicula consequat morbi a ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus morbi quis', 81);
insert into Itens (name, img_location, description, price) values ('item', 'http://nuieee.fe.up.pt/img/feup.png', 'metus aenean fermentum donec ut mauris eget massa tempor convallis nulla neque libero convallis eget eleifend', 38);
insert into Itens (name, img_location, description, price) values ('item', 'http://nuieee.fe.up.pt/img/feup.png', 'sit amet cursus id turpis integer aliquet massa id lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi', 53);
insert into Itens (name, img_location, description, price) values ('item', 'http://nuieee.fe.up.pt/img/feup.png', 'turpis elementum ligula vehicula consequat morbi a ipsum integer a nibh in quis justo maecenas rhoncus', 2);
insert into Itens (name, img_location, description, price) values ('item', 'http://nuieee.fe.up.pt/img/feup.png', 'justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros', 1);
insert into Itens (name, img_location, description, price) values ('item', 'http://nuieee.fe.up.pt/img/feup.png', 'elit ac nulla sed vel enim sit amet nunc viverra dapibus nulla suscipit ligula in lacus curabitur at', 15);
insert into Itens (name, img_location, description, price) values ('item', 'http://nuieee.fe.up.pt/img/feup.png', 'id lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam', 35);
insert into Itens (name, img_location, description, price) values ('item', 'http://nuieee.fe.up.pt/img/feup.png', 'maecenas ut massa quis augue luctus tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida nisi at', 13);
insert into Itens (name, img_location, description, price) values ('item', 'http://nuieee.fe.up.pt/img/feup.png', 'in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum', 66);
insert into Itens (name, img_location, description, price) values ('item', 'http://nuieee.fe.up.pt/img/feup.png', 'ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus et', 19);
insert into Itens (name, img_location, description, price) values ('item', 'http://nuieee.fe.up.pt/img/feup.png', 'mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas metus aenean fermentum donec', 88);
insert into Itens (name, img_location, description, price) values ('item', 'http://nuieee.fe.up.pt/img/feup.png', 'posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet diam in', 31);
insert into Itens (name, img_location, description, price) values ('item', 'http://nuieee.fe.up.pt/img/feup.png', 'consectetuer adipiscing elit proin interdum mauris non ligula pellentesque ultrices phasellus id sapien in sapien', 39);
insert into Itens (name, img_location, description, price) values ('item', 'http://nuieee.fe.up.pt/img/feup.png', 'gravida sem praesent id massa id nisl venenatis lacinia aenean sit amet justo morbi ut odio cras mi pede malesuada', 76);
insert into Itens (name, img_location, description, price) values ('item', 'http://nuieee.fe.up.pt/img/feup.png', 'pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus', 40);
insert into Itens (name, img_location, description, price) values ('item', 'http://nuieee.fe.up.pt/img/feup.png', 'vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae', 91);
insert into Itens (name, img_location, description, price) values ('item', 'http://nuieee.fe.up.pt/img/feup.png', 'ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin', 91);
insert into Itens (name, img_location, description, price) values ('item', 'http://nuieee.fe.up.pt/img/feup.png', 'orci luctus et ultrices posuere cubilia curae duis faucibus accumsan odio curabitur convallis duis consequat dui nec', 42);
insert into Itens (name, img_location, description, price) values ('item', 'http://nuieee.fe.up.pt/img/feup.png', 'justo in blandit ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit proin', 100);
insert into Itens (name, img_location, description, price) values ('item', 'http://nuieee.fe.up.pt/img/feup.png', 'eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut', 16);
insert into Itens (name, img_location, description, price) values ('item', 'http://nuieee.fe.up.pt/img/feup.png', 'odio cras mi pede malesuada in imperdiet et commodo vulputate justo in blandit', 48);
insert into Itens (name, img_location, description, price) values ('item', 'http://nuieee.fe.up.pt/img/feup.png', 'sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien', 18);
insert into Itens (name, img_location, description, price) values ('item', 'http://nuieee.fe.up.pt/img/feup.png', 'dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec', 15);
insert into Itens (name, img_location, description, price) values ('item', 'http://nuieee.fe.up.pt/img/feup.png', 'nisl venenatis lacinia aenean sit amet justo morbi ut odio cras mi pede malesuada', 50);
insert into Itens (name, img_location, description, price) values ('item', 'http://nuieee.fe.up.pt/img/feup.png', 'magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet', 2);
insert into Itens (name, img_location, description, price) values ('item', 'http://nuieee.fe.up.pt/img/feup.png', 'nullam sit amet turpis elementum ligula vehicula consequat morbi a ipsum integer a', 32);
insert into Itens (name, img_location, description, price) values ('item', 'http://nuieee.fe.up.pt/img/feup.png', 'sem duis aliquam convallis nunc proin at turpis a pede posuere nonummy integer non velit', 36);
insert into Itens (name, img_location, description, price) values ('item', 'http://nuieee.fe.up.pt/img/feup.png', 'mauris viverra diam vitae quam suspendisse potenti nullam porttitor lacus at turpis donec posuere metus vitae ipsum', 43);
insert into Itens (name, img_location, description, price) values ('item', 'http://nuieee.fe.up.pt/img/feup.png', 'ante vivamus tortor duis mattis egestas metus aenean fermentum donec ut mauris eget', 20);
insert into Itens (name, img_location, description, price) values ('item', 'http://nuieee.fe.up.pt/img/feup.png', 'cubilia curae mauris viverra diam vitae quam suspendisse potenti nullam porttitor lacus at turpis donec posuere metus vitae ipsum', 82);
insert into Itens (name, img_location, description, price) values ('item', 'http://nuieee.fe.up.pt/img/feup.png', 'lorem id ligula suspendisse ornare consequat lectus in est risus auctor', 75);
insert into Itens (name, img_location, description, price) values ('item', 'http://nuieee.fe.up.pt/img/feup.png', 'volutpat erat quisque erat eros viverra eget congue eget semper rutrum nulla nunc purus phasellus in felis', 24);
insert into Itens (name, img_location, description, price) values ('item', 'http://nuieee.fe.up.pt/img/feup.png', 'porttitor id consequat in consequat ut nulla sed accumsan felis ut at dolor quis odio consequat varius integer ac leo', 35);
insert into Itens (name, img_location, description, price) values ('item', 'http://nuieee.fe.up.pt/img/feup.png', 'dui maecenas tristique est et tempus semper est quam pharetra magna ac consequat metus sapien', 93);
insert into Itens (name, img_location, description, price) values ('item', 'http://nuieee.fe.up.pt/img/feup.png', 'odio in hac habitasse platea dictumst maecenas ut massa quis augue luctus tincidunt nulla mollis molestie', 74);
insert into Itens (name, img_location, description, price) values ('item', 'http://nuieee.fe.up.pt/img/feup.png', 'sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt ante vel ipsum praesent blandit', 62);
insert into Itens (name, img_location, description, price) values ('item', 'http://nuieee.fe.up.pt/img/feup.png', 'integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum sed magna at nunc', 59);
insert into Itens (name, img_location, description, price) values ('item', 'http://nuieee.fe.up.pt/img/feup.png', 'lobortis est phasellus sit amet erat nulla tempus vivamus in felis eu sapien cursus vestibulum proin', 11);
insert into Itens (name, img_location, description, price) values ('item', 'http://nuieee.fe.up.pt/img/feup.png', 'varius nulla facilisi cras non velit nec nisi vulputate nonummy maecenas tincidunt lacus at velit vivamus vel nulla eget', 18);
insert into Itens (name, img_location, description, price) values ('item', 'http://nuieee.fe.up.pt/img/feup.png', 'nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit', 32);
insert into Itens (name, img_location, description, price) values ('item', 'http://nuieee.fe.up.pt/img/feup.png', 'sed ante vivamus tortor duis mattis egestas metus aenean fermentum donec ut mauris eget massa', 66);
insert into Itens (name, img_location, description, price) values ('item', 'http://nuieee.fe.up.pt/img/feup.png', 'blandit mi in porttitor pede justo eu massa donec dapibus duis at velit eu est congue elementum in hac habitasse', 27);
insert into Itens (name, img_location, description, price) values ('item', 'http://nuieee.fe.up.pt/img/feup.png', 'non mattis pulvinar nulla pede ullamcorper augue a suscipit nulla elit ac nulla sed vel enim sit amet', 74);
insert into Itens (name, img_location, description, price) values ('item', 'http://nuieee.fe.up.pt/img/feup.png', 'sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus', 45);
insert into Itens (name, img_location, description, price) values ('item', 'http://nuieee.fe.up.pt/img/feup.png', 'viverra dapibus nulla suscipit ligula in lacus curabitur at ipsum ac tellus semper interdum mauris ullamcorper purus sit', 62);
insert into Itens (name, img_location, description, price) values ('item', 'http://nuieee.fe.up.pt/img/feup.png', 'rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus id turpis integer aliquet massa id lobortis convallis tortor', 36);

insert into Sets (itenID) values (21);
insert into Sets (itenID) values (40);
insert into Sets (itenID) values (16);
insert into Sets (itenID) values (23);
insert into Sets (itenID) values (24);
insert into Sets (itenID) values (5);
insert into Sets (itenID) values (11);
insert into Sets (itenID) values (38);
insert into Sets (itenID) values (33);
insert into Sets (itenID) values (27);
insert into Sets (itenID) values (17);
insert into Sets (itenID) values (44);
insert into Sets (itenID) values (33);
insert into Sets (itenID) values (37);
insert into Sets (itenID) values (8);
insert into Sets (itenID) values (7);
insert into Sets (itenID) values (29);
insert into Sets (itenID) values (25);
insert into Sets (itenID) values (30);
insert into Sets (itenID) values (13);
insert into Sets (itenID) values (31);
insert into Sets (itenID) values (37);
insert into Sets (itenID) values (39);
insert into Sets (itenID) values (38);
insert into Sets (itenID) values (50);
insert into Sets (itenID) values (9);
insert into Sets (itenID) values (19);
insert into Sets (itenID) values (6);
insert into Sets (itenID) values (18);
insert into Sets (itenID) values (6);
insert into Sets (itenID) values (2);
insert into Sets (itenID) values (26);
insert into Sets (itenID) values (41);
insert into Sets (itenID) values (37);
insert into Sets (itenID) values (48);
insert into Sets (itenID) values (38);
insert into Sets (itenID) values (40);
insert into Sets (itenID) values (41);
insert into Sets (itenID) values (3);
insert into Sets (itenID) values (37);
insert into Sets (itenID) values (9);
insert into Sets (itenID) values (21);
insert into Sets (itenID) values (24);
insert into Sets (itenID) values (2);
insert into Sets (itenID) values (38);
insert into Sets (itenID) values (4);
insert into Sets (itenID) values (23);
insert into Sets (itenID) values (27);
insert into Sets (itenID) values (34);
insert into Sets (itenID) values (39);













insert into ExerciseSet (setId, exerciseId) values (48, 4);
insert into ExerciseSet (setId, exerciseId) values (48, 11);
insert into ExerciseSet (setId, exerciseId) values (5, 27);
insert into ExerciseSet (setId, exerciseId) values (3, 10);
insert into ExerciseSet (setId, exerciseId) values (33, 10);
insert into ExerciseSet (setId, exerciseId) values (17, 22);
insert into ExerciseSet (setId, exerciseId) values (36, 31);
insert into ExerciseSet (setId, exerciseId) values (34, 14);
insert into ExerciseSet (setId, exerciseId) values (27, 24);
insert into ExerciseSet (setId, exerciseId) values (40, 39);
insert into ExerciseSet (setId, exerciseId) values (24, 14);
insert into ExerciseSet (setId, exerciseId) values (39, 33);
insert into ExerciseSet (setId, exerciseId) values (20, 36);
insert into ExerciseSet (setId, exerciseId) values (4, 25);
insert into ExerciseSet (setId, exerciseId) values (6, 14);
insert into ExerciseSet (setId, exerciseId) values (9, 20);
insert into ExerciseSet (setId, exerciseId) values (16, 11);
insert into ExerciseSet (setId, exerciseId) values (3, 43);
insert into ExerciseSet (setId, exerciseId) values (38, 25);
insert into ExerciseSet (setId, exerciseId) values (2, 18);
insert into ExerciseSet (setId, exerciseId) values (30, 2);
insert into ExerciseSet (setId, exerciseId) values (45, 15);
insert into ExerciseSet (setId, exerciseId) values (29, 33);
insert into ExerciseSet (setId, exerciseId) values (7, 37);
insert into ExerciseSet (setId, exerciseId) values (4, 36);
insert into ExerciseSet (setId, exerciseId) values (4, 36);
insert into ExerciseSet (setId, exerciseId) values (18, 12);
insert into ExerciseSet (setId, exerciseId) values (33, 33);
insert into ExerciseSet (setId, exerciseId) values (17, 18);
insert into ExerciseSet (setId, exerciseId) values (48, 31);
insert into ExerciseSet (setId, exerciseId) values (37, 42);
insert into ExerciseSet (setId, exerciseId) values (28, 10);
insert into ExerciseSet (setId, exerciseId) values (18, 14);
insert into ExerciseSet (setId, exerciseId) values (2, 29);
insert into ExerciseSet (setId, exerciseId) values (47, 11);
insert into ExerciseSet (setId, exerciseId) values (44, 45);
insert into ExerciseSet (setId, exerciseId) values (24, 16);
insert into ExerciseSet (setId, exerciseId) values (21, 44);
insert into ExerciseSet (setId, exerciseId) values (29, 25);
insert into ExerciseSet (setId, exerciseId) values (21, 28);
insert into ExerciseSet (setId, exerciseId) values (45, 49);
insert into ExerciseSet (setId, exerciseId) values (15, 17);
insert into ExerciseSet (setId, exerciseId) values (22, 22);
insert into ExerciseSet (setId, exerciseId) values (26, 12);
insert into ExerciseSet (setId, exerciseId) values (12, 13);
insert into ExerciseSet (setId, exerciseId) values (41, 20);
insert into ExerciseSet (setId, exerciseId) values (7, 36);
insert into ExerciseSet (setId, exerciseId) values (36, 46);
insert into ExerciseSet (setId, exerciseId) values (28, 6);
insert into ExerciseSet (setId, exerciseId) values (32, 41);


















insert into ClassExerciseSet (setId, classId) values (21, 5);
insert into ClassExerciseSet (setId, classId) values (13, 2);
insert into ClassExerciseSet (setId, classId) values (13, 5);
insert into ClassExerciseSet (setId, classId) values (50, 5);
insert into ClassExerciseSet (setId, classId) values (1, 1);
insert into ClassExerciseSet (setId, classId) values (6, 4);
insert into ClassExerciseSet (setId, classId) values (18, 3);
insert into ClassExerciseSet (setId, classId) values (6, 4);
insert into ClassExerciseSet (setId, classId) values (8, 1);
insert into ClassExerciseSet (setId, classId) values (39, 5);
insert into ClassExerciseSet (setId, classId) values (42, 1);
insert into ClassExerciseSet (setId, classId) values (29, 3);
insert into ClassExerciseSet (setId, classId) values (25, 1);
insert into ClassExerciseSet (setId, classId) values (41, 2);
insert into ClassExerciseSet (setId, classId) values (12, 2);
insert into ClassExerciseSet (setId, classId) values (23, 2);
insert into ClassExerciseSet (setId, classId) values (19, 2);
insert into ClassExerciseSet (setId, classId) values (41, 5);
insert into ClassExerciseSet (setId, classId) values (15, 1);
insert into ClassExerciseSet (setId, classId) values (17, 2);
insert into ClassExerciseSet (setId, classId) values (32, 2);
insert into ClassExerciseSet (setId, classId) values (34, 4);
insert into ClassExerciseSet (setId, classId) values (24, 4);
insert into ClassExerciseSet (setId, classId) values (4, 2);
insert into ClassExerciseSet (setId, classId) values (15, 3);
insert into ClassExerciseSet (setId, classId) values (47, 3);
insert into ClassExerciseSet (setId, classId) values (24, 4);
insert into ClassExerciseSet (setId, classId) values (19, 2);
insert into ClassExerciseSet (setId, classId) values (6, 4);
insert into ClassExerciseSet (setId, classId) values (32, 1);
insert into ClassExerciseSet (setId, classId) values (19, 5);
insert into ClassExerciseSet (setId, classId) values (7, 5);
insert into ClassExerciseSet (setId, classId) values (6, 3);
insert into ClassExerciseSet (setId, classId) values (30, 5);
insert into ClassExerciseSet (setId, classId) values (33, 1);
insert into ClassExerciseSet (setId, classId) values (18, 1);
insert into ClassExerciseSet (setId, classId) values (30, 4);
insert into ClassExerciseSet (setId, classId) values (27, 4);
insert into ClassExerciseSet (setId, classId) values (5, 4);
insert into ClassExerciseSet (setId, classId) values (18, 1);
insert into ClassExerciseSet (setId, classId) values (46, 2);
insert into ClassExerciseSet (setId, classId) values (29, 2);
insert into ClassExerciseSet (setId, classId) values (22, 4);
insert into ClassExerciseSet (setId, classId) values (25, 4);
insert into ClassExerciseSet (setId, classId) values (24, 5);
insert into ClassExerciseSet (setId, classId) values (29, 1);
insert into ClassExerciseSet (setId, classId) values (48, 3);
insert into ClassExerciseSet (setId, classId) values (9, 2);
insert into ClassExerciseSet (setId, classId) values (25, 1);
insert into ClassExerciseSet (setId, classId) values (5, 1);


insert into MemberInventory (memberId, itenId) values (19, 31);
insert into MemberInventory (memberId, itenId) values (3, 2);
insert into MemberInventory (memberId, itenId) values (21, 36);
insert into MemberInventory (memberId, itenId) values (1, 48);
insert into MemberInventory (memberId, itenId) values (4, 39);
insert into MemberInventory (memberId, itenId) values (30, 10);
insert into MemberInventory (memberId, itenId) values (32, 40);
insert into MemberInventory (memberId, itenId) values (21, 29);
insert into MemberInventory (memberId, itenId) values (50, 20);
insert into MemberInventory (memberId, itenId) values (25, 10);
insert into MemberInventory (memberId, itenId) values (8, 43);
insert into MemberInventory (memberId, itenId) values (30, 19);
insert into MemberInventory (memberId, itenId) values (14, 33);
insert into MemberInventory (memberId, itenId) values (21, 37);
insert into MemberInventory (memberId, itenId) values (11, 5);
insert into MemberInventory (memberId, itenId) values (8, 48);
insert into MemberInventory (memberId, itenId) values (33, 28);
insert into MemberInventory (memberId, itenId) values (26, 47);
insert into MemberInventory (memberId, itenId) values (28, 28);
insert into MemberInventory (memberId, itenId) values (10, 17);
insert into MemberInventory (memberId, itenId) values (23, 3);
insert into MemberInventory (memberId, itenId) values (39, 44);
insert into MemberInventory (memberId, itenId) values (36, 30);
insert into MemberInventory (memberId, itenId) values (39, 9);
insert into MemberInventory (memberId, itenId) values (48, 28);
insert into MemberInventory (memberId, itenId) values (25, 17);
insert into MemberInventory (memberId, itenId) values (15, 42);
insert into MemberInventory (memberId, itenId) values (44, 47);
insert into MemberInventory (memberId, itenId) values (6, 9);
insert into MemberInventory (memberId, itenId) values (15, 15);
insert into MemberInventory (memberId, itenId) values (50, 33);
insert into MemberInventory (memberId, itenId) values (2, 19);
insert into MemberInventory (memberId, itenId) values (35, 5);
insert into MemberInventory (memberId, itenId) values (40, 31);
insert into MemberInventory (memberId, itenId) values (46, 8);
insert into MemberInventory (memberId, itenId) values (43, 50);
insert into MemberInventory (memberId, itenId) values (9, 7);
insert into MemberInventory (memberId, itenId) values (49, 7);
insert into MemberInventory (memberId, itenId) values (30, 1);
insert into MemberInventory (memberId, itenId) values (21, 47);
insert into MemberInventory (memberId, itenId) values (15, 34);
insert into MemberInventory (memberId, itenId) values (26, 34);
insert into MemberInventory (memberId, itenId) values (16, 12);
insert into MemberInventory (memberId, itenId) values (40, 21);
insert into MemberInventory (memberId, itenId) values (45, 44);
insert into MemberInventory (memberId, itenId) values (24, 41);
insert into MemberInventory (memberId, itenId) values (25, 37);
insert into MemberInventory (memberId, itenId) values (30, 14);
insert into MemberInventory (memberId, itenId) values (22, 11);
insert into MemberInventory (memberId, itenId) values (22, 24);


insert into MemberEvents (memberId, classId, description) values (34, 2, 'vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae duis faucibus accumsan odio');
insert into MemberEvents (memberId, classId, description) values (29, 1, 'integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum sed magna at nunc commodo placerat praesent');
insert into MemberEvents (memberId, classId, description) values (6, 5, 'lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur');
insert into MemberEvents (memberId, classId, description) values (6, 5, 'ultrices posuere cubilia curae duis faucibus accumsan odio curabitur convallis duis consequat dui nec nisi volutpat eleifend donec ut dolor');
insert into MemberEvents (memberId, classId, description) values (2, 1, 'pretium quis lectus suspendisse potenti in eleifend quam a odio in hac habitasse platea dictumst');
insert into MemberEvents (memberId, classId, description) values (16, 5, 'volutpat dui maecenas tristique est et tempus semper est quam pharetra');
insert into MemberEvents (memberId, classId, description) values (35, 5, 'cras in purus eu magna vulputate luctus cum sociis natoque penatibus et magnis dis parturient montes');
insert into MemberEvents (memberId, classId, description) values (40, 1, 'sapien non mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus in sagittis dui');
insert into MemberEvents (memberId, classId, description) values (43, 5, 'non velit nec nisi vulputate nonummy maecenas tincidunt lacus at velit vivamus vel nulla eget eros elementum');
insert into MemberEvents (memberId, classId, description) values (48, 1, 'porttitor lacus at turpis donec posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam');
insert into MemberEvents (memberId, classId, description) values (24, 1, 'mi sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi non quam nec dui luctus');
insert into MemberEvents (memberId, classId, description) values (1, 3, 'in purus eu magna vulputate luctus cum sociis natoque penatibus et magnis dis parturient montes nascetur');
insert into MemberEvents (memberId, classId, description) values (31, 4, 'pellentesque viverra pede ac diam cras pellentesque volutpat dui maecenas tristique est et tempus semper est quam pharetra');
insert into MemberEvents (memberId, classId, description) values (42, 1, 'aliquam sit amet diam in magna bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt eu');
insert into MemberEvents (memberId, classId, description) values (46, 5, 'interdum mauris non ligula pellentesque ultrices phasellus id sapien in sapien iaculis congue vivamus');
insert into MemberEvents (memberId, classId, description) values (29, 4, 'nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede');
insert into MemberEvents (memberId, classId, description) values (36, 5, 'in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum');
insert into MemberEvents (memberId, classId, description) values (42, 2, 'nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices');
insert into MemberEvents (memberId, classId, description) values (49, 2, 'in consequat ut nulla sed accumsan felis ut at dolor quis odio consequat');
insert into MemberEvents (memberId, classId, description) values (23, 1, 'viverra diam vitae quam suspendisse potenti nullam porttitor lacus at turpis');
insert into MemberEvents (memberId, classId, description) values (4, 3, 'habitasse platea dictumst maecenas ut massa quis augue luctus tincidunt nulla mollis molestie lorem quisque ut');
insert into MemberEvents (memberId, classId, description) values (42, 3, 'curabitur convallis duis consequat dui nec nisi volutpat eleifend donec ut dolor');
insert into MemberEvents (memberId, classId, description) values (26, 3, 'consequat morbi a ipsum integer a nibh in quis justo maecenas rhoncus aliquam');
insert into MemberEvents (memberId, classId, description) values (1, 5, 'sem praesent id massa id nisl venenatis lacinia aenean sit amet justo morbi ut');
insert into MemberEvents (memberId, classId, description) values (16, 4, 'condimentum id luctus nec molestie sed justo pellentesque viverra pede ac');
insert into MemberEvents (memberId, classId, description) values (27, 1, 'sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus');
insert into MemberEvents (memberId, classId, description) values (6, 2, 'curae nulla dapibus dolor vel est donec odio justo sollicitudin');
insert into MemberEvents (memberId, classId, description) values (22, 3, 'amet nunc viverra dapibus nulla suscipit ligula in lacus curabitur at');
insert into MemberEvents (memberId, classId, description) values (40, 1, 'nunc purus phasellus in felis donec semper sapien a libero nam');
insert into MemberEvents (memberId, classId, description) values (9, 4, 'diam cras pellentesque volutpat dui maecenas tristique est et tempus semper est');
insert into MemberEvents (memberId, classId, description) values (33, 4, 'massa id lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi');
insert into MemberEvents (memberId, classId, description) values (31, 1, 'cubilia curae duis faucibus accumsan odio curabitur convallis duis consequat dui nec nisi volutpat eleifend donec');
insert into MemberEvents (memberId, classId, description) values (43, 3, 'tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque duis');
insert into MemberEvents (memberId, classId, description) values (14, 5, 'venenatis turpis enim blandit mi in porttitor pede justo eu massa donec dapibus duis');
insert into MemberEvents (memberId, classId, description) values (27, 2, 'habitasse platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt');
insert into MemberEvents (memberId, classId, description) values (46, 2, 'nibh in hac habitasse platea dictumst aliquam augue quam sollicitudin');
insert into MemberEvents (memberId, classId, description) values (10, 2, 'cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum');
insert into MemberEvents (memberId, classId, description) values (29, 3, 'nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est lacinia');
insert into MemberEvents (memberId, classId, description) values (28, 5, 'sed justo pellentesque viverra pede ac diam cras pellentesque volutpat dui maecenas tristique est et tempus semper est quam pharetra');
insert into MemberEvents (memberId, classId, description) values (12, 4, 'vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet diam in magna bibendum imperdiet nullam orci');
insert into MemberEvents (memberId, classId, description) values (5, 5, 'arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula');
insert into MemberEvents (memberId, classId, description) values (32, 2, 'convallis eget eleifend luctus ultricies eu nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in');
insert into MemberEvents (memberId, classId, description) values (20, 1, 'cursus vestibulum proin eu mi nulla ac enim in tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae');
insert into MemberEvents (memberId, classId, description) values (10, 2, 'ligula nec sem duis aliquam convallis nunc proin at turpis a pede posuere');
insert into MemberEvents (memberId, classId, description) values (6, 4, 'ante vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae duis faucibus accumsan odio');
insert into MemberEvents (memberId, classId, description) values (38, 3, 'lobortis est phasellus sit amet erat nulla tempus vivamus in felis eu sapien cursus');
insert into MemberEvents (memberId, classId, description) values (47, 5, 'felis fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui');
insert into MemberEvents (memberId, classId, description) values (20, 3, 'primis in faucibus orci luctus et ultrices posuere cubilia curae duis');
insert into MemberEvents (memberId, classId, description) values (40, 1, 'praesent id massa id nisl venenatis lacinia aenean sit amet justo morbi ut odio');
insert into MemberEvents (memberId, classId, description) values (33, 2, 'suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas metus aenean fermentum donec ut mauris eget massa');


insert into Avatar (id, name, img_location) values (1, 'Koh Gen Do Aqua Foundation', 'https://weather.com/sit/amet/consectetuer.aspx?volutpat=vestibulum&eleifend=ac&donec=est&ut=lacinia&dolor=nisi&morbi=venenatis&vel=tristique&lectus=fusce&in=congue&quam=diam&fringilla=id&rhoncus=ornare&mauris=imperdiet&enim=sapien&leo=urna&rhoncus=pretium&sed=nisl&vestibulum=ut&sit=volutpat&amet=sapien&cursus=arcu&id=sed&turpis=augue&integer=aliquam&aliquet=erat&massa=volutpat&id=in&lobortis=congue&convallis=etiam&tortor=justo&risus=etiam&dapibus=pretium&augue=iaculis');
insert into Avatar (id, name, img_location) values (2, 'Clonidine transdermal system', 'https://bbb.org/potenti/cras/in/purus/eu/magna.json?felis=platea&ut=dictumst&at=aliquam&dolor=augue&quis=quam&odio=sollicitudin&consequat=vitae&varius=consectetuer&integer=eget&ac=rutrum&leo=at&pellentesque=lorem&ultrices=integer&mattis=tincidunt&odio=ante&donec=vel&vitae=ipsum&nisi=praesent&nam=blandit&ultrices=lacinia&libero=erat&non=vestibulum&mattis=sed&pulvinar=magna&nulla=at&pede=nunc&ullamcorper=commodo&augue=placerat&a=praesent&suscipit=blandit&nulla=nam&elit=nulla&ac=integer&nulla=pede&sed=justo&vel=lacinia&enim=eget');
insert into Avatar (id, name, img_location) values (3, 'Sulfur 30 Special Order', 'http://exblog.jp/leo/odio/condimentum.aspx?parturient=non&montes=mattis&nascetur=pulvinar&ridiculus=nulla&mus=pede&vivamus=ullamcorper');
insert into Avatar (id, name, img_location) values (4, 'Menopause', 'http://wordpress.com/porttitor/id/consequat/in.js?ac=rhoncus&est=sed&lacinia=vestibulum&nisi=sit&venenatis=amet&tristique=cursus&fusce=id&congue=turpis&diam=integer&id=aliquet&ornare=massa&imperdiet=id&sapien=lobortis&urna=convallis&pretium=tortor&nisl=risus&ut=dapibus&volutpat=augue&sapien=vel&arcu=accumsan&sed=tellus&augue=nisi&aliquam=eu&erat=orci&volutpat=mauris&in=lacinia&congue=sapien&etiam=quis&justo=libero&etiam=nullam&pretium=sit&iaculis=amet&justo=turpis&in=elementum&hac=ligula&habitasse=vehicula&platea=consequat&dictumst=morbi&etiam=a&faucibus=ipsum&cursus=integer&urna=a&ut=nibh&tellus=in&nulla=quis&ut=justo&erat=maecenas&id=rhoncus&mauris=aliquam&vulputate=lacus&elementum=morbi&nullam=quis&varius=tortor&nulla=id&facilisi=nulla&cras=ultrices&non=aliquet&velit=maecenas&nec=leo&nisi=odio&vulputate=condimentum&nonummy=id&maecenas=luctus&tincidunt=nec&lacus=molestie&at=sed&velit=justo&vivamus=pellentesque&vel=viverra&nulla=pede&eget=ac&eros=diam&elementum=cras&pellentesque=pellentesque&quisque=volutpat&porta=dui&volutpat=maecenas&erat=tristique&quisque=est&erat=et&eros=tempus&viverra=semper&eget=est&congue=quam&eget=pharetra&semper=magna&rutrum=ac&nulla=consequat&nunc=metus&purus=sapien&phasellus=ut&in=nunc');
insert into Avatar (id, name, img_location) values (5, 'Morphine sulfate', 'http://stumbleupon.com/in/quam.aspx?at=metus&dolor=aenean&quis=fermentum&odio=donec&consequat=ut&varius=mauris&integer=eget&ac=massa');
insert into Avatar (id, name, img_location) values (6, 'mycophenolate mofetil', 'http://who.int/malesuada/in/imperdiet/et/commodo/vulputate/justo.js?ut=diam&nunc=erat&vestibulum=fermentum&ante=justo&ipsum=nec&primis=condimentum&in=neque&faucibus=sapien&orci=placerat&luctus=ante&et=nulla&ultrices=justo&posuere=aliquam&cubilia=quis&curae=turpis&mauris=eget&viverra=elit&diam=sodales&vitae=scelerisque&quam=mauris&suspendisse=sit&potenti=amet&nullam=eros&porttitor=suspendisse&lacus=accumsan&at=tortor&turpis=quis&donec=turpis&posuere=sed&metus=ante&vitae=vivamus&ipsum=tortor&aliquam=duis&non=mattis&mauris=egestas&morbi=metus&non=aenean&lectus=fermentum&aliquam=donec&sit=ut&amet=mauris&diam=eget&in=massa&magna=tempor&bibendum=convallis&imperdiet=nulla&nullam=neque&orci=libero&pede=convallis&venenatis=eget&non=eleifend&sodales=luctus&sed=ultricies&tincidunt=eu&eu=nibh&felis=quisque&fusce=id&posuere=justo&felis=sit&sed=amet&lacus=sapien&morbi=dignissim&sem=vestibulum&mauris=vestibulum&laoreet=ante&ut=ipsum&rhoncus=primis&aliquet=in&pulvinar=faucibus&sed=orci&nisl=luctus&nunc=et&rhoncus=ultrices&dui=posuere&vel=cubilia&sem=curae&sed=nulla');
insert into Avatar (id, name, img_location) values (7, 'TobraDex', 'http://51.la/nulla/justo/aliquam/quis/turpis.json?est=aenean&quam=fermentum&pharetra=donec&magna=ut&ac=mauris&consequat=eget&metus=massa&sapien=tempor&ut=convallis&nunc=nulla&vestibulum=neque&ante=libero&ipsum=convallis&primis=eget&in=eleifend&faucibus=luctus&orci=ultricies&luctus=eu&et=nibh&ultrices=quisque&posuere=id&cubilia=justo&curae=sit&mauris=amet&viverra=sapien&diam=dignissim&vitae=vestibulum&quam=vestibulum&suspendisse=ante&potenti=ipsum&nullam=primis&porttitor=in&lacus=faucibus&at=orci&turpis=luctus&donec=et&posuere=ultrices&metus=posuere&vitae=cubilia&ipsum=curae&aliquam=nulla&non=dapibus&mauris=dolor&morbi=vel&non=est&lectus=donec&aliquam=odio&sit=justo&amet=sollicitudin&diam=ut&in=suscipit&magna=a&bibendum=feugiat&imperdiet=et&nullam=eros&orci=vestibulum&pede=ac&venenatis=est&non=lacinia&sodales=nisi&sed=venenatis&tincidunt=tristique&eu=fusce&felis=congue&fusce=diam&posuere=id&felis=ornare&sed=imperdiet&lacus=sapien&morbi=urna&sem=pretium&mauris=nisl&laoreet=ut&ut=volutpat&rhoncus=sapien&aliquet=arcu&pulvinar=sed&sed=augue&nisl=aliquam&nunc=erat&rhoncus=volutpat&dui=in&vel=congue&sem=etiam&sed=justo&sagittis=etiam&nam=pretium&congue=iaculis&risus=justo&semper=in&porta=hac&volutpat=habitasse');
insert into Avatar (id, name, img_location) values (8, 'Degree', 'http://dropbox.com/rhoncus/sed/vestibulum.aspx?pellentesque=libero');
insert into Avatar (id, name, img_location) values (9, 'Severe Cold and Flu', 'http://4shared.com/lacinia/erat/vestibulum/sed/magna/at/nunc.html?aliquam=sapien&convallis=arcu&nunc=sed&proin=augue&at=aliquam&turpis=erat&a=volutpat&pede=in&posuere=congue&nonummy=etiam&integer=justo&non=etiam&velit=pretium&donec=iaculis&diam=justo&neque=in&vestibulum=hac&eget=habitasse&vulputate=platea&ut=dictumst&ultrices=etiam&vel=faucibus&augue=cursus&vestibulum=urna&ante=ut&ipsum=tellus&primis=nulla&in=ut&faucibus=erat&orci=id&luctus=mauris&et=vulputate&ultrices=elementum&posuere=nullam&cubilia=varius&curae=nulla&donec=facilisi&pharetra=cras&magna=non&vestibulum=velit&aliquet=nec&ultrices=nisi&erat=vulputate&tortor=nonummy&sollicitudin=maecenas&mi=tincidunt&sit=lacus&amet=at&lobortis=velit&sapien=vivamus&sapien=vel&non=nulla&mi=eget&integer=eros&ac=elementum&neque=pellentesque&duis=quisque&bibendum=porta&morbi=volutpat&non=erat&quam=quisque&nec=erat&dui=eros&luctus=viverra&rutrum=eget&nulla=congue&tellus=eget&in=semper&sagittis=rutrum&dui=nulla&vel=nunc&nisl=purus&duis=phasellus&ac=in&nibh=felis&fusce=donec&lacus=semper');
insert into Avatar (id, name, img_location) values (10, 'CLE DE PEAU BEAUTE REFINING FLUID FOUNDATION', 'http://php.net/sit/amet/sapien/dignissim/vestibulum/vestibulum/ante.html?cursus=luctus&urna=et&ut=ultrices&tellus=posuere&nulla=cubilia&ut=curae&erat=mauris&id=viverra&mauris=diam&vulputate=vitae&elementum=quam&nullam=suspendisse&varius=potenti&nulla=nullam&facilisi=porttitor');


INSERT OR IGNORE into  AvatarUser (avatarId, memberId) values (2, 1);
INSERT OR IGNORE into  AvatarUser (avatarId, memberId) values (5, 2);
INSERT OR IGNORE into  AvatarUser (avatarId, memberId) values (2, 3);
INSERT OR IGNORE into  AvatarUser (avatarId, memberId) values (4, 4);
INSERT OR IGNORE into  AvatarUser (avatarId, memberId) values (10, 5);
INSERT OR IGNORE into  AvatarUser (avatarId, memberId) values (5, 6);
INSERT OR IGNORE into  AvatarUser (avatarId, memberId) values (6, 7);
INSERT OR IGNORE into  AvatarUser (avatarId, memberId) values (1, 8);
INSERT OR IGNORE into  AvatarUser (avatarId, memberId) values (8, 9);
INSERT OR IGNORE into  AvatarUser (avatarId, memberId) values (5, 10);
INSERT OR IGNORE into  AvatarUser (avatarId, memberId) values (6, 11);
INSERT OR IGNORE into  AvatarUser (avatarId, memberId) values (1, 12);
INSERT OR IGNORE into  AvatarUser (avatarId, memberId) values (8, 13);
INSERT OR IGNORE into  AvatarUser (avatarId, memberId) values (9, 14);
INSERT OR IGNORE into  AvatarUser (avatarId, memberId) values (3, 15);
INSERT OR IGNORE into  AvatarUser (avatarId, memberId) values (4, 16);
INSERT OR IGNORE into  AvatarUser (avatarId, memberId) values (3, 17);
INSERT OR IGNORE into  AvatarUser (avatarId, memberId) values (6, 18);
INSERT OR IGNORE into  AvatarUser (avatarId, memberId) values (3, 19);
INSERT OR IGNORE into  AvatarUser (avatarId, memberId) values (1, 20);
INSERT OR IGNORE into  AvatarUser (avatarId, memberId) values (9, 21);
INSERT OR IGNORE into  AvatarUser (avatarId, memberId) values (3, 22);
INSERT OR IGNORE into  AvatarUser (avatarId, memberId) values (8, 23);
INSERT OR IGNORE into  AvatarUser (avatarId, memberId) values (1, 24);
INSERT OR IGNORE into  AvatarUser (avatarId, memberId) values (4, 25);
INSERT OR IGNORE into  AvatarUser (avatarId, memberId) values (6, 26);
INSERT OR IGNORE into  AvatarUser (avatarId, memberId) values (5, 27);
INSERT OR IGNORE into  AvatarUser (avatarId, memberId) values (9, 28);
INSERT OR IGNORE into  AvatarUser (avatarId, memberId) values (7, 29);
INSERT OR IGNORE into  AvatarUser (avatarId, memberId) values (10, 30);
INSERT OR IGNORE into  AvatarUser (avatarId, memberId) values (9, 31);
INSERT OR IGNORE into  AvatarUser (avatarId, memberId) values (1, 32);
INSERT OR IGNORE into  AvatarUser (avatarId, memberId) values (6, 33);
INSERT OR IGNORE into  AvatarUser (avatarId, memberId) values (10, 34);
INSERT OR IGNORE into  AvatarUser (avatarId, memberId) values (10, 35);
INSERT OR IGNORE into  AvatarUser (avatarId, memberId) values (10, 36);
INSERT OR IGNORE into  AvatarUser (avatarId, memberId) values (2, 37);
INSERT OR IGNORE into  AvatarUser (avatarId, memberId) values (7, 38);
INSERT OR IGNORE into  AvatarUser (avatarId, memberId) values (2, 39);
INSERT OR IGNORE into  AvatarUser (avatarId, memberId) values (5, 40);
INSERT OR IGNORE into  AvatarUser (avatarId, memberId) values (8, 41);
INSERT OR IGNORE into  AvatarUser (avatarId, memberId) values (9, 42);
INSERT OR IGNORE into  AvatarUser (avatarId, memberId) values (9, 43);
INSERT OR IGNORE into  AvatarUser (avatarId, memberId) values (9, 44);
INSERT OR IGNORE into  AvatarUser (avatarId, memberId) values (10, 45);
INSERT OR IGNORE into  AvatarUser (avatarId, memberId) values (1, 46);
INSERT OR IGNORE into  AvatarUser (avatarId, memberId) values (7, 47);
INSERT OR IGNORE into  AvatarUser (avatarId, memberId) values (3, 48);
INSERT OR IGNORE into  AvatarUser (avatarId, memberId) values (1, 49);
INSERT OR IGNORE into  AvatarUser (avatarId, memberId) values (5, 50);
