/*8WeekChallengeDB by Tushar-Aggarwal.com
#1Dannys_Diner */

--Creating Schema
CREATE SCHEMA dannys_diner;
SET search_path = dannys_diner;

--Creating Tables
CREATE TABLE sales (
	"customer_id" VARCHAR(1),
	"order_date" DATE,
	"product_id" INTEGER
	);
CREATE TABLE menu (
	"product_id" INTEGER,
	"product_name" VARCHAR(5),
	"price" INTEGER
	);
CREATE TABLE members (
	"customer_id" VARCHAR(1),
	"join_date" DATE
	);
