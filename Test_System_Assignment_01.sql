DROP DATABASE IF EXISTS RAILWAY_06;
CREATE DATABASE RAILWAY_06;
USE RAILWAY_06;				
CREATE TABLE Department (					
	DepartmentID		int,		
	DepartmentName		varchar(255)		
	);				
DROP TABLE IF EXISTS `Position`;					
CREATE TABLE `Position`(					
	PositionID		int,		
	DepartmentName		varchar(255)		
	);				
DROP TABLE IF EXISTS Account;					
CREATE TABLE Account(					
	AccountID		int,		
	Email		        varchar(255),		
	Username		varchar(255),		
	FullName		varchar(255),		
	DepartmentID		int(10),		
	PositionID		int(10),		
	CreateDate		DATE		
	);				
DROP TABLE IF EXISTS `Group`;					
CREATE TABLE `GROUP`(					
	GroupID		        int,		
	GroupName		varchar(255),		
	CreatorID		int(10),		
	CreateDate		DATE		
	);				
DROP TABLE IF EXISTS GroupAccount;					
CREATE TABLE GroupAccount(					
	GroupID		        int(10),		
	AccountID		int(10),		
	JoinDate		DATE		
	);				
DROP TABLE IF EXISTS TypeQuestion;					
CREATE TABLE TypeQuestion(					
	TypeID		        int,		
	TypeName		varchar(255)		
	);				
DROP TABLE IF EXISTS CategoryQuestion;					
CREATE TABLE CategoryQuestion(					
	CategoryID		int,		
	CategoryName		varchar(255)		
	);				
					
					