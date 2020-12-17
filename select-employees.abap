* A Program with different kinds of SELECT loops being demonstrated

REPORT z_employee_list_01 LINE SIZE 40. " Limit the line to 40 characters.

TABLE zemployees.

SELECT * FROM zemployees.	" Basic Select Loop with Line Break
	WRITE zemployees.
ENDSELECT.

ULINE. 		

SELECT * FROM zemployees.	" Basic Select Loop with LINE-BREAK
	WRITE / zemployees. 
ENDSELECT.

ULINE. 

SKIP 2. 
SELECT * FROM zemployees.	" Basic Select Loop with a SKIP Statement
	WRITE zemployees.
ENDSELECT.

ULINE.

SELECT * FROM zemployees.	" Basic Select Loop with individual fields
	WRITE / zemployees-surname.
	WRITE zemployees-forename.
	WRITE zemployees-dob. 
ENDSELECT.

