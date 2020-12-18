* It is not just the products of variables which can be calculated in calculations, but also 
* individual literal values, or a mixture of the two:

DATA integer01 TYPE i VALUE 22.
DATA packed_decimal01 TYPE p DECIMALS 1 VALUE '-5.5'.

DATA result LIKE packed_decimal01.

result = integer01 + packed_decimal01.

write result.

DATA result2 LIKE integer01.

result2 = integer01 + 10.

write result2.


