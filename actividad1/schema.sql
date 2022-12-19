CREATE TABLE tabla1 (
	A VARCHAR(50) PRIMARY KEY,
  	B VARCHAR(50)
);


CREATE TABLE tabla2 (
	A VARCHAR(50),
  	C VARCHAR(50),
  	D INTEGER,
  	PRIMARY KEY (A,C,D),
  	CONSTRAINT fk_A
  		FOREIGN KEY (A)
  			REFERENCES tabla1(A)
);


CREATE TABLE tabla3(
	C VARCHAR(50),
  	D INTEGER,
  	E VARCHAR(50),
  	PRIMARY KEY (C,D),
  	CONSTRAINT fk_C
  		FOREIGN KEY (C)
  			REFERENCES tabla2(C),
  	CONSTRAINT fk_D
  		FOREIGN KEY (D)
  			REFERENCES tabla2(D)
);  
  
  
  