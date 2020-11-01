DROP DATABASE IF EXISTS RAILWAY_06_EXTRA;
CREATE DATABASE RAILWAY_06_EXTRA;
USE RAILWAY_06_EXTRA;	

CREATE TABLE `trainee` (
	`trainee_id`		TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    full_name			NVARCHAR(250),
    birth_date			DATE,
    gender				ENUM('Male','Female','Unknown'),
    et_iq				TINYINT UNSIGNED CHECK(et_iq >= 0 && et_iq <= 20),
    et_gmath			TINYINT UNSIGNED CHECK(et_gmath >= 0 && et_gmath <= 20),
    et_english			TINYINT UNSIGNED CHECK(et_english >= 0 && et_english <= 50),
    training_class		VARCHAR(10),
    evaluation_notes	NVARCHAR(500)
);
