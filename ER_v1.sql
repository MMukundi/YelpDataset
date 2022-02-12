CREATE TABLE Users
(
	user_id VARCHAR PRIMARY KEY,
	first_name VARCHAR,
	yelping_since DATETIME,
	tip_count INTEGER,
	fan_count INTEGER,
	average_stars FLOAT,

	funny INTEGER,
	useful INTEGER,
	cool INTEGER,

	longitude FLOAT,
	latitude FLOAT
);


CREATE TABLE FriendedUsers
(
	user_id VARCHAR,
	friended_by_id VARCHAR,
	PRIMARY KEY (friended_by_id, user_id),
	FOREIGN KEY(friended_by_id) REFERENCES Users(user_id),
	FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE Businesses
(
	business_id VARCHAR PRIMARY KEY,
	name VARCHAR,
	address VARCHAR,
	state VARCHAR,
	city VARCHAR,
	zip INTEGER,

	longitude FLOAT,
	latitude FLOAT,
	stars FLOAT,

	is_open INTEGER,

	tip_count INTEGER,
	checkin_count INTEGER,
);

CREATE TABLE Category
(
	business_id VARCHAR,
	category VARCHAR,
	PRIMARY KEY (business_id, category),
	FOREIGN KEY (business_id) REFERENCES Business(business_id)
);


CREATE TABLE Tips
(
	user_id VARCHAR,
	business_id VARCHAR,
	date_posted DATETIME,
	body VARCHAR,
	likes INTEGER,
	PRIMARY KEY (user_id, business_id, date_posted),
	FOREIGN KEY (user_id) REFERENCES Users(user_id),
	FOREIGN KEY (business_id) REFERENCES Business(business_id)
);

CREATE TABLE CheckIns
(
	business_id VARCHAR,
	checkin_date DATETIME,
	PRIMARY KEY (business_id, checkin_date),
	FOREIGN KEY (business_id) REFERENCES Business(business_id)
);

CREATE TABLE OperatingHours
(
	business_id VARCHAR PRIMARY KEY,
	monday_open TIME,
	monday_close TIME,

	tuesday_open TIME,
	tuesday_close TIME,

	wednesday_open TIME,
	wednesday_close TIME,

	thursday_open TIME,
	thursday_close TIME,

	friday_open TIME,
	friday_close TIME,

	saturday_open TIME,
	saturday_close TIME,

	sunday_open TIME,
	sunday_close TIME,
	FOREIGN KEY (business_id) REFERENCES Business(business_id)
);

CREATE TABLE Attributes
(
	business_id VARCHAR,
	attribute VARCHAR,
	value VARCHAR,
	PRIMARY KEY (business_id, attribute),
	FOREIGN KEY (business_id) REFERENCES Business(business_id)
);

