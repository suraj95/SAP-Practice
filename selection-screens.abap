
* Initialization Event

REPORT z_screen1.

TABLES: z_employees.

DATA: wa_employee LIKE zemployees-employee.

INITIALIZATION.

  SELECT * FROM zemployees.
    wa_employee = zemployees-employee. " Work Area is reset after every loop pass
  ENDSELECT.

WRITE: / wa_employees-employee. "Write data of last employee (earlier ones are lost)


* At Selection Screen

TABLES: zemployees.

DATA: wa_employee LIKE zemployees-employee.

PARAMETERS: my_ee LIKE zemployees-employee.

INITIALIZATION.

  SELECT * FROM zemployees.
    wa_employee = zemployees-employee.
  ENDSELECT.

AT SELECTION-SCREEN ON my_ee.
  IF my_ee > wa_employee. "Check if employee number is greater than the last employee number in table
    MESSAGE e000(ZMES1) with my_ee. " Text Message (stored in table T100)
  ENDIF.


* Parameter Statement

TABLES: zemployees, ZEMPLOYEES2.

PARAMETERS: my_ee LIKE zemployees-employee DEFAULT '123456789' OBILIGATORY, "A small tickbox will appear in the field when empty, to indicate that a value must be inserted here.
            my_surn LIKE zemployees-surname DEFAULT 'BLOGS' LOWER CASE,
            my_dob LIKE zemployees-dob,
            my_box1 as checkbox,
            wa_green radiobutton group grp1,
            wa_blue radiobutton group grp2,
            wa_red radiobutton group grp3,
            my_g LIKE zemployees2-gender VALUE CHECK, "it will check any entry against the valid value list which is created in the ABAP dictionary
            my_numbr LIKE type i.


* SELECT-OPTIONS Example

SELECT-OPTIONS my_dob FOR zemployees-dob NO-EXTENSION.

SELECT * FROM zemployees.
  IF zemployees-dob in my_dob.
    WRITE: / zemployees.
  ENDIF.
ENDSELECT.


* TEXT Symbols

WRITE: / 'Surname'.

WRITE: / text-001. "placeholder for text (defined inside text elements -> text symbols)


* SKIP LINES and UNDERLINE

PARAMETERS: my_ee LIKE zemployees-employee DEFAULT '123456789' OBILIGATORY.  

SELECTION-SCREEN SKIP 2.
SELECTION-SCREEN SKIP ULINE.
SELECTION-SCREEN SKIP. "no value entered so default 1 line will be skipped
SELECTION-SCREEN ULINE /40(8). "sets the position of the line to the 40th character from the left of the screen, and its length is set to 8 characters

PARAMETERS:             my_box1 as checkbox, "the PARAMETERS chain is now broken, so another PARAMETERS statement must be added
            wa_green RADIOBUTTON GROUP grp1,
            wa_blue  RADIOBUTTON GROUP grp2,
            wa_red   RADIOBUTTON GROUP grp3.

SELECT-OPTIONS my_dob FOR zemployees-dob NO-EXTENSION.


* COMMENTS

SELECTION-SCREEN COMMENT /40(15) text-001. "Comments allow text to be placed on screen without creating new fields.
SELECTION-SCREEN COMMENT /40(15) comm1.

INITIALIZATION.
  
  comm1 = 'Hello SAP'. "it is initialised when the program starts.


* Format a Line and Position

SELECTION-SCREEN BEGIN OF LINE. "Anything appearing between these statements will now all appear on the same line. 
SELECTION-SCREEN COMMENT 1(15) text-001.
SELECTION-SCREEN COMMENT 20(10) comm1.
PARAMETER ABC(5).
SELECTION-SCREEN POSITION 30.
SELECTION-SCREEN POSITION pos_high. "The default positions of parameters and select-options on the screen are referred to as ‘position low’ for the left hand side
SELECTION-SCREEN END OF LINE.








