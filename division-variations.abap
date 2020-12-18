* In ABAP, there are three ways in which numbers can be divided

DATA numa TYPE p DECIMALS 2 VALUE '5.45'.
DATA numb TYPE p DECIMALS 2 VALUE '1.48'.

* Standard form

DATA result1 TYPE P DECIMALS 2.

result1 = numa / numb. "3.68

write / result1.

* Integer form

DATA result2 TYPE P DECIMALS 2.

result2 = numa DIV numb. "3.00

write / result2.

* Remainder form

DATA result3 TYPE P DECIMALS 2.

result3 = numa MOD numb. "1.01

write / result3.




