
* Includes

"This block of code refers to Internal Table itab-02 created in second section of internal-tables abap file.
"We can use the table by writing the table definition in an INCLUDE file called Z_EMPLOYEE_DEFINITIONS.

DATA line_cnt TYPE i.
INCLUDE Z_EMPLOYEE_DEFINITIONS.
TABLES: zemployees.

SELECT * FROM zemployees
  INTO CORRESPONDING FIELDS OF TABLE itab-02. 

LOOP AT itab-02 INTO wa_itab02. 
  WRITE wa_itab02-surname.
ENDLOOP.

CLEAR: itab-02, wa_itab02.

LOOP AT itab-02 INTO wa_itab02.
  IF wa_itab02-surname = 'JONES'.
    wa_itab02-surname = 'SMITH'.
    MODIFY itab-02 FROM wa_itab02.
  ENDIF.
ENDLOOP.

DESCRIBE TABLE itab-02 LINES line_cnt.
INSERT wa_itab02 INTO itab-02 INDEX line_cnt.

READ TABLE itab-02 INDEX 5 INTO wa_itab02.

READ TABLE itab-02 INTO wa_itab02
     WITH KEY surname = 'SMITH'.


* Sub-Routines

PERFORM itab02_fill. "When the PERFORM statement is reached as the program executes, the sub-routine created will be triggered, meaning that the array fetch is performed in exactly the same way as previously. 

DATA z_field1 LIKE zemployees-surname.
DATA z_field2 LIKE zemployees-surname.

z_field1 = 'ANDREWS'.
z_field2 = 'SUSAN'.

PERFORM itab02_fill_again USING z_field1 z_field2. "Value of z_field2 will change to 'abcd' because of Sub-Routine

PERFORM itab02_write TABLES itab02. 

PERFORM itab02_multi TABLES itab02 USING z_field1 z_field2.


* Sub-Routines - External Programs

PERFORM sub_1 in PROGRAM zemployee_hire USING z_field1 z_field2. "Generally to do this, though, one should create function modules instead. 

PERFORM sub_1(zemployee_hire) TABLES itab02 USING z_field1 z_field2. 





