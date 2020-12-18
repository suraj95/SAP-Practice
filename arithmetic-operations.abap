* It is not just the products of variables which can be calculated in calculations, but also 
* individual literal values, or a mixture of the two:

DATA integer01 TYPE i VALUE 22.
DATA packed_decimal01 TYPE p DECIMALS 1 VALUE '-5.5'.

DATA result1 LIKE packed_decimal01.


* Addition
result1 = integer01 + packed_decimal01. "16.5

write / result1.

DATA result2 LIKE integer01.

result2 = integer01 + 10. "32

write / result2.

* Subtraction 
DATA result3 LIKE integer01.

result3 = integer01 - 10. "12

write / result3.

* Division
DATA result4 LIKE integer01.

result4 = integer01 / 2. "11

write / result4.

* Multiplication
DATA result5 LIKE integer01.

result5 = integer01 * 5. "110

write / result5.

