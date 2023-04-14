USE talantrix
;

CREATE TABLE SKU (
	PRIMARY KEY ([ID identity]),
	[ID identity] INT         NOT NULL,
	[Name]        VARCHAR(150),
	Code          AS CONCAT('s', [ID identity]),
	
	CONSTRAINT Code_unique 
		UNIQUE(Code),
);

CREATE TABLE Family (
	PRIMARY KEY ([ID identity]),
	[ID identity] INT            NOT NULL,
	SurName       VARCHAR(50)    NOT NULL,
	BudgetValue   DECIMAL(10, 2) NOT NULL	
);

CREATE TABLE Basket (
	PRIMARY KEY ([ID identity]),
	[ID identity] INT					 NOT NULL,
	ID_SKU        INT			         NOT NULL,              
	ID_Family     INT                    NOT NULL,
	Quantity      INT                    NOT NULL,
	[Value]       DECIMAL(10, 2)         NOT NULL,
	PurchaseDate  DATE DEFAULT GETDATE() NOT NULL,
	DiscountValue  DECIMAL(5, 2)         NOT NULL,

	CONSTRAINT Quantity_negative_value_check
		CHECK(Quantity >= 0),

	CONSTRAINT Value_negative_value_check
		CHECK([Value] >= 0),

	CONSTRAINT FK_Family_ID
		FOREIGN KEY (ID_Family) REFERENCES Family ([ID identity])
		ON DELETE CASCADE
		ON UPDATE CASCADE,

	CONSTRAINT FK_SKU_ID
		FOREIGN KEY (ID_SKU) REFERENCES SKU ([ID identity])
		ON DELETE CASCADE
		ON UPDATE CASCADE
);