
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
* Check to make sure the employee number is not greater than the last employee number in table
  IF my_ee > wa_employee.
* Display a Message
  ENDIF.







