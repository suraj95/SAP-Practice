
* Old Style Internal Table

DATA: BEGIN OF itab01 OCCURS 0, "OCCURS tells SAP that an internal table is being created, and the 0 here states that it will not contain any records initially.
        surname LIKE zemployees-surname, 
        dob     LIKE zemployees-dob,
      END OF itab01.


* New Style Internal Table with Separate Work Area

TYPES: BEGIN OF line01_typ,
        surname LIKE zemployees-surname,
        dob     LIKE zemployees-dob,
       END OF line01_typ.

"TYPES itab02_typ TYPE STANDARD TABLE OF line01_typ.
TYPES itab02_typ TYPE SORTED TABLE OF line01_type WITH UNIQUE KEY surname.

DATA wa_itab02 TYPE line01_typ. "create separate work area

DATA itab02 TYPE itab02_typ. "easily create new tables with the same structure
DATA itab03 TYPE itab02_typ. 



