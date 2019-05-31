#!/usr/bin/gawk
#--------------------------------------------------------------------------
# Author     : mitchell
# Purpose    : AWK math functions
# Last Update: Thu 23 Aug 2018 10:16:35 AM CEST
#--------------------------------------------------------------------------
###########################################################################
###          fundamentals
###########################################################################
## abs returns the absolute value of x
function abs(x) {
    return ( x > 0) ? x : -x
}

## pow returns x**y, the base-x exponential of y
function pow(x, y) {
    return x ^ y
}

## floor returns the greatest integer value less than or equal to x
function floor(x) {
    if (int(x) == x) {
        return x;
    } else if (x > 0){
        return int(x);
    } else {
        return int(x) - 1;
    }
}

## ceil returns the least integer value greater than or equal to x.
function ceil(x) {
    if (int(x) == x) {
        return x;
    } else if (x > 0) {
        return int(x) + 1;
    } else {
        return x;
    }
}

## round returns the rounded value to x
function round(x) {
    if (x > 0) {
        return int(x + 0.5);
    } else {
        return int(x - 0.5);
    }
}

## returns "number" rounded to the nearest integer
function rint(num,    n) {
  if (num < 0) {
    return (num - (n = int(num)) < -.5) ? n - 1 : n;
  } else {
    return (num - (n = int(num)) >= .5) ? n + 1 : n;
  }
}

## max returns the larger of x or y
function max(x, y) {
    return (x > y ? x : y)
}

## min returns the smaller of x or y
function min(x, y) {
    return (x < y ? x : y)
}

## min3 returns the smaller of x, y or z
function min3(x, y, z,    result) {
    result = x
    if (y < result) {
        result = y
    }
    if (z < result) {
        result = z
    }
    return result
}

## get sign of 'x'
function sign(x) {
    return x < 0 ? "-" : "+"
}

## log base 10 of x
function log10(x) {
    log(x) / log(10)
}

## log base 2 of x
function log2(x) {
    log(x) / log(2)
}

## degree to radian
function d2r(deg) {
    return deg * atan2(0, -1) / 180
}

## radian to degree
function r2d(rad) {
    return rad * 180 / atan2(0, -1)
}

## hypot 2 numbers
function hypot(x, y) {
    return sqrt(x ^ 2 + y ^ 2)
}

## hypot 3 numbers
function hypot3(x, y, z) {
    return sqrt(x ^ 2 + y ^ 2 + z ^ 2)
}
###########################################################################
###          simple algorithms
###########################################################################
function factorial(n) {
    if (n == 0)
        return 1;
    else
       return n*factorial(n-1);
}

## usage: gcd(a, b)
## returns the greatest common denominator (greatest common factor) of a
## and b. both a and b must be positive integers. Uses the recursive
## Euclid algorithm.
function gcd(a, b,    f) {
    # check to make sure both numbers are positive ints
    if (!f) {
        if (a !~ /^[0-9]+$/ || !a || b !~ /^[0-9]+$/ || !b) {
            return 0;
        }
    }
    if (b) {
        return gcd(b, a % b, 1);
    } else {
        # return the absolute value
        return a < 0 ? -a : a;
    }
}

## usage: lcm(a, b)
## returns the least common multiple of a and b. both a and b must be
## positive integers.
function lcm(a, b,    m, l) {
    # check to make sure both numbers are positive ints
    if (a !~ /^[0-9]+$/ || !a || b !~ /^[0-9]+$/ || !b) {
        return 0;
    }
    m = 0;
    while ((l = ++m * a) % b);

    return l;
}

## converts degrees to radians
function deg_to_rad(deg,    tau) {
    tau = 8 * atan2(1,1);
    return (deg/360) * tau;
}

## converts radians to degrees
function rad_to_deg(rad,    tau) {
    tau = 8 * atan2(1,1);
    return (rad/tau) * 360;
}

###########################################################################
###          constants
###########################################################################
## usage: calc_e()
## approximates e by calculating the sumation from k=0 to k=50 of 1/k!
## returns 10 decimal places
function calc_e(lim,    e, k, i, f) {
    for (k=0; k<=50; k++) {
        # calculate factorial
        f = 1;
        for (i=1; i<=k; i++) {
            f = f * i;
       }
       # add to e
       e += 1 / f;
    }
    return sprintf("%0.10f", e);
}

## returns pi, with an accuracy of 10 decimal places
function calc_pi() {
    return sprintf("%0.10f", atan2(0, -1));
}

## returns tau, with an accuracy of 10 decimal places
function calc_tau() {
    return sprintf("%0.10f", 2 * atan2(0, -1));
}

###########################################################################
###          trigonometry
###########################################################################
## returns the tangent of expr, which is in radians
function tan(ang) {
    return sin(ang)/cos(ang);
}

## usage: csc(expr)
## returns the cosecant of expr, which is in radians
function csc(ang) {
    return 1/sin(ang);
}

## usage: sec(expr)
## returns the secant of expr, which is in radians
function sec(ang) {
    return 1/cos(ang);
}

## usage: cot(expr)
## returns the cotangent of expr, which is in radians
function cot(ang) {
    return cos(ang)/sin(ang);
}
###########################################################################
###          random
###########################################################################
# randint - return random integer x, 1 <= x <= n
function randintr(n) {
    return int(n * rand()) + 1
}

# randletter - generate random lower-case letter
function randletter() {
    return substr("abcdefghijklmnopqrstuvwxyz", randint(26), 1)
}

function check(A, n,    i) {
    for (i = 1; i < n; i++)
        if(A[i] > A[i+1])
            printf("array is not sorted, element %d\n",i)
}

function genrand(A,n,   i) { # put n random integers in A
    for (i = 1; i <= n; i++)
        A[i] = int(n*rand())
}

function gensort(A,n,   i) { # put n sorted integers in A
    for (i = 1; i <= n; i++)
    A[i] = i
}

function genrev(A,n,   i) { # put n reverse-sorted integers
    for (i = 1; i <= n; i++) #in A
        A[i] = n+1-i
}

function genid(A,n,   i) { # put n identical integers in A
    for (i = 1; i <= n; i++)
        A[i] = 1
}

###########################################################################
###          checks
###########################################################################
## returns 1 if "string" is a valid integer, otherwise 0
function isint(str) {
    if (str !~ /^-?[0-9]+$/) {
        return 0;
    }
    return 1;
}

## returns 1 if "string" is a valid number, otherwise 0
function isnum(str) {
    # use a regex comparison because 'str == str + 0' has issues with
    # some floats
    if (str !~ /^-?[0-9.]+$/ || str ~ /\..*\./) {
        return 0;
    }
    return 1;
}

## usage: isprime(number)
## returns 1 if "number" is a prime number, otherwise 0. "number" must be a
## positive integer
function isprime(num,    i, s) {
    # check to make sure "num" is a valid positive int (and not 1)
    if (num !~ /^[0-9]+$/ || num <= 1) {
        return 0;
    }
    # 1, 2, and 3 are prime
    if (num <= 3) {
        return 1;
    }
    # check if even or divisible by 3
    if (!(num % 2) || !(num % 3)) {
        return 0;
    }
    # use naive method, fermats little theorem had overflow and did not work
    # for primes larger than 1021
    s = sqrt(num);
    for (i=5; i<=s; i+=2) {
        if (!(num % i)) {
            return 0;
        }
    }
    return 1;
}

function isfloat(x) {
    return x ~ /^-?(([0-9]+\.[0-9]*)|(\.?[0-9]+))([eE][-+][0-9]+)?$/
}

function iscomplex(x) {
    return x ~ /^\(-?(([0-9]+\.[0-9]*)|(\.?[0-9]+))([eE][-+][0-9]+)?,-?(([0-9]+\.[0-9]*)|(\.?[0-9]+))([eE][-+][0-9]+)?\)$/
}

###########################################################################
###          complex
###########################################################################
function complexdiff(a, b,    as, bs) {
    gsub(/[()]/,"", a)
    sub(/,/," ", a)
    gsub(/[()]/,"", b)
    sub(/,/," ", b)
    split(a, as)
    split(b, bs)
    return abs(as[1] - bs[1]) + abs(as[2] - bs[2]);
}
###########################################################################
###                                   EOF
###########################################################################
