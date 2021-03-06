
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


* Filling Internal Tables with Work Area

 "refer to table definition in the second section (New Style Internal Table with Separate Work Area)

SELECT surname dob FROM zemployees "fill using SELECT statement
  INTO wa_itab02.
  APPEND wa_itab02 to itab02.
ENDSELECT.

SELECT * FROM zemployees "fill using array fetch
  INTO CORRESPONDING FIELDS OF TABLE itab02.


* Using Internal Tables One Line at a Time

LOOP AT itab01. "the header line is filled with data before being written to the output screen:
  WRITE: / itab01-surname, itab01-forename. 
ENDLOOP.


* Modify

LOOP AT itab01.
  IF itab01-surname = 'JONES'. "the MODIFY statement here will not create a brand new record, but will replace the existing JONES record in the table.
    itab01-surname = 'SMITH'.
    MODIFY itab01.
  ENDIF.
ENDLOOP.


* Describe and Insert

DESCRIBE TABLE itab01 LINES line_cnt. "This statement can be used to find out information about the content of an internal table, including the number of records the table holds, the reserve memory space used, and the type of table it is

INSERT itab01 INDEX line_cnt. "the APPEND statement automatically inserts the new record at the end of the table. If you want to add a record somewhere in the middle, the INSERT statement should be used. 


* Read Records

READ TABLE itab01 INDEX 5. "Read with index can be upto 14 times faster than table key

READ TABLE itab01 WITH KEY "If there are multiple occurences (a non-unique key like surname is used), then system will sequentially select them
      employee = 10000007.


* Delete Records

DELETE itab02 INDEX 5. "Note this only applies to standard and sorted tables as only these two types of tables have an index.

DELETE itab01 WHERE surname = 'SMITH'. "this can be combined with other logic to locate the record(s) which should be deleted


* Sort Records

SORT itab01. "Without any additions, this will sort the records in ascending order by the table’s unique key. 

SORT itab01 BY surname. "If you are sorting by language-specific criteria, AS TEXT should be added between the table name and BY addition

SORT itab01 AS TEXT BY surname forename. "you can list up to 250 fields if desired

SORT itab01 BY surname forename AS TEXT. "If you only wanted AS TEXT to apply to forename

SORT itab01 DESCENDING AS TEXT BY surname forename. "By default, the system will sort records in ascending order but this can be changed to descending

* Work Area Differences

LOOP at itab02 INTO wa_itab02. 
  IF wa_itab02-surname = 'JONES'.
    wa_itab02-surname = 'SMITH'.
    MODIFY itab02 FROM wa_itab02. "Modify
  ENDIF.
ENDLOOP.

DESCRIBE TABLE itab02 LINES line_cnt.
  INSERT wa_itab02 INTO itab02 INDEX line_cnt. "Insert


* Delete a Table with a Header Line

CLEAR itab01. "Clears the header line only 
CLEAR itab01[]. "Clears the body

REFRESH itab01. "Clears all records from the table, but it does not clear the header record

FREE itab01. "Clears out not only the internal table, but also frees up the memory which it was using.


* Delete a Table with Work Area

CLEAR itab01. "Clears the whole contents of the table (one without a HEADER file) without needing to add the [].
CLEAR wa_itab01. "Another CLEAR statement must be used to empty the work area

REFRESH itab01. "The same applies to the REFRESH and FREE statements. 
CLEAR wa_itab01.

FREE itab01.
CLEAR wa_itab01.










