
* Old Style Internal Table

DATA: BEGIN OF itab01 OCCURS 0, "OCCURS tells SAP that an internal table is being created, and the 0 here states that it will not contain any records initially.
        surname LIKE zemployees-surname, 
        dob     LIKE zemployees-dob,
      END OF itab01.


* New Style Internal Table with Separate Work Area

TYPES: BEGIN OF line01_typ, "Line type defined here
        surname LIKE zemployees-surname,
        dob     LIKE zemployees-dob,
       END OF line01_typ.
TYPES itab02_typ TYPE STANDARD TABLE OF line01_typ. "Table type defined here
DATA itab02 TYPE itab02_typ. "Table defined here 
DATA wa_itab02 TYPE line01_typ. "Create separate work area

"This new style seems more verbose than the old style, but we can easily create new tables with 
"the same structure using the new style

TYPES itab03_typ TYPE SORTED TABLE OF line01_type WITH UNIQUE KEY surname. "This type is defined for a Sorted Table
DATA itab03 TYPE itab03_typ. 
DATA itab04 TYPE itab03_typ. 


* Internal Table with Header Line (Old Style)

TABLES: BEGIN itab01 OCCURS 0,
        employee  LIKE zemployees-employee,
        surname   LIKE zemployees-surname,
        forename  LIKE zemployees-forename,
        title     LIKE zemployees-title,
        dob       LIKE zemployees-dob,
        los       TYPE i VALUE 3, "length of service
END OF itab01.

"Move the records from the original table into the new internal table into the fields 
"where the names correspond

SELECT * from zemployees 
  INTO CORRESPONDING FIELDS OF TABLE itab01. 

"A different way of filling the table would be with the code below, this time with a select 
"loop filling each field one at a time, using the MOVE statement to move the data from one 
"table’s field to the other.

SELECT * FROM zemployees.
  MOVE zemployees-employee  TO itab01-employee,
  MOVE zemployees-surname   TO itab01-surname,
  MOVE zemployees-forename  TO itab01-forename,
  MOVE zemployees-title     TO itab01-title,
  MOVE zemployees-dob       TO itab01-dob, "los is not present here since it does not have a field in the zemployees table
APPEND itab01. "if append is not added, the header record will simply get overwritten in each iteration of loop
ENDSELECT.


* Move-Corresponding

SELECT * FROM zemployees
  MOVE-CORRESPONDING zemployees to itab01. "you need to make sure that both fields have matching data types and lengths

  APPEND itab01.
ENDSELECT.

DATA: BEGIN OF itab05 OCCURS 0,
      INCLUDE STRUCTURE itab01. "include table structure from an internal table 
      INCLUDE STRUCTURE zemployees. "include table structure from ABAP dictionary
DATA END OF itab05.

SELECT * FROM zemployees INTO CORRESPONDING FIELDS OF TABLE itab01.

SELECT surname forename dob FROM zemployees INTO CORRESPONDING FIELDS OF TABLE itab01. "if you want to specifically move certain fields



