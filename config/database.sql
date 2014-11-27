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
  usertype VARCHAR
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

CREATE TABLE ExerciseSet(
id INTEGER PRIMARY KEY AUTOINCREMENT,
exerciseId INTEGER REFERENCES Exercises(id),
itenID INTEGER REFERENCES Itens(id)
);

CREATE TABLE ClassExerciseSet(
setID INTEGER REFERENCES ExerciseSet(id),
classId INTEGER REFERENCES Classes(id)
);

CREATE TABLE Itens(
id INTEGER PRIMARY KEY AUTOINCREMENT,
name VARCHAR,
img_location VARCHAR,
description VARCHAR
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
  UPDATE ExerciseSet SET itenId = null WHERE itenID = old.id;
  DELETE FROM MemberInventory WHERE itenId = old.id;
END;

/*
CREATE TRIGGER on_exercises_delete BEFORE DELETE ON Exercises BEGIN
	DELETE FROM ExerciseOptions WHERE exerciseId = old.id;
	DELETE FROM ExerciseRightAnswer WHERE exerciseId = old.id;
	DELETE FROM ExerciseSet WHERE exerciseId = old.id;
END;*/

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

insert into ExerciseOptions (exerciseId, description) values (41, 'aliquet massa id lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris');
insert into ExerciseOptions (exerciseId, description) values (11, 'eget congue eget semper rutrum nulla nunc purus phasellus in felis donec semper sapien a libero');
insert into ExerciseOptions (exerciseId, description) values (37, 'vel sem sed sagittis nam congue risus semper porta volutpat quam pede lobortis ligula');
insert into ExerciseOptions (exerciseId, description) values (1, 'et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus');
insert into ExerciseOptions (exerciseId, description) values (14, 'id ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat');
insert into ExerciseOptions (exerciseId, description) values (46, 'orci vehicula condimentum curabitur in libero ut massa volutpat convallis morbi odio odio elementum eu');
insert into ExerciseOptions (exerciseId, description) values (18, 'faucibus cursus urna ut tellus nulla ut erat id mauris vulputate elementum nullam varius nulla facilisi cras');
insert into ExerciseOptions (exerciseId, description) values (1, 'leo odio porttitor id consequat in consequat ut nulla sed accumsan felis ut at dolor quis');
insert into ExerciseOptions (exerciseId, description) values (9, 'at turpis donec posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet');
insert into ExerciseOptions (exerciseId, description) values (19, 'primis in faucibus orci luctus et ultrices posuere cubilia curae duis faucibus');
insert into ExerciseOptions (exerciseId, description) values (43, 'praesent blandit lacinia erat vestibulum sed magna at nunc commodo placerat praesent');
insert into ExerciseOptions (exerciseId, description) values (49, 'nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum');
insert into ExerciseOptions (exerciseId, description) values (13, 'congue eget semper rutrum nulla nunc purus phasellus in felis donec semper sapien a');
insert into ExerciseOptions (exerciseId, description) values (6, 'quisque erat eros viverra eget congue eget semper rutrum nulla nunc purus phasellus');
insert into ExerciseOptions (exerciseId, description) values (30, 'nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in');
insert into ExerciseOptions (exerciseId, description) values (50, 'quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl duis ac nibh fusce lacus purus aliquet at');
insert into ExerciseOptions (exerciseId, description) values (1, 'dui luctus rutrum nulla tellus in sagittis dui vel nisl duis ac nibh fusce lacus purus aliquet at');
insert into ExerciseOptions (exerciseId, description) values (16, 'montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent');
insert into ExerciseOptions (exerciseId, description) values (44, 'interdum eu tincidunt in leo maecenas pulvinar lobortis est phasellus sit amet erat nulla tempus vivamus');
insert into ExerciseOptions (exerciseId, description) values (40, 'risus semper porta volutpat quam pede lobortis ligula sit amet');
insert into ExerciseOptions (exerciseId, description) values (14, 'suscipit a feugiat et eros vestibulum ac est lacinia nisi venenatis tristique');
insert into ExerciseOptions (exerciseId, description) values (19, 'mattis pulvinar nulla pede ullamcorper augue a suscipit nulla elit ac nulla sed vel enim');
insert into ExerciseOptions (exerciseId, description) values (7, 'sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas metus aenean');
insert into ExerciseOptions (exerciseId, description) values (23, 'volutpat sapien arcu sed augue aliquam erat volutpat in congue');
insert into ExerciseOptions (exerciseId, description) values (46, 'commodo placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt');
insert into ExerciseOptions (exerciseId, description) values (43, 'nulla ultrices aliquet maecenas leo odio condimentum id luctus nec molestie sed');
insert into ExerciseOptions (exerciseId, description) values (19, 'mattis pulvinar nulla pede ullamcorper augue a suscipit nulla elit ac nulla sed vel enim sit amet nunc viverra');
insert into ExerciseOptions (exerciseId, description) values (32, 'eget nunc donec quis orci eget orci vehicula condimentum curabitur in');
insert into ExerciseOptions (exerciseId, description) values (16, 'blandit mi in porttitor pede justo eu massa donec dapibus duis at velit eu est congue elementum in');
insert into ExerciseOptions (exerciseId, description) values (24, 'convallis duis consequat dui nec nisi volutpat eleifend donec ut dolor');
insert into ExerciseOptions (exerciseId, description) values (49, 'lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero');
insert into ExerciseOptions (exerciseId, description) values (42, 'nulla nunc purus phasellus in felis donec semper sapien a libero nam dui proin leo odio porttitor id consequat');
insert into ExerciseOptions (exerciseId, description) values (29, 'pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in');
insert into ExerciseOptions (exerciseId, description) values (13, 'mi sit amet lobortis sapien sapien non mi integer ac neque duis');
insert into ExerciseOptions (exerciseId, description) values (40, 'felis ut at dolor quis odio consequat varius integer ac leo pellentesque');
insert into ExerciseOptions (exerciseId, description) values (1, 'sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi non quam nec dui');
insert into ExerciseOptions (exerciseId, description) values (50, 'mattis odio donec vitae nisi nam ultrices libero non mattis pulvinar nulla pede ullamcorper augue a suscipit nulla elit ac');
insert into ExerciseOptions (exerciseId, description) values (36, 'donec posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet diam in magna bibendum imperdiet nullam');
insert into ExerciseOptions (exerciseId, description) values (7, 'turpis integer aliquet massa id lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia');
insert into ExerciseOptions (exerciseId, description) values (11, 'orci pede venenatis non sodales sed tincidunt eu felis fusce');
insert into ExerciseOptions (exerciseId, description) values (41, 'libero ut massa volutpat convallis morbi odio odio elementum eu interdum eu tincidunt in leo maecenas pulvinar lobortis est');
insert into ExerciseOptions (exerciseId, description) values (40, 'nulla sed vel enim sit amet nunc viverra dapibus nulla suscipit ligula in lacus');
insert into ExerciseOptions (exerciseId, description) values (12, 'lorem ipsum dolor sit amet consectetuer adipiscing elit proin risus praesent lectus vestibulum quam sapien varius');
insert into ExerciseOptions (exerciseId, description) values (6, 'nulla mollis molestie lorem quisque ut erat curabitur gravida nisi');
insert into ExerciseOptions (exerciseId, description) values (18, 'est quam pharetra magna ac consequat metus sapien ut nunc vestibulum ante ipsum primis in faucibus');
insert into ExerciseOptions (exerciseId, description) values (15, 'volutpat eleifend donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet');
insert into ExerciseOptions (exerciseId, description) values (20, 'luctus ultricies eu nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum');
insert into ExerciseOptions (exerciseId, description) values (37, 'interdum venenatis turpis enim blandit mi in porttitor pede justo eu massa donec dapibus duis at velit eu');
insert into ExerciseOptions (exerciseId, description) values (50, 'eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium');
insert into ExerciseOptions (exerciseId, description) values (6, 'sed augue aliquam erat volutpat in congue etiam justo etiam pretium');


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


insert into Itens (name, img_location, description) values ('Barium Sulfate', 'https://ebay.co.uk/leo/rhoncus/sed.js?libero=parturient&nam=montes&dui=nascetur&proin=ridiculus&leo=mus&odio=etiam&porttitor=vel&id=augue&consequat=vestibulum&in=rutrum&consequat=rutrum&ut=neque&nulla=aenean&sed=auctor&accumsan=gravida&felis=sem&ut=praesent&at=id&dolor=massa&quis=id&odio=nisl&consequat=venenatis&varius=lacinia&integer=aenean&ac=sit&leo=amet&pellentesque=justo&ultrices=morbi&mattis=ut&odio=odio&donec=cras&vitae=mi&nisi=pede&nam=malesuada&ultrices=in&libero=imperdiet&non=et&mattis=commodo&pulvinar=vulputate&nulla=justo&pede=in&ullamcorper=blandit&augue=ultrices&a=enim&suscipit=lorem&nulla=ipsum&elit=dolor&ac=sit&nulla=amet&sed=consectetuer&vel=adipiscing', 'justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat id');
insert into Itens (name, img_location, description) values ('DOCUSATE SODIUM', 'http://vimeo.com/at/turpis/donec/posuere/metus/vitae.xml?montes=vestibulum&nascetur=ante&ridiculus=ipsum&mus=primis&vivamus=in&vestibulum=faucibus&sagittis=orci&sapien=luctus&cum=et&sociis=ultrices&natoque=posuere&penatibus=cubilia&et=curae&magnis=nulla&dis=dapibus&parturient=dolor&montes=vel&nascetur=est&ridiculus=donec&mus=odio&etiam=justo&vel=sollicitudin&augue=ut&vestibulum=suscipit&rutrum=a&rutrum=feugiat&neque=et&aenean=eros&auctor=vestibulum&gravida=ac&sem=est&praesent=lacinia&id=nisi&massa=venenatis&id=tristique&nisl=fusce&venenatis=congue&lacinia=diam&aenean=id&sit=ornare&amet=imperdiet&justo=sapien&morbi=urna&ut=pretium&odio=nisl&cras=ut&mi=volutpat&pede=sapien&malesuada=arcu&in=sed&imperdiet=augue&et=aliquam&commodo=erat', 'duis bibendum morbi non quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl duis ac');
insert into Itens (name, img_location, description) values ('TELMISARTAN', 'https://over-blog.com/id/consequat/in/consequat.html?sapien=pharetra&varius=magna&ut=vestibulum&blandit=aliquet&non=ultrices&interdum=erat&in=tortor&ante=sollicitudin&vestibulum=mi&ante=sit&ipsum=amet&primis=lobortis&in=sapien&faucibus=sapien&orci=non&luctus=mi&et=integer&ultrices=ac&posuere=neque&cubilia=duis&curae=bibendum&duis=morbi&faucibus=non&accumsan=quam&odio=nec&curabitur=dui&convallis=luctus&duis=rutrum&consequat=nulla&dui=tellus&nec=in&nisi=sagittis', 'et magnis dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum neque');
insert into Itens (name, img_location, description) values ('norgestimate and ethinyl estradiol', 'http://weebly.com/justo/morbi/ut/odio/cras/mi/pede.jsp?eget=sem&elit=praesent&sodales=id&scelerisque=massa&mauris=id&sit=nisl', 'congue etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus');
insert into Itens (name, img_location, description) values ('Western Juniper', 'http://wsj.com/pulvinar/sed/nisl.html?sociis=magna&natoque=bibendum&penatibus=imperdiet&et=nullam&magnis=orci&dis=pede&parturient=venenatis&montes=non&nascetur=sodales&ridiculus=sed&mus=tincidunt&vivamus=eu&vestibulum=felis&sagittis=fusce&sapien=posuere&cum=felis&sociis=sed&natoque=lacus&penatibus=morbi&et=sem&magnis=mauris&dis=laoreet&parturient=ut&montes=rhoncus&nascetur=aliquet&ridiculus=pulvinar&mus=sed&etiam=nisl&vel=nunc&augue=rhoncus&vestibulum=dui&rutrum=vel&rutrum=sem&neque=sed&aenean=sagittis&auctor=nam&gravida=congue&sem=risus&praesent=semper&id=porta&massa=volutpat&id=quam&nisl=pede&venenatis=lobortis&lacinia=ligula&aenean=sit&sit=amet&amet=eleifend&justo=pede&morbi=libero&ut=quis&odio=orci&cras=nullam&mi=molestie&pede=nibh&malesuada=in&in=lectus&imperdiet=pellentesque&et=at&commodo=nulla&vulputate=suspendisse&justo=potenti&in=cras&blandit=in&ultrices=purus&enim=eu&lorem=magna&ipsum=vulputate&dolor=luctus&sit=cum&amet=sociis&consectetuer=natoque&adipiscing=penatibus', 'mollis molestie lorem quisque ut erat curabitur gravida nisi at nibh in hac habitasse');
insert into Itens (name, img_location, description) values ('STRYCHNOS NUX-VOMICA SEED', 'https://who.int/vulputate/elementum/nullam/varius/nulla/facilisi.html?suspendisse=ante&ornare=vivamus&consequat=tortor&lectus=duis&in=mattis&est=egestas&risus=metus&auctor=aenean&sed=fermentum&tristique=donec&in=ut&tempus=mauris&sit=eget&amet=massa&sem=tempor&fusce=convallis&consequat=nulla&nulla=neque&nisl=libero&nunc=convallis&nisl=eget&duis=eleifend&bibendum=luctus&felis=ultricies&sed=eu&interdum=nibh&venenatis=quisque&turpis=id&enim=justo&blandit=sit&mi=amet&in=sapien&porttitor=dignissim&pede=vestibulum&justo=vestibulum&eu=ante&massa=ipsum&donec=primis&dapibus=in&duis=faucibus&at=orci&velit=luctus&eu=et&est=ultrices&congue=posuere&elementum=cubilia&in=curae&hac=nulla&habitasse=dapibus&platea=dolor&dictumst=vel', 'ultricies eu nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum ante ipsum');
insert into Itens (name, img_location, description) values ('Aluminum zirconium tetrachlorohydrex gly', 'http://hatena.ne.jp/nibh/in/hac/habitasse/platea.js?non=magna&ligula=vulputate&pellentesque=luctus&ultrices=cum&phasellus=sociis&id=natoque&sapien=penatibus&in=et&sapien=magnis&iaculis=dis&congue=parturient&vivamus=montes&metus=nascetur&arcu=ridiculus&adipiscing=mus&molestie=vivamus&hendrerit=vestibulum&at=sagittis&vulputate=sapien&vitae=cum&nisl=sociis&aenean=natoque&lectus=penatibus&pellentesque=et&eget=magnis&nunc=dis&donec=parturient&quis=montes&orci=nascetur&eget=ridiculus&orci=mus&vehicula=etiam&condimentum=vel&curabitur=augue&in=vestibulum&libero=rutrum&ut=rutrum&massa=neque&volutpat=aenean&convallis=auctor&morbi=gravida&odio=sem&odio=praesent&elementum=id&eu=massa&interdum=id&eu=nisl&tincidunt=venenatis&in=lacinia&leo=aenean&maecenas=sit&pulvinar=amet&lobortis=justo&est=morbi&phasellus=ut', 'consequat dui nec nisi volutpat eleifend donec ut dolor morbi vel lectus in quam');
insert into Itens (name, img_location, description) values ('Miconazole nitrate', 'http://smugmug.com/nunc/vestibulum/ante/ipsum.html?vestibulum=ante&ante=vivamus&ipsum=tortor&primis=duis&in=mattis&faucibus=egestas&orci=metus&luctus=aenean&et=fermentum&ultrices=donec&posuere=ut&cubilia=mauris&curae=eget&nulla=massa&dapibus=tempor&dolor=convallis&vel=nulla&est=neque&donec=libero&odio=convallis&justo=eget', 'sed justo pellentesque viverra pede ac diam cras pellentesque volutpat dui maecenas tristique est');
insert into Itens (name, img_location, description) values ('Salicylic Acid', 'https://cmu.edu/duis/consequat/dui.jpg?vestibulum=diam&ante=in&ipsum=magna&primis=bibendum&in=imperdiet&faucibus=nullam&orci=orci&luctus=pede&et=venenatis&ultrices=non&posuere=sodales&cubilia=sed&curae=tincidunt&donec=eu&pharetra=felis&magna=fusce&vestibulum=posuere&aliquet=felis&ultrices=sed&erat=lacus&tortor=morbi&sollicitudin=sem&mi=mauris&sit=laoreet&amet=ut&lobortis=rhoncus&sapien=aliquet&sapien=pulvinar&non=sed&mi=nisl&integer=nunc&ac=rhoncus&neque=dui&duis=vel&bibendum=sem&morbi=sed&non=sagittis&quam=nam&nec=congue&dui=risus&luctus=semper&rutrum=porta&nulla=volutpat&tellus=quam&in=pede&sagittis=lobortis&dui=ligula&vel=sit&nisl=amet&duis=eleifend&ac=pede&nibh=libero&fusce=quis&lacus=orci&purus=nullam&aliquet=molestie&at=nibh&feugiat=in&non=lectus&pretium=pellentesque&quis=at&lectus=nulla&suspendisse=suspendisse&potenti=potenti&in=cras&eleifend=in&quam=purus&a=eu&odio=magna&in=vulputate', 'enim lorem ipsum dolor sit amet consectetuer adipiscing elit proin interdum mauris non ligula pellentesque ultrices phasellus id sapien');
insert into Itens (name, img_location, description) values ('Magesium Citrate', 'https://mozilla.org/vel/nisl/duis.png?mauris=enim&enim=leo&leo=rhoncus&rhoncus=sed&sed=vestibulum&vestibulum=sit&sit=amet&amet=cursus', 'consequat dui nec nisi volutpat eleifend donec ut dolor morbi vel lectus');
insert into Itens (name, img_location, description) values ('EUCALYPTOL, MENTHOL, METHYL SALICYLATE, THYMOL', 'http://facebook.com/lobortis/est/phasellus/sit/amet/erat/nulla.json?et=dis&eros=parturient&vestibulum=montes&ac=nascetur&est=ridiculus&lacinia=mus&nisi=vivamus&venenatis=vestibulum&tristique=sagittis&fusce=sapien&congue=cum&diam=sociis&id=natoque&ornare=penatibus&imperdiet=et&sapien=magnis&urna=dis&pretium=parturient&nisl=montes&ut=nascetur&volutpat=ridiculus&sapien=mus&arcu=etiam&sed=vel&augue=augue&aliquam=vestibulum&erat=rutrum&volutpat=rutrum&in=neque&congue=aenean&etiam=auctor&justo=gravida&etiam=sem&pretium=praesent&iaculis=id&justo=massa&in=id&hac=nisl&habitasse=venenatis&platea=lacinia&dictumst=aenean&etiam=sit&faucibus=amet&cursus=justo&urna=morbi&ut=ut&tellus=odio&nulla=cras&ut=mi&erat=pede&id=malesuada&mauris=in&vulputate=imperdiet&elementum=et&nullam=commodo&varius=vulputate&nulla=justo&facilisi=in&cras=blandit&non=ultrices&velit=enim&nec=lorem&nisi=ipsum&vulputate=dolor&nonummy=sit&maecenas=amet&tincidunt=consectetuer&lacus=adipiscing&at=elit&velit=proin&vivamus=interdum&vel=mauris&nulla=non&eget=ligula&eros=pellentesque&elementum=ultrices&pellentesque=phasellus&quisque=id&porta=sapien&volutpat=in&erat=sapien&quisque=iaculis&erat=congue&eros=vivamus&viverra=metus', 'porttitor id consequat in consequat ut nulla sed accumsan felis ut at dolor quis odio');
insert into Itens (name, img_location, description) values ('Morphine sulfate', 'https://moonfruit.com/nunc.js?viverra=bibendum&pede=morbi&ac=non&diam=quam&cras=nec&pellentesque=dui&volutpat=luctus&dui=rutrum&maecenas=nulla&tristique=tellus&est=in&et=sagittis&tempus=dui&semper=vel&est=nisl&quam=duis&pharetra=ac&magna=nibh&ac=fusce&consequat=lacus&metus=purus&sapien=aliquet&ut=at&nunc=feugiat&vestibulum=non&ante=pretium&ipsum=quis&primis=lectus&in=suspendisse&faucibus=potenti&orci=in&luctus=eleifend&et=quam&ultrices=a&posuere=odio&cubilia=in&curae=hac&mauris=habitasse&viverra=platea&diam=dictumst&vitae=maecenas&quam=ut&suspendisse=massa&potenti=quis&nullam=augue&porttitor=luctus&lacus=tincidunt&at=nulla&turpis=mollis&donec=molestie&posuere=lorem&metus=quisque&vitae=ut&ipsum=erat&aliquam=curabitur&non=gravida&mauris=nisi&morbi=at&non=nibh&lectus=in&aliquam=hac&sit=habitasse&amet=platea&diam=dictumst&in=aliquam&magna=augue&bibendum=quam&imperdiet=sollicitudin&nullam=vitae&orci=consectetuer&pede=eget&venenatis=rutrum&non=at&sodales=lorem', 'quam pharetra magna ac consequat metus sapien ut nunc vestibulum ante ipsum primis');
insert into Itens (name, img_location, description) values ('Dihydroergocornine Mesylate, Dihydroergocristine Mesylate, Dihydro-.alpha.-ergocryptine mesylate, and Dihydro-.beta.-ergocryptine mesylate', 'http://jiathis.com/dapibus/duis/at.js?eleifend=massa&quam=tempor&a=convallis&odio=nulla&in=neque&hac=libero&habitasse=convallis&platea=eget&dictumst=eleifend&maecenas=luctus&ut=ultricies&massa=eu&quis=nibh&augue=quisque&luctus=id&tincidunt=justo&nulla=sit&mollis=amet&molestie=sapien&lorem=dignissim&quisque=vestibulum&ut=vestibulum&erat=ante&curabitur=ipsum&gravida=primis&nisi=in&at=faucibus&nibh=orci&in=luctus&hac=et&habitasse=ultrices&platea=posuere&dictumst=cubilia&aliquam=curae&augue=nulla&quam=dapibus&sollicitudin=dolor&vitae=vel&consectetuer=est&eget=donec&rutrum=odio&at=justo&lorem=sollicitudin&integer=ut&tincidunt=suscipit&ante=a&vel=feugiat&ipsum=et&praesent=eros&blandit=vestibulum&lacinia=ac&erat=est&vestibulum=lacinia&sed=nisi&magna=venenatis&at=tristique&nunc=fusce&commodo=congue&placerat=diam&praesent=id&blandit=ornare&nam=imperdiet&nulla=sapien&integer=urna&pede=pretium&justo=nisl&lacinia=ut&eget=volutpat&tincidunt=sapien&eget=arcu&tempus=sed&vel=augue&pede=aliquam&morbi=erat&porttitor=volutpat&lorem=in&id=congue&ligula=etiam&suspendisse=justo&ornare=etiam&consequat=pretium&lectus=iaculis&in=justo&est=in', 'suspendisse potenti nullam porttitor lacus at turpis donec posuere metus vitae');
insert into Itens (name, img_location, description) values ('Camphor (Synthetic) and Menthol', 'http://i2i.jp/ornare/imperdiet/sapien/urna/pretium/nisl.png?bibendum=consequat&morbi=dui&non=nec&quam=nisi&nec=volutpat&dui=eleifend&luctus=donec&rutrum=ut&nulla=dolor&tellus=morbi&in=vel&sagittis=lectus&dui=in&vel=quam&nisl=fringilla&duis=rhoncus&ac=mauris&nibh=enim&fusce=leo&lacus=rhoncus&purus=sed&aliquet=vestibulum&at=sit&feugiat=amet&non=cursus&pretium=id&quis=turpis&lectus=integer&suspendisse=aliquet&potenti=massa&in=id&eleifend=lobortis&quam=convallis&a=tortor&odio=risus&in=dapibus&hac=augue&habitasse=vel&platea=accumsan&dictumst=tellus&maecenas=nisi&ut=eu&massa=orci&quis=mauris&augue=lacinia&luctus=sapien&tincidunt=quis&nulla=libero&mollis=nullam&molestie=sit&lorem=amet&quisque=turpis&ut=elementum&erat=ligula&curabitur=vehicula&gravida=consequat&nisi=morbi&at=a&nibh=ipsum&in=integer&hac=a&habitasse=nibh&platea=in&dictumst=quis&aliquam=justo&augue=maecenas', 'sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean');
insert into Itens (name, img_location, description) values ('Amlodipine besylate', 'https://ow.ly/morbi/odio/odio/elementum/eu.js?nulla=nisl&ac=duis&enim=ac&in=nibh&tempor=fusce&turpis=lacus&nec=purus&euismod=aliquet&scelerisque=at&quam=feugiat&turpis=non&adipiscing=pretium&lorem=quis&vitae=lectus&mattis=suspendisse&nibh=potenti&ligula=in&nec=eleifend&sem=quam&duis=a&aliquam=odio&convallis=in&nunc=hac&proin=habitasse&at=platea&turpis=dictumst&a=maecenas&pede=ut&posuere=massa&nonummy=quis&integer=augue&non=luctus&velit=tincidunt&donec=nulla&diam=mollis&neque=molestie&vestibulum=lorem&eget=quisque&vulputate=ut&ut=erat&ultrices=curabitur&vel=gravida&augue=nisi&vestibulum=at&ante=nibh&ipsum=in&primis=hac&in=habitasse&faucibus=platea&orci=dictumst&luctus=aliquam&et=augue&ultrices=quam&posuere=sollicitudin&cubilia=vitae&curae=consectetuer&donec=eget&pharetra=rutrum&magna=at&vestibulum=lorem&aliquet=integer&ultrices=tincidunt&erat=ante&tortor=vel&sollicitudin=ipsum&mi=praesent&sit=blandit&amet=lacinia&lobortis=erat&sapien=vestibulum', 'rutrum neque aenean auctor gravida sem praesent id massa id nisl venenatis lacinia aenean sit amet justo morbi');
insert into Itens (name, img_location, description) values ('TRIPROLIDINE HYDROCHLORIDE and PSEUDOEPHEDRINE HYDROCHLORIDE', 'https://dot.gov/eros/elementum/pellentesque/quisque.aspx?sit=lacus&amet=purus&justo=aliquet&morbi=at&ut=feugiat&odio=non&cras=pretium&mi=quis&pede=lectus&malesuada=suspendisse&in=potenti&imperdiet=in&et=eleifend&commodo=quam&vulputate=a&justo=odio&in=in&blandit=hac&ultrices=habitasse', 'viverra diam vitae quam suspendisse potenti nullam porttitor lacus at turpis donec posuere metus vitae');
insert into Itens (name, img_location, description) values ('CYCLOBENZAPRINE HYDROCHLORIDE', 'http://drupal.org/volutpat/eleifend/donec/ut/dolor.xml?sem=amet&fusce=justo&consequat=morbi&nulla=ut&nisl=odio&nunc=cras&nisl=mi&duis=pede&bibendum=malesuada&felis=in&sed=imperdiet&interdum=et&venenatis=commodo&turpis=vulputate&enim=justo&blandit=in&mi=blandit&in=ultrices&porttitor=enim&pede=lorem&justo=ipsum&eu=dolor&massa=sit&donec=amet', 'montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et');
insert into Itens (name, img_location, description) values ('Hypromellose', 'https://state.gov/in/libero/ut/massa.jpg?dictumst=lectus&morbi=pellentesque&vestibulum=eget&velit=nunc&id=donec&pretium=quis&iaculis=orci&diam=eget&erat=orci&fermentum=vehicula&justo=condimentum&nec=curabitur&condimentum=in&neque=libero&sapien=ut&placerat=massa&ante=volutpat&nulla=convallis&justo=morbi&aliquam=odio&quis=odio&turpis=elementum&eget=eu&elit=interdum&sodales=eu&scelerisque=tincidunt&mauris=in&sit=leo&amet=maecenas&eros=pulvinar&suspendisse=lobortis&accumsan=est&tortor=phasellus&quis=sit&turpis=amet&sed=erat&ante=nulla&vivamus=tempus&tortor=vivamus&duis=in&mattis=felis&egestas=eu&metus=sapien&aenean=cursus&fermentum=vestibulum&donec=proin&ut=eu&mauris=mi&eget=nulla&massa=ac&tempor=enim&convallis=in&nulla=tempor&neque=turpis&libero=nec&convallis=euismod&eget=scelerisque&eleifend=quam&luctus=turpis', 'vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id massa id nisl venenatis lacinia aenean sit amet');
insert into Itens (name, img_location, description) values ('CAMELLIA SINENSIS, ALLIUM CEPA, NATRUM MURIATICUM, NUX VOMICA, LUFFA OPERCULATA, GALPHIMIA GLAUCA, HISTAMINUM HYDROCHLORUM, SULPHUR', 'https://domainmarket.com/sapien/cursus/vestibulum.jsp?morbi=justo&a=in&ipsum=hac&integer=habitasse&a=platea&nibh=dictumst&in=etiam&quis=faucibus&justo=cursus&maecenas=urna&rhoncus=ut&aliquam=tellus&lacus=nulla&morbi=ut', 'neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl duis');
insert into Itens (name, img_location, description) values ('English Plantain', 'http://cdbaby.com/eros/elementum/pellentesque/quisque.json?est=vestibulum&lacinia=vestibulum&nisi=ante&venenatis=ipsum&tristique=primis&fusce=in&congue=faucibus&diam=orci&id=luctus&ornare=et&imperdiet=ultrices&sapien=posuere&urna=cubilia&pretium=curae&nisl=nulla&ut=dapibus&volutpat=dolor&sapien=vel&arcu=est&sed=donec&augue=odio&aliquam=justo&erat=sollicitudin&volutpat=ut&in=suscipit&congue=a&etiam=feugiat&justo=et&etiam=eros&pretium=vestibulum&iaculis=ac&justo=est&in=lacinia&hac=nisi&habitasse=venenatis&platea=tristique', 'augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id');
insert into Itens (name, img_location, description) values ('TRICLOSAN', 'http://etsy.com/suspendisse/ornare/consequat/lectus/in/est.png?orci=ultrices&luctus=posuere&et=cubilia&ultrices=curae&posuere=mauris&cubilia=viverra&curae=diam&duis=vitae&faucibus=quam&accumsan=suspendisse&odio=potenti&curabitur=nullam&convallis=porttitor&duis=lacus&consequat=at&dui=turpis&nec=donec&nisi=posuere&volutpat=metus&eleifend=vitae&donec=ipsum&ut=aliquam&dolor=non&morbi=mauris&vel=morbi&lectus=non&in=lectus&quam=aliquam&fringilla=sit&rhoncus=amet&mauris=diam&enim=in&leo=magna&rhoncus=bibendum&sed=imperdiet&vestibulum=nullam&sit=orci&amet=pede&cursus=venenatis&id=non&turpis=sodales&integer=sed&aliquet=tincidunt&massa=eu&id=felis&lobortis=fusce&convallis=posuere&tortor=felis&risus=sed&dapibus=lacus&augue=morbi&vel=sem&accumsan=mauris&tellus=laoreet&nisi=ut', 'dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien');
insert into Itens (name, img_location, description) values ('oxycodone hydrochloride and acetaminophen', 'http://rakuten.co.jp/duis/ac/nibh/fusce/lacus.json?feugiat=justo&non=aliquam&pretium=quis&quis=turpis&lectus=eget&suspendisse=elit&potenti=sodales&in=scelerisque&eleifend=mauris&quam=sit&a=amet&odio=eros&in=suspendisse&hac=accumsan&habitasse=tortor&platea=quis&dictumst=turpis&maecenas=sed&ut=ante&massa=vivamus&quis=tortor&augue=duis&luctus=mattis&tincidunt=egestas&nulla=metus&mollis=aenean&molestie=fermentum&lorem=donec&quisque=ut&ut=mauris&erat=eget&curabitur=massa&gravida=tempor&nisi=convallis&at=nulla&nibh=neque&in=libero&hac=convallis&habitasse=eget&platea=eleifend&dictumst=luctus&aliquam=ultricies&augue=eu&quam=nibh&sollicitudin=quisque&vitae=id&consectetuer=justo&eget=sit&rutrum=amet&at=sapien&lorem=dignissim&integer=vestibulum&tincidunt=vestibulum&ante=ante&vel=ipsum&ipsum=primis&praesent=in', 'adipiscing elit proin risus praesent lectus vestibulum quam sapien varius ut blandit non interdum in ante');
insert into Itens (name, img_location, description) values ('Chlorhexidine Diacetate', 'http://ustream.tv/et/ultrices/posuere.jsp?morbi=eget&porttitor=orci&lorem=vehicula&id=condimentum&ligula=curabitur&suspendisse=in&ornare=libero&consequat=ut&lectus=massa&in=volutpat&est=convallis&risus=morbi&auctor=odio&sed=odio&tristique=elementum&in=eu&tempus=interdum&sit=eu&amet=tincidunt&sem=in&fusce=leo&consequat=maecenas&nulla=pulvinar&nisl=lobortis&nunc=est&nisl=phasellus&duis=sit&bibendum=amet&felis=erat&sed=nulla&interdum=tempus&venenatis=vivamus&turpis=in&enim=felis&blandit=eu&mi=sapien&in=cursus&porttitor=vestibulum&pede=proin&justo=eu', 'morbi ut odio cras mi pede malesuada in imperdiet et commodo vulputate justo in blandit ultrices enim lorem ipsum');
insert into Itens (name, img_location, description) values ('Aluminum Zirconium Tetrachlorohydrex GLY', 'http://nature.com/luctus/et/ultrices/posuere/cubilia/curae/duis.jsp?vehicula=pellentesque&consequat=volutpat&morbi=dui&a=maecenas&ipsum=tristique&integer=est&a=et&nibh=tempus&in=semper&quis=est&justo=quam&maecenas=pharetra&rhoncus=magna&aliquam=ac&lacus=consequat&morbi=metus&quis=sapien&tortor=ut&id=nunc&nulla=vestibulum&ultrices=ante&aliquet=ipsum&maecenas=primis&leo=in&odio=faucibus&condimentum=orci&id=luctus&luctus=et&nec=ultrices&molestie=posuere&sed=cubilia&justo=curae&pellentesque=mauris&viverra=viverra&pede=diam&ac=vitae&diam=quam&cras=suspendisse&pellentesque=potenti&volutpat=nullam&dui=porttitor&maecenas=lacus&tristique=at&est=turpis&et=donec&tempus=posuere&semper=metus&est=vitae&quam=ipsum&pharetra=aliquam&magna=non&ac=mauris&consequat=morbi&metus=non&sapien=lectus&ut=aliquam&nunc=sit&vestibulum=amet&ante=diam&ipsum=in&primis=magna&in=bibendum&faucibus=imperdiet&orci=nullam&luctus=orci&et=pede&ultrices=venenatis&posuere=non&cubilia=sodales&curae=sed&mauris=tincidunt&viverra=eu&diam=felis&vitae=fusce&quam=posuere&suspendisse=felis&potenti=sed&nullam=lacus&porttitor=morbi&lacus=sem&at=mauris&turpis=laoreet&donec=ut&posuere=rhoncus&metus=aliquet&vitae=pulvinar&ipsum=sed&aliquam=nisl&non=nunc&mauris=rhoncus&morbi=dui&non=vel&lectus=sem&aliquam=sed', 'eget massa tempor convallis nulla neque libero convallis eget eleifend');
insert into Itens (name, img_location, description) values ('Lidocaine Hydrochloride', 'http://twitpic.com/sapien/in.json?ultrices=porttitor&posuere=lacus&cubilia=at&curae=turpis&donec=donec&pharetra=posuere&magna=metus&vestibulum=vitae&aliquet=ipsum&ultrices=aliquam&erat=non&tortor=mauris&sollicitudin=morbi&mi=non&sit=lectus&amet=aliquam&lobortis=sit&sapien=amet&sapien=diam&non=in&mi=magna&integer=bibendum&ac=imperdiet&neque=nullam&duis=orci&bibendum=pede&morbi=venenatis&non=non&quam=sodales&nec=sed&dui=tincidunt&luctus=eu&rutrum=felis&nulla=fusce&tellus=posuere&in=felis&sagittis=sed&dui=lacus&vel=morbi&nisl=sem&duis=mauris&ac=laoreet&nibh=ut&fusce=rhoncus&lacus=aliquet&purus=pulvinar&aliquet=sed&at=nisl&feugiat=nunc&non=rhoncus&pretium=dui&quis=vel&lectus=sem&suspendisse=sed&potenti=sagittis&in=nam&eleifend=congue&quam=risus&a=semper&odio=porta&in=volutpat&hac=quam&habitasse=pede&platea=lobortis&dictumst=ligula&maecenas=sit&ut=amet&massa=eleifend&quis=pede', 'morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui');
insert into Itens (name, img_location, description) values ('alpha-1 proteinase inhibitor human', 'http://istockphoto.com/velit/donec.jsp?consequat=maecenas&metus=pulvinar&sapien=lobortis&ut=est', 'non mauris morbi non lectus aliquam sit amet diam in magna bibendum imperdiet nullam orci');
insert into Itens (name, img_location, description) values ('Loperamide Hydrochloride', 'https://bandcamp.com/leo/odio/condimentum/id.js?ultrices=hac&posuere=habitasse&cubilia=platea&curae=dictumst&mauris=maecenas&viverra=ut&diam=massa&vitae=quis&quam=augue&suspendisse=luctus&potenti=tincidunt&nullam=nulla&porttitor=mollis&lacus=molestie&at=lorem&turpis=quisque&donec=ut&posuere=erat&metus=curabitur&vitae=gravida&ipsum=nisi&aliquam=at&non=nibh&mauris=in&morbi=hac&non=habitasse&lectus=platea&aliquam=dictumst&sit=aliquam&amet=augue&diam=quam&in=sollicitudin', 'hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec');
insert into Itens (name, img_location, description) values ('SALICYLIC ACID', 'http://independent.co.uk/duis/consequat/dui/nec/nisi/volutpat/eleifend.jpg?nulla=praesent&sed=blandit&accumsan=lacinia&felis=erat&ut=vestibulum&at=sed&dolor=magna&quis=at&odio=nunc&consequat=commodo&varius=placerat&integer=praesent', 'ut blandit non interdum in ante vestibulum ante ipsum primis in');
insert into Itens (name, img_location, description) values ('Ondansetron Hydrochloride', 'http://foxnews.com/odio.xml?suspendisse=placerat&accumsan=ante&tortor=nulla&quis=justo&turpis=aliquam&sed=quis&ante=turpis&vivamus=eget', 'vel nulla eget eros elementum pellentesque quisque porta volutpat erat quisque erat eros viverra eget');
insert into Itens (name, img_location, description) values ('Citalopram Hydrobromide', 'https://moonfruit.com/vel/nulla/eget.jsp?tellus=lobortis&in=est&sagittis=phasellus&dui=sit&vel=amet&nisl=erat&duis=nulla&ac=tempus&nibh=vivamus&fusce=in&lacus=felis&purus=eu&aliquet=sapien&at=cursus&feugiat=vestibulum&non=proin&pretium=eu&quis=mi&lectus=nulla&suspendisse=ac&potenti=enim&in=in&eleifend=tempor&quam=turpis&a=nec&odio=euismod&in=scelerisque&hac=quam&habitasse=turpis&platea=adipiscing&dictumst=lorem&maecenas=vitae&ut=mattis&massa=nibh&quis=ligula&augue=nec&luctus=sem&tincidunt=duis&nulla=aliquam&mollis=convallis&molestie=nunc&lorem=proin&quisque=at&ut=turpis&erat=a&curabitur=pede&gravida=posuere&nisi=nonummy&at=integer&nibh=non&in=velit&hac=donec&habitasse=diam&platea=neque&dictumst=vestibulum&aliquam=eget&augue=vulputate&quam=ut&sollicitudin=ultrices&vitae=vel&consectetuer=augue&eget=vestibulum&rutrum=ante&at=ipsum&lorem=primis&integer=in&tincidunt=faucibus&ante=orci&vel=luctus&ipsum=et&praesent=ultrices&blandit=posuere&lacinia=cubilia&erat=curae&vestibulum=donec&sed=pharetra&magna=magna&at=vestibulum&nunc=aliquet&commodo=ultrices&placerat=erat&praesent=tortor&blandit=sollicitudin&nam=mi&nulla=sit&integer=amet&pede=lobortis&justo=sapien&lacinia=sapien&eget=non&tincidunt=mi&eget=integer&tempus=ac&vel=neque&pede=duis&morbi=bibendum', 'interdum venenatis turpis enim blandit mi in porttitor pede justo eu massa donec dapibus duis at velit');
insert into Itens (name, img_location, description) values ('Octinoxate', 'http://hibu.com/a/ipsum/integer/a/nibh/in.png?sit=ut&amet=blandit&sapien=non&dignissim=interdum&vestibulum=in&vestibulum=ante&ante=vestibulum&ipsum=ante&primis=ipsum&in=primis&faucibus=in&orci=faucibus&luctus=orci&et=luctus&ultrices=et&posuere=ultrices&cubilia=posuere&curae=cubilia&nulla=curae&dapibus=duis&dolor=faucibus&vel=accumsan&est=odio&donec=curabitur&odio=convallis&justo=duis&sollicitudin=consequat&ut=dui&suscipit=nec&a=nisi&feugiat=volutpat&et=eleifend&eros=donec&vestibulum=ut&ac=dolor&est=morbi&lacinia=vel&nisi=lectus&venenatis=in&tristique=quam&fusce=fringilla&congue=rhoncus&diam=mauris&id=enim&ornare=leo&imperdiet=rhoncus&sapien=sed&urna=vestibulum&pretium=sit&nisl=amet&ut=cursus&volutpat=id&sapien=turpis&arcu=integer&sed=aliquet&augue=massa&aliquam=id&erat=lobortis&volutpat=convallis&in=tortor&congue=risus', 'massa volutpat convallis morbi odio odio elementum eu interdum eu');
insert into Itens (name, img_location, description) values ('OCTINOXATE and TITANIUM DIOXIDE', 'https://shareasale.com/magna.json?aenean=purus&fermentum=eu&donec=magna&ut=vulputate&mauris=luctus', 'mi sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi non quam');
insert into Itens (name, img_location, description) values ('DEXTROSE', 'https://de.vu/eu/magna/vulputate/luctus.aspx?sed=ultrices&ante=posuere&vivamus=cubilia&tortor=curae&duis=nulla&mattis=dapibus&egestas=dolor&metus=vel&aenean=est&fermentum=donec&donec=odio&ut=justo&mauris=sollicitudin&eget=ut&massa=suscipit&tempor=a&convallis=feugiat&nulla=et&neque=eros&libero=vestibulum&convallis=ac&eget=est&eleifend=lacinia&luctus=nisi&ultricies=venenatis&eu=tristique&nibh=fusce', 'interdum venenatis turpis enim blandit mi in porttitor pede justo eu massa donec dapibus duis at velit eu');
insert into Itens (name, img_location, description) values ('Hydroxyzine', 'http://pagesperso-orange.fr/accumsan/tortor/quis.aspx?vehicula=massa&consequat=tempor&morbi=convallis&a=nulla&ipsum=neque&integer=libero&a=convallis&nibh=eget&in=eleifend&quis=luctus&justo=ultricies&maecenas=eu&rhoncus=nibh&aliquam=quisque&lacus=id&morbi=justo&quis=sit&tortor=amet&id=sapien&nulla=dignissim&ultrices=vestibulum&aliquet=vestibulum&maecenas=ante&leo=ipsum&odio=primis&condimentum=in&id=faucibus&luctus=orci&nec=luctus&molestie=et&sed=ultrices&justo=posuere&pellentesque=cubilia&viverra=curae&pede=nulla&ac=dapibus&diam=dolor&cras=vel&pellentesque=est&volutpat=donec&dui=odio&maecenas=justo&tristique=sollicitudin&est=ut&et=suscipit&tempus=a&semper=feugiat&est=et&quam=eros&pharetra=vestibulum&magna=ac&ac=est&consequat=lacinia&metus=nisi&sapien=venenatis', 'vulputate justo in blandit ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit proin');
insert into Itens (name, img_location, description) values ('Ofloxaxin', 'https://com.com/eleifend/luctus.html?id=turpis&sapien=nec&in=euismod&sapien=scelerisque&iaculis=quam&congue=turpis&vivamus=adipiscing&metus=lorem&arcu=vitae&adipiscing=mattis&molestie=nibh&hendrerit=ligula&at=nec&vulputate=sem&vitae=duis&nisl=aliquam&aenean=convallis&lectus=nunc&pellentesque=proin&eget=at&nunc=turpis&donec=a&quis=pede&orci=posuere&eget=nonummy&orci=integer&vehicula=non&condimentum=velit&curabitur=donec&in=diam&libero=neque&ut=vestibulum&massa=eget&volutpat=vulputate&convallis=ut&morbi=ultrices&odio=vel&odio=augue&elementum=vestibulum&eu=ante&interdum=ipsum&eu=primis&tincidunt=in&in=faucibus&leo=orci&maecenas=luctus&pulvinar=et&lobortis=ultrices&est=posuere&phasellus=cubilia&sit=curae&amet=donec&erat=pharetra&nulla=magna&tempus=vestibulum&vivamus=aliquet&in=ultrices&felis=erat&eu=tortor&sapien=sollicitudin&cursus=mi&vestibulum=sit&proin=amet&eu=lobortis&mi=sapien&nulla=sapien&ac=non&enim=mi&in=integer&tempor=ac&turpis=neque&nec=duis&euismod=bibendum&scelerisque=morbi&quam=non&turpis=quam&adipiscing=nec&lorem=dui&vitae=luctus&mattis=rutrum&nibh=nulla&ligula=tellus&nec=in&sem=sagittis&duis=dui&aliquam=vel&convallis=nisl&nunc=duis&proin=ac&at=nibh&turpis=fusce&a=lacus&pede=purus&posuere=aliquet&nonummy=at&integer=feugiat&non=non&velit=pretium&donec=quis', 'quis tortor id nulla ultrices aliquet maecenas leo odio condimentum id luctus nec molestie');
insert into Itens (name, img_location, description) values ('Duloxetine', 'http://opensource.org/urna.js?sit=nascetur&amet=ridiculus&cursus=mus&id=vivamus&turpis=vestibulum&integer=sagittis&aliquet=sapien&massa=cum&id=sociis&lobortis=natoque&convallis=penatibus&tortor=et&risus=magnis&dapibus=dis&augue=parturient&vel=montes&accumsan=nascetur&tellus=ridiculus&nisi=mus&eu=etiam&orci=vel&mauris=augue&lacinia=vestibulum&sapien=rutrum&quis=rutrum&libero=neque&nullam=aenean&sit=auctor&amet=gravida&turpis=sem&elementum=praesent&ligula=id&vehicula=massa&consequat=id&morbi=nisl&a=venenatis&ipsum=lacinia&integer=aenean&a=sit&nibh=amet&in=justo&quis=morbi&justo=ut&maecenas=odio&rhoncus=cras&aliquam=mi&lacus=pede&morbi=malesuada&quis=in&tortor=imperdiet&id=et&nulla=commodo&ultrices=vulputate&aliquet=justo&maecenas=in&leo=blandit&odio=ultrices&condimentum=enim&id=lorem&luctus=ipsum&nec=dolor&molestie=sit&sed=amet&justo=consectetuer&pellentesque=adipiscing&viverra=elit&pede=proin&ac=interdum&diam=mauris&cras=non&pellentesque=ligula&volutpat=pellentesque&dui=ultrices&maecenas=phasellus&tristique=id&est=sapien&et=in&tempus=sapien&semper=iaculis&est=congue&quam=vivamus&pharetra=metus', 'mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas');
insert into Itens (name, img_location, description) values ('TERBINAFINE HYDROCHLORIDE', 'https://wordpress.org/venenatis/turpis/enim/blandit.xml?vulputate=in&elementum=quam&nullam=fringilla&varius=rhoncus&nulla=mauris&facilisi=enim&cras=leo&non=rhoncus&velit=sed&nec=vestibulum', 'vitae nisl aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero');
insert into Itens (name, img_location, description) values ('Cetirizine Hydrochloride', 'https://vimeo.com/luctus.png?fusce=orci&lacus=luctus&purus=et&aliquet=ultrices', 'quis justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla ultrices aliquet maecenas leo odio condimentum id');
insert into Itens (name, img_location, description) values ('TRICLOSAN', 'http://eepurl.com/vel/ipsum/praesent/blandit/lacinia/erat.html?sit=aliquet&amet=pulvinar&eros=sed&suspendisse=nisl&accumsan=nunc&tortor=rhoncus&quis=dui&turpis=vel&sed=sem&ante=sed&vivamus=sagittis&tortor=nam&duis=congue&mattis=risus&egestas=semper&metus=porta&aenean=volutpat&fermentum=quam&donec=pede&ut=lobortis&mauris=ligula&eget=sit&massa=amet&tempor=eleifend&convallis=pede&nulla=libero&neque=quis&libero=orci&convallis=nullam&eget=molestie&eleifend=nibh&luctus=in&ultricies=lectus&eu=pellentesque&nibh=at&quisque=nulla&id=suspendisse&justo=potenti&sit=cras&amet=in&sapien=purus&dignissim=eu&vestibulum=magna&vestibulum=vulputate&ante=luctus&ipsum=cum&primis=sociis&in=natoque&faucibus=penatibus&orci=et&luctus=magnis&et=dis&ultrices=parturient&posuere=montes&cubilia=nascetur&curae=ridiculus&nulla=mus&dapibus=vivamus&dolor=vestibulum&vel=sagittis&est=sapien&donec=cum&odio=sociis&justo=natoque&sollicitudin=penatibus&ut=et&suscipit=magnis&a=dis&feugiat=parturient&et=montes&eros=nascetur&vestibulum=ridiculus&ac=mus&est=etiam&lacinia=vel', 'nibh in hac habitasse platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget');
insert into Itens (name, img_location, description) values ('Standardized Mite D. farinae', 'http://oracle.com/turpis/integer/aliquet.js?nam=metus&congue=sapien&risus=ut', 'maecenas leo odio condimentum id luctus nec molestie sed justo pellentesque viverra');
insert into Itens (name, img_location, description) values ('OCTINOXATE, TITANIUM DIOXIDE, ALUMINUM HYDROXIDE, STEARIC ACID, HYDROXYPROLINE', 'https://netscape.com/in/leo/maecenas/pulvinar.jsp?lobortis=donec&sapien=semper&sapien=sapien&non=a&mi=libero&integer=nam&ac=dui&neque=proin&duis=leo&bibendum=odio&morbi=porttitor&non=id&quam=consequat&nec=in&dui=consequat&luctus=ut&rutrum=nulla&nulla=sed&tellus=accumsan&in=felis&sagittis=ut&dui=at&vel=dolor&nisl=quis&duis=odio', 'enim blandit mi in porttitor pede justo eu massa donec dapibus');
insert into Itens (name, img_location, description) values ('LEVOTHYROXINE, LIOTHYRONINE', 'https://elpais.com/pulvinar/lobortis/est/phasellus/sit.aspx?non=maecenas&sodales=ut&sed=massa&tincidunt=quis&eu=augue&felis=luctus&fusce=tincidunt&posuere=nulla&felis=mollis&sed=molestie&lacus=lorem&morbi=quisque&sem=ut&mauris=erat&laoreet=curabitur&ut=gravida&rhoncus=nisi&aliquet=at&pulvinar=nibh&sed=in&nisl=hac&nunc=habitasse&rhoncus=platea&dui=dictumst&vel=aliquam&sem=augue&sed=quam&sagittis=sollicitudin&nam=vitae&congue=consectetuer&risus=eget&semper=rutrum&porta=at&volutpat=lorem&quam=integer&pede=tincidunt&lobortis=ante&ligula=vel&sit=ipsum&amet=praesent&eleifend=blandit&pede=lacinia&libero=erat&quis=vestibulum&orci=sed&nullam=magna&molestie=at&nibh=nunc&in=commodo&lectus=placerat&pellentesque=praesent&at=blandit&nulla=nam&suspendisse=nulla&potenti=integer&cras=pede&in=justo&purus=lacinia&eu=eget&magna=tincidunt&vulputate=eget&luctus=tempus&cum=vel&sociis=pede&natoque=morbi&penatibus=porttitor&et=lorem&magnis=id&dis=ligula&parturient=suspendisse&montes=ornare&nascetur=consequat&ridiculus=lectus&mus=in&vivamus=est&vestibulum=risus&sagittis=auctor&sapien=sed&cum=tristique&sociis=in&natoque=tempus&penatibus=sit&et=amet&magnis=sem', 'at velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium');
insert into Itens (name, img_location, description) values ('Acetaminophen, Diphenhydramine HCl', 'https://twitter.com/sed/augue/aliquam/erat/volutpat.png?ac=cursus&enim=vestibulum&in=proin&tempor=eu&turpis=mi', 'nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam');
insert into Itens (name, img_location, description) values ('miglitol', 'http://over-blog.com/nisl/duis/bibendum/felis.png?interdum=nulla&venenatis=integer&turpis=pede&enim=justo&blandit=lacinia&mi=eget', 'mauris enim leo rhoncus sed vestibulum sit amet cursus id');
insert into Itens (name, img_location, description) values ('Enoxaparin Sodium', 'https://github.io/dapibus/duis/at.html?enim=mi&in=sit&tempor=amet&turpis=lobortis&nec=sapien&euismod=sapien&scelerisque=non&quam=mi&turpis=integer&adipiscing=ac&lorem=neque&vitae=duis&mattis=bibendum&nibh=morbi&ligula=non&nec=quam&sem=nec&duis=dui&aliquam=luctus&convallis=rutrum&nunc=nulla&proin=tellus&at=in&turpis=sagittis&a=dui&pede=vel&posuere=nisl&nonummy=duis&integer=ac&non=nibh&velit=fusce&donec=lacus&diam=purus&neque=aliquet&vestibulum=at&eget=feugiat&vulputate=non&ut=pretium&ultrices=quis&vel=lectus&augue=suspendisse&vestibulum=potenti&ante=in&ipsum=eleifend&primis=quam&in=a&faucibus=odio&orci=in&luctus=hac&et=habitasse&ultrices=platea&posuere=dictumst&cubilia=maecenas&curae=ut&donec=massa&pharetra=quis&magna=augue&vestibulum=luctus&aliquet=tincidunt&ultrices=nulla&erat=mollis&tortor=molestie&sollicitudin=lorem&mi=quisque&sit=ut&amet=erat&lobortis=curabitur&sapien=gravida&sapien=nisi&non=at&mi=nibh&integer=in&ac=hac&neque=habitasse&duis=platea&bibendum=dictumst&morbi=aliquam&non=augue&quam=quam&nec=sollicitudin&dui=vitae&luctus=consectetuer&rutrum=eget&nulla=rutrum&tellus=at&in=lorem&sagittis=integer&dui=tincidunt&vel=ante&nisl=vel&duis=ipsum&ac=praesent', 'nibh fusce lacus purus aliquet at feugiat non pretium quis lectus suspendisse potenti in eleifend quam a');
insert into Itens (name, img_location, description) values ('eliglustat', 'http://deviantart.com/montes/nascetur.js?curae=id&nulla=justo&dapibus=sit&dolor=amet&vel=sapien&est=dignissim&donec=vestibulum&odio=vestibulum&justo=ante&sollicitudin=ipsum&ut=primis&suscipit=in&a=faucibus&feugiat=orci&et=luctus&eros=et&vestibulum=ultrices&ac=posuere', 'auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum');
insert into Itens (name, img_location, description) values ('rabeprazole sodium', 'http://census.gov/in/faucibus/orci/luctus/et.jsp?in=nullam&tempus=molestie&sit=nibh&amet=in&sem=lectus&fusce=pellentesque&consequat=at&nulla=nulla&nisl=suspendisse&nunc=potenti&nisl=cras&duis=in&bibendum=purus&felis=eu&sed=magna&interdum=vulputate&venenatis=luctus&turpis=cum&enim=sociis&blandit=natoque&mi=penatibus&in=et&porttitor=magnis&pede=dis&justo=parturient&eu=montes&massa=nascetur&donec=ridiculus&dapibus=mus&duis=vivamus&at=vestibulum&velit=sagittis&eu=sapien&est=cum&congue=sociis&elementum=natoque&in=penatibus&hac=et&habitasse=magnis&platea=dis&dictumst=parturient&morbi=montes&vestibulum=nascetur&velit=ridiculus&id=mus&pretium=etiam&iaculis=vel&diam=augue&erat=vestibulum&fermentum=rutrum&justo=rutrum&nec=neque&condimentum=aenean&neque=auctor&sapien=gravida&placerat=sem&ante=praesent&nulla=id&justo=massa&aliquam=id&quis=nisl&turpis=venenatis&eget=lacinia', 'amet nulla quisque arcu libero rutrum ac lobortis vel dapibus at diam nam tristique');
insert into Itens (name, img_location, description) values ('ALUMINUM SULFATE', 'http://over-blog.com/eu/tincidunt.json?at=sit&feugiat=amet&non=eros', 'mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas metus');
insert into Itens (name, img_location, description) values ('Acetaminophen, Dextromethorphan HBr, Doxylamine Succinate', 'http://unesco.org/lacus/at/velit.json?etiam=mattis&vel=odio&augue=donec&vestibulum=vitae&rutrum=nisi&rutrum=nam&neque=ultrices&aenean=libero&auctor=non&gravida=mattis&sem=pulvinar&praesent=nulla&id=pede&massa=ullamcorper&id=augue&nisl=a&venenatis=suscipit&lacinia=nulla&aenean=elit&sit=ac&amet=nulla&justo=sed&morbi=vel&ut=enim&odio=sit&cras=amet&mi=nunc&pede=viverra&malesuada=dapibus&in=nulla&imperdiet=suscipit&et=ligula&commodo=in&vulputate=lacus&justo=curabitur&in=at&blandit=ipsum&ultrices=ac&enim=tellus&lorem=semper&ipsum=interdum&dolor=mauris&sit=ullamcorper&amet=purus&consectetuer=sit&adipiscing=amet&elit=nulla&proin=quisque&interdum=arcu&mauris=libero&non=rutrum&ligula=ac&pellentesque=lobortis&ultrices=vel&phasellus=dapibus&id=at&sapien=diam&in=nam&sapien=tristique&iaculis=tortor&congue=eu', 'nulla facilisi cras non velit nec nisi vulputate nonummy maecenas tincidunt lacus at velit vivamus vel nulla eget eros elementum');
insert into Itens (name, img_location, description) values ('scallop', 'http://nyu.edu/nec/nisi/volutpat/eleifend.js?ante=ligula&ipsum=pellentesque&primis=ultrices&in=phasellus&faucibus=id&orci=sapien&luctus=in&et=sapien&ultrices=iaculis&posuere=congue&cubilia=vivamus&curae=metus&mauris=arcu&viverra=adipiscing&diam=molestie&vitae=hendrerit&quam=at&suspendisse=vulputate&potenti=vitae&nullam=nisl&porttitor=aenean&lacus=lectus&at=pellentesque&turpis=eget&donec=nunc&posuere=donec&metus=quis&vitae=orci&ipsum=eget&aliquam=orci&non=vehicula&mauris=condimentum&morbi=curabitur&non=in&lectus=libero&aliquam=ut&sit=massa&amet=volutpat&diam=convallis&in=morbi&magna=odio&bibendum=odio&imperdiet=elementum&nullam=eu&orci=interdum&pede=eu&venenatis=tincidunt&non=in&sodales=leo&sed=maecenas&tincidunt=pulvinar&eu=lobortis&felis=est&fusce=phasellus&posuere=sit&felis=amet&sed=erat&lacus=nulla&morbi=tempus&sem=vivamus&mauris=in&laoreet=felis&ut=eu&rhoncus=sapien&aliquet=cursus&pulvinar=vestibulum&sed=proin&nisl=eu&nunc=mi&rhoncus=nulla&dui=ac&vel=enim&sem=in&sed=tempor&sagittis=turpis&nam=nec&congue=euismod', 'sit amet lobortis sapien sapien non mi integer ac neque');


insert into ExerciseSet (exerciseId, itenId) values (36, 13);
insert into ExerciseSet (exerciseId, itenId) values (12, 35);
insert into ExerciseSet (exerciseId, itenId) values (34, 28);
insert into ExerciseSet (exerciseId, itenId) values (7, 43);
insert into ExerciseSet (exerciseId, itenId) values (11, 45);
insert into ExerciseSet (exerciseId, itenId) values (19, 5);
insert into ExerciseSet (exerciseId, itenId) values (6, 27);
insert into ExerciseSet (exerciseId, itenId) values (30, 38);
insert into ExerciseSet (exerciseId, itenId) values (9, 8);
insert into ExerciseSet (exerciseId, itenId) values (47, 13);
insert into ExerciseSet (exerciseId, itenId) values (42, 44);
insert into ExerciseSet (exerciseId, itenId) values (8, 44);
insert into ExerciseSet (exerciseId, itenId) values (6, 13);
insert into ExerciseSet (exerciseId, itenId) values (39, 32);
insert into ExerciseSet (exerciseId, itenId) values (4, 30);
insert into ExerciseSet (exerciseId, itenId) values (27, 42);
insert into ExerciseSet (exerciseId, itenId) values (27, 24);
insert into ExerciseSet (exerciseId, itenId) values (37, 13);
insert into ExerciseSet (exerciseId, itenId) values (22, 33);
insert into ExerciseSet (exerciseId, itenId) values (32, 19);
insert into ExerciseSet (exerciseId, itenId) values (7, 30);
insert into ExerciseSet (exerciseId, itenId) values (23, 34);
insert into ExerciseSet (exerciseId, itenId) values (31, 50);
insert into ExerciseSet (exerciseId, itenId) values (22, 39);
insert into ExerciseSet (exerciseId, itenId) values (27, 3);
insert into ExerciseSet (exerciseId, itenId) values (22, 2);
insert into ExerciseSet (exerciseId, itenId) values (31, 14);
insert into ExerciseSet (exerciseId, itenId) values (28, 42);
insert into ExerciseSet (exerciseId, itenId) values (34, 36);
insert into ExerciseSet (exerciseId, itenId) values (14, 9);
insert into ExerciseSet (exerciseId, itenId) values (19, 34);
insert into ExerciseSet (exerciseId, itenId) values (18, 6);
insert into ExerciseSet (exerciseId, itenId) values (7, 8);
insert into ExerciseSet (exerciseId, itenId) values (43, 11);
insert into ExerciseSet (exerciseId, itenId) values (44, 47);
insert into ExerciseSet (exerciseId, itenId) values (34, 34);
insert into ExerciseSet (exerciseId, itenId) values (9, 14);
insert into ExerciseSet (exerciseId, itenId) values (16, 4);
insert into ExerciseSet (exerciseId, itenId) values (30, 22);
insert into ExerciseSet (exerciseId, itenId) values (32, 30);
insert into ExerciseSet (exerciseId, itenId) values (8, 6);
insert into ExerciseSet (exerciseId, itenId) values (19, 2);
insert into ExerciseSet (exerciseId, itenId) values (34, 30);
insert into ExerciseSet (exerciseId, itenId) values (30, 28);
insert into ExerciseSet (exerciseId, itenId) values (36, 13);
insert into ExerciseSet (exerciseId, itenId) values (35, 18);
insert into ExerciseSet (exerciseId, itenId) values (10, 10);
insert into ExerciseSet (exerciseId, itenId) values (20, 19);
insert into ExerciseSet (exerciseId, itenId) values (32, 15);
insert into ExerciseSet (exerciseId, itenId) values (43, 31);


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

