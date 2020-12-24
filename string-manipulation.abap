DATA: title(15) TYPE c VALUE 'Mr',
      surname(40) TYPE c VALUE 'Smith',
      forename(40) TYPE c VALUE 'Joe',
      sep, "the size of sep has not been defined so default will be set (1 character)
      destination(200) TYPE c,
      spaced_name(20) TYPE c VALUE 'Mr    Joe    Smith',
      len TYPE i,
      surname2(40). "the type is not defined so default will be set (Type c)

* Concatenate

CONCATENATE title surname forename into destination. "there is no sep here
WRITE / destination. "MrSmithJoe 
ULINE.

CONCATENATE title surname forename into destination SEPARATED BY sep.
WRITE / destination. "Mr Smith Joe 
ULINE.

* Condense

CONDENSE spaced_name. "leaves 1 space here
WRITE / spaced_name. "Mr Joe Smith
ULINE.

CONDENSE spaced_name NO-GAPS. "leaves no spaces here
WRITE / spaced_name. "MrJoeSmith
ULINE.

* Length

len = strlen( surname ).
WRITE: / 'The length of the surname is', len. "The length of the surname is 5
ULINE.

* Replace

surname2 = 'Mr, Joe Smith'.
REPLACE ',' WITH '.' INTO surname2.
WRITE / surname2. "Mr. Joe Smith
ULINE.

* Search

surname2 = 'Mr Joe Smith'.
SEARCH surname2 for 'Joe'.
WRITE: / 'sy-subrc: ', sy-subrc , / 'sy-fdpos: ', sy-fdpos. "sy-subrc identifies whether the search was successful or not, and sy-fdpos is set to the position of the character string searched for in surname2
ULINE. " When the sy-subrc = 0 this refers to a successful search. When sy-subrc = 4 this indicates that the search was unsuccessful.

SEARCH surname2 for '.Joe   .'. "this time, the system will search for the full string, including the blanks
WRITE: / 'sy-subrc: ',sy-subrc, / 'sy-fdpos: ', sy-fdpos.
ULINE.

SEARCH surname2 for '*ith'. "this time, we use a wild card character ‘*’ and will search for any words ending in ‘ith’
WRITE: / 'sy-subrc: ',sy-subrc, / 'sy-fdpos: ', sy-fdpos.
ULINE.

SEARCH surname2 for 'Smi*'. "this time to search for words beginning with ‘Smi’, which again should be successful.
WRITE: / 'sy-subrc: ',sy-subrc, / 'sy-fdpos: ', sy-fdpos.
ULINE.










