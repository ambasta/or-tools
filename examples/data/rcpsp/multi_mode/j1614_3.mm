************************************************************************
file with basedata            : md206_.bas
initial value random generator: 137434060
************************************************************************
projects                      :  1
jobs (incl. supersource/sink ):  18
horizon                       :  133
RESOURCES
  - renewable                 :  2   R
  - nonrenewable              :  2   N
  - doubly constrained        :  0   D
************************************************************************
PROJECT INFORMATION:
pronr.  #jobs rel.date duedate tardcost  MPM-Time
    1     16      0       14        2       14
************************************************************************
PRECEDENCE RELATIONS:
jobnr.    #modes  #successors   successors
   1        1          3           2   3   4
   2        3          1           6
   3        3          3           5   7  12
   4        3          3          10  13  16
   5        3          3           8   9  11
   6        3          1          11
   7        3          3           8   9  10
   8        3          2          15  17
   9        3          3          13  15  16
  10        3          2          11  14
  11        3          2          15  17
  12        3          2          14  16
  13        3          1          14
  14        3          1          17
  15        3          1          18
  16        3          1          18
  17        3          1          18
  18        1          0        
************************************************************************
REQUESTS/DURATIONS:
jobnr. mode duration  R 1  R 2  N 1  N 2
------------------------------------------------------------------------
  1      1     0       0    0    0    0
  2      1     3       7    7    0    7
         2     6       6    6    4    0
         3    10       6    4    3    0
  3      1     3       8    6    6    0
         2     6       6    5    5    0
         3     9       5    3    5    0
  4      1     2       5    9    6    0
         2     8       2    7    0    4
         3    10       2    7    3    0
  5      1     1       6    4    9    0
         2     2       5    3    7    0
         3     5       3    3    0    4
  6      1     1       6    7    5    0
         2     3       4    7    3    0
         3     3       4    7    0    9
  7      1     3       8    9    5    0
         2     6       6    9    3    0
         3     9       5    9    0    7
  8      1     2       9    2    0    8
         2     5       8    1    7    0
         3     9       6    1    1    0
  9      1     2      10    6    0    9
         2     4       8    3    0    7
         3     9       6    2    9    0
 10      1     1       7    5   10    0
         2     8       5    4    0    5
         3    10       4    4    3    0
 11      1     1      10    7    5    0
         2     9       9    6    0    6
         3    10       8    6    0    6
 12      1     4       6   10    0   10
         2     6       4    7    2    0
         3    10       1    4    0    7
 13      1     1       5    4    0    8
         2     2       4    4    0    3
         3     8       3    4    1    0
 14      1     3       8    6    0    6
         2     6       7    5   10    0
         3    10       7    4    8    0
 15      1     4       7    3   10    0
         2     5       5    3    0    5
         3     8       5    3    7    0
 16      1     3       7    6    9    0
         2     4       4    2    0    6
         3     4       5    4    7    0
 17      1     2       5    8    3    0
         2     8       4    5    0    4
         3     9       4    5    2    0
 18      1     0       0    0    0    0
************************************************************************
RESOURCEAVAILABILITIES:
  R 1  R 2  N 1  N 2
   20   20   53   49
************************************************************************