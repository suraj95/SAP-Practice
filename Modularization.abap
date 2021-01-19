
* Includes

DATA line_cnt TYPE i.
****************************************

"This block of code refers to Internal Table itab-02 created in second section of internal-tables abap file.
"We can use the table by writing the table definition in an INCLUDE file called Z_EMPLOYEE_DEFINITIONS.

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

PERFORM itab02_fill.






