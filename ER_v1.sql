CREATE TABLE User (
	user_id VARCHAR PRIMARY KEY,
	name VARCHAR,
	average_stars DOUBLE,
	fan_count INTEGER,
	yelping_since DATETIME,
	vote_count INTEGER,
	tip_count INTEGER,
	tip_like_count INTEGER,
	longitude FLOAT,
	latitude FLOAT
);

CREATE TABLE Friend (
	friend_user_id VARCHAR PRIMARY KEY
);

CREATE TABLE UserHasFriend (
	friend_user_id VARCHAR,
	user_id VARCHAR,
	PRIMARY KEY (friend_user_id, user_id),
	FOREIGN KEY(friend_user_id) REFERENCES Friend(friend_user_id),
	FOREIGN KEY (user_id) REFERENCES User(user_id)
);

CREATE TABLE Business (
	business_id VARCHAR PRIMARY KEY,
	business_rating FLOAT,
	address VARCHAR,
	state VARCHAR,
	city VARCHAR,
	zip INTEGER,
	longitude FLOAT,
	latitude FLOAT,
	business_tip_count INTEGER,
	business_name VARCHAR,
	business_checkin_count INTEGER
	attributes VARCHAR,
	is_open INTEGER,
);

CREATE TABLE Categories (
	business_id VARCHAR,
	category VARCHAR,
	PRIMARY KEY (business_id, category),
	FOREIGN KEY (business_id) REFERENCES Business(business_id)
);
	

CREATE TABLE Tip (
	user_id VARCHAR,
	business_id VARCHAR,
	timestamp DATETIME,
	text VARCHAR,
	likes INTEGER,
	PRIMARY KEY (user_id, business_id, timestamp) 
	FOREIGN KEY (user_id) REFERENCES User(user_id),
	FOREIGN KEY (business_id) REFERENCES Business(business_id)
);

CREATE TABLE Check_Ins (
	business_id,
	dateTime DATETIME,
	PRIMARY KEY (business_id),
	FOREIGN KEY (business_id) REFERENCES Business(business_id)
);

CREATE TABLE Hours (
	business_id PRIMARY KEY,
	monday_hours,
	tuesday_hours,
	wednesday_hours,
	thursday_hours,
	friday_hours,
	saturday_hours,
	sunday_hours,
	FOREIGN KEY (business_id) REFERENCES Business(business_id)
);

CREATE TABLE Attributes (
	business_id VARCHAR,
	attribute VARCHAR,
	PRIMARY KEY (business_id, attribute),
	FOREIGN KEY (business_id) REFERENCES Business(business_id)
);

