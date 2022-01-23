USE BUDT703_DB_Student_207

ALTER TABLE [Act4.Student] 
	DROP CONSTRAINT IF EXISTS fk_Student_deviceId;
DROP TABLE IF EXISTS [Act4.Device];
DROP TABLE IF EXISTS [Act4.Student];

CREATE TABLE [Act4.Student] (
    studentId CHAR(9) NOT NULL, 
	studentName VARCHAR(20),
	deviceId CHAR (3), 
	CONSTRAINT pk_Student_studentId PRIMARY KEY (studentId))

CREATE TABLE [Act4.Device] (
    deviceId CHAR (3) NOT NULL, 
	deviceBrand VARCHAR(20),
	studentId CHAR(9) NOT NULL,
	CONSTRAINT pk_Device_deviceId PRIMARY KEY (deviceId),
	CONSTRAINT fk_Device_studentId FOREIGN KEY (studentId)
		REFERENCES [Act4.Student] (studentId)
			ON DELETE NO ACTION ON UPDATE NO ACTION);

ALTER TABLE [Act4.Student] 
	ADD CONSTRAINT fk_Student_deviceId FOREIGN KEY (deviceId)
		REFERENCES [Act4.Device] (deviceId)
			ON DELETE NO ACTION ON UPDATE NO ACTION;

INSERT INTO [Act4.Student] VALUES 
    ('111111111', 'Larry', NULL),
	('222222222', 'Clarice', NULL);

INSERT INTO [Act4.Device] VALUES 
    ('D01', 'Apple', '111111111'),
	('D02', 'Sony', '222222222'),
	('D03', 'Apple', '111111111');

UPDATE [Act4.Student] SET deviceId = 'D01' WHERE studentId = '111111111'
UPDATE [Act4.Student] SET deviceId = 'D02' WHERE studentId = '222222222'

SELECT * FROM [Act4.Student];
SELECT * FROM [Act4.Device];
