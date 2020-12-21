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














