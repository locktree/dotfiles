@include "lib_string.awk"
@include "lib_time.awk"
@include "lib_array.awk"
@include "lib_math.awk"
@include "lib_os.awk"

function assert(val1, val2, string) {
    if (val1 == val2) {
        print "OK:", string
    }
    else {
        print "Assertion fail:", string, "(" val1, "!=", val2 ")"
        exit
    }
}

BEGIN {
    print "#################################################"
    print "###    TESTCASES STRING UTILITY           #######"
    print "#################################################"
    assert(rep("word",3)    , "wordwordword"            , "rep")
    assert(rep("word one",3), "word oneword oneword one", "rep")

    assert(hasprefix("this is my line", "this"), 1, "has_prefix")
    assert(hasprefix("this is my line", "This"), 0, "has_prefix")

    assert(hassuffix("this is my line", "line"), 1, "has_suffix")
    assert(hassuffix("this is my line", "Line"), 0, "has_suffix")

    assert(trim("one        ")     , "one", "trim")
    assert(trim("        one")     , "one", "trim")
    assert(trim("        one     "), "one", "trim")

    assert(trim11("one        ")     , "one", "trim11")
    assert(trim11("        one")     , "one", "trim11")
    assert(trim11("        one     "), "one", "trim11")

    assert(trimleft("one        ")     , "one        ", "trimleft")
    assert(trimleft("        one")     , "one",         "trimleft")
    assert(trimleft("        one     "), "one     ",    "trimleft")

    assert(trimright("one        ")     , "one", "trimright")
    assert(trimright("        one")     , "        one",         "trimright")
    assert(trimright("        one     "), "        one",    "trimright")

    assert(rev("  hello  "), "  olleh  ", "rev")
    assert(rev("hello  "), "  olleh", "rev")
    assert(rev("  hello"), "olleh  ", "rev")

    print "#################################################"
    print "###    TESTCASES TIME UTILITY             #######"
    print "#################################################"
    assert(month_to_num("January"), 1,"month_to_num")
    assert(month_to_num("Jan"),     1,"month_to_num")

    assert(day_to_num("Monday"),1,"day_to_num")
    assert(day_to_num("Mon"),   1,"day_to_num")

    assert(hr_to_sec("00:05:03"), 303       ,"hr_to_sec")
    assert(sec_to_hr(500),       "00:08:20" ,"sec_to_hr")
    assert(ms_to_hr(116529),     "1m56.529s","ms_to_hr")

    assert(isleap(2016), 1, "isleap")
    assert(isleap(2017), 0, "isleap")
    assert(isleap(2018), 0, "isleap")
    assert(isleap(2019), 0, "isleap")
    assert(isleap(2020), 1, "isleap")

    print "#########################################"
    print "###   TESTCASES ARRAY UTILITY     #######"
    print "#########################################"
    message[1]="1"
    message[2]="2"
    message[3]="3"
    other[1]="1"
    other[2]="2"
    other[3]="3"

    print "Check absolute function"
    assert(absolute(  "1.5"), 1.5, "absolute integer")
    assert(absolute( "-1.5"), 1.5, "absolute integer")
    assert(absolute(   1.5 ), 1.5, "absolute integer")
    assert(absolute(  -1.5 ), 1.5, "absolute integer")

    assert(isEmpty( message  ), 0, "isEmpty")
    assert(isEmpty( message1 ), 1, "isEmpty")

    assert(sizeof( message ),  3, "sizeof")
    assert(sizeof( unkown ), 0, "sizeof")

    assert(hasValue( message,1  ),   0, "hasValue")
    assert(hasValue( message,99 ),   1, "hasValue")
    assert(hasValue( message,"1"  ), 0, "hasValue")
    assert(hasValue( message,"99" ), 1, "hasValue")

    assert(equals( message,other ),  1, "equals")

    assert(MedianArray(  message ), 2, "MedianArray")
    assert(MinArray(     message ), 1, "MinArray")
    assert(MaxArray(     message ), 3, "MaxArray")
    assert(StdDevArray(  message ), 1, "StdDevArray")
    assert(AverageArray( message ), 2, "AverageArray")
    assert(SumArray(     message ), 6, "SumArray")

    print "#################################################"
    print "###        TESTCASES MATH UTILITY         #######"
    print "#################################################"
    assert(abs(-2.3), 2.3, "absolute integer")
    assert(abs(0)   ,   0, "absolute integer")
    assert(abs(2.3) , 2.3, "absolute integer")

    assert(pow(2,3) ,8 , "pow")
    assert(pow(-2,3),-8, "pow")

    assert(floor(5.9) ,  5, "floor")
    assert(floor(5.1) ,  5, "floor")
    assert(floor(-5.1), -6, "floor")
    assert(floor(-5.9), -6, "floor")

    assert(ceil(2.8), 3, "ceil")  ## doesn't work with negative values
    assert(ceil(3.1), 4, "ceil")

    assert(round(5.9) ,  6, "round")
    assert(round(5.1) ,  5, "round")
    assert(round(-5.1), -5, "round")
    assert(round(-5.9), -6, "round")

    assert(rint(5.9) ,  6, "rint")
    assert(rint(5.1) ,  5, "rint")
    assert(rint(-5.1), -5, "rint")
    assert(rint(-5.9), -6, "rint")

    assert(max(2,3) ,3 , "max")
    assert(max(3,2) ,3 , "max")
    assert(max(2,-3),2 , "max")
    assert(max(-3,2),2 , "max")

    assert(min(2,3) , 2, "min")
    assert(min(3,2) , 2, "min")
    assert(min(2,-3),-3, "min")
    assert(min(-3,2),-3, "min")

    assert(sign(-2) , "-", "sign")
    assert(sign(+2) , "+", "sign")
    assert(sign( 2) , "+", "sign")

    print "log10"
    print "log2"
    print "d2r"
    print "r2d"
    print "hypot"
    print "hypot3"

    assert(factorial(5) , 120, "factorial")
    assert(gcd(3,6) , 3 , "gcd")
    assert(lcm(4,16), 16, "lcm")

    assert(deg_to_rad(90), "1.5708", "deg_to_rad")
    assert(rad_to_deg(calc_pi()), "180", "rad_to_deg")

    assert(calc_e(),  "2.7182818285", "calc_e")
    assert(calc_pi(), "3.1415926536", "calc_pi")
    assert(calc_tau(),"6.2831853072", "calc_tau")

    assert(tan(calc_pi()), "1.02068e-11", "tan")
    assert(csc(calc_pi()), "-9.79737e+10", "csc")
    assert(sec(calc_pi()), "-1", "sec")
    assert(cot(calc_pi()), "9.79737e+10", "cot")

    assert(isint(5),    1 , "isint")
    assert(isint(5),   "1", "isint")
    assert(isint(5.1),  0 , "isint")
    assert(isint(5.1), "0", "isint")
    assert(isint(-5),   1 , "isint")
    assert(isint(-5),  "1", "isint")
    assert(isint(-5.1), 0 , "isint")
    assert(isint(-5.1),"0", "isint")

    assert(isfloat(5), 1, "isfloat")

    #print "primes from 1 through 10:";
    #for (i=1; i<=10; i++) {
    #    if (isprime(i)) {
    #        printf("%s ", $i);
    #    }

    print "#################################################"
    print "###        TESTCASES OS UTILITY           #######"
    print "#################################################"
    assert(isreadable("/home/mitchell/deze.laten.staan" ), "1", "isreadable")
    assert(isreadable("/home/mitchell/does.not.exists" ),  "0", "isreadable")

    assert(filesize( "/home/mitchell/deze.laten.staan" ), 4, "filesize")
    assert(filesize( "/home/mitchell/does.not.exists" ), -1, "filesize")

    #assert(filetype( "/home/mitchell/deze.laten.staan" ), f, "filetype")
    #assert(filetype( "/home/mitchell/does.not.exists" ), -1, "filetype")

    assert(dirname( "/home/mitchell/deze.laten.staan" ), "/home/mitchell", "dirname")
    assert(dirname( "/home/mitchell/does.not.exists" ),  "/home/mitchell", "dirname")

    assert(is_abs( "/home/mitchell/deze.laten.staan" ), 1, "dirname")
    assert(is_abs( "deze.laten.staan" ),  0, "dirname")

    assert(basename( "/home/mitchell/deze.laten.staan" ), "deze.laten.staan", "basename")
    assert(basename( "/home/mitchell/does.not.exists" ),  "does.not.exists", "basename")

    msg="some text"
    #printf("%s: %s\n", ARGV[0], msg)
    #print (time())

}
