************************************************************************
file with basedata            : md170_.bas
initial value random generator: 2016177572
************************************************************************
projects                      :  1
jobs (incl. supersource/sink ):  16
horizon                       :  100
RESOURCES
  - renewable                 :  2   R
  - nonrenewable              :  2   N
  - doubly constrained        :  0   D
************************************************************************
PROJECT INFORMATION:
pronr.  #jobs rel.date duedate tardcost  MPM-Time
    1     14      0       18       12       18
************************************************************************
PRECEDENCE RELATIONS:
jobnr.    #modes  #successors   successors
   1        1          3           2   3   4
   2        3          1          12
   3        3          2           6   7
   4        3          3           5   8   9
   5        3          3          10  12  13
   6        3          3           8   9  11
   7        3          3          11  12  14
   8        3          1          13
   9        3          3          13  14  15
  10        3          2          11  14
  11        3          1          15
  12        3          1          15
  13        3          1          16
  14        3          1          16
  15        3          1          16
  16        1          0        
************************************************************************
REQUESTS/DURATIONS:
jobnr. mode duration  R 1  R 2  N 1  N 2
------------------------------------------------------------------------
  1      1     0       0    0    0    0
  2      1     2       0    7    5    5
         2     6       0    4    3    4
         3     6       0    2    3    5
  3      1     9       0    9    3    3
         2     9       1    0    3    3
         3    10       0    9    3    1
  4      1     4       8    0    9    6
         2     7       6    0    9    4
         3     7       5    0    8    5
  5      1     2       4    0    9    4
         2     4       4    0    4    4
         3     8       4    0    2    4
  6      1     5       0    2    4    5
         2     9       7    0    4    4
         3     9       9    0    3    5
  7      1     3       3    0    9    2
         2     3       0    4    9    2
         3     7       0    1    7    1
  8      1     1       6    0    6    9
         2     1       6    0    5   10
         3     6       5    0    5    6
  9      1     1       9    0    4    9
         2     1       0    8    3    8
         3     8       8    0    3    8
 10      1     2       0    7    9    8
         2     5       6    0    9    6
         3     6       0    2    9    5
 11      1     1       0   10    7    8
         2     2       5    0    6    6
         3     3       0   10    5    6
 12      1     3       0    5    6    7
         2     5       7    0    5    6
         3     7       6    0    2    5
 13      1     1       0    4    5    9
         2     4       0    4    5    7
         3     9       0    4    4    6
 14      1     1       0    6    1    1
         2     1       5    0    1    1
         3     4       4    0    1    1
 15      1     3       4    0    6    8
         2     9       0    5    5    7
         3    10       0    5    3    5
 16      1     0       0    0    0    0
************************************************************************
RESOURCEAVAILABILITIES:
  R 1  R 2  N 1  N 2
   13   14   71   73
************************************************************************