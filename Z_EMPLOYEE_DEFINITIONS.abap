*&-------------------------------------------------------------------------------------------
*&  Include                          Z_EMPLOYEE_DEFINITIONS
*&-------------------------------------------------------------------------------------------

TYPES: BEGIN OF line01_typ, "Line type defined here
        surname LIKE zemployees-surname,
        dob     LIKE zemployees-dob,
       END OF line01_typ.

TYPES itab02_typ TYPE STANDARD TABLE OF line01_typ. "Table type defined here
DATA itab02 TYPE itab02_typ. "Table defined here 
DATA wa_itab02 TYPE line01_typ. "Create separate work area
