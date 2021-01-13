
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
    WRITE: / 'Employee not found!'. "Display a Message
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







