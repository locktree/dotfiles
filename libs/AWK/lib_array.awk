#!/usr/bin/gawk -f
#--------------------------------------------------------------------------
# Author     : mitchell
# Purpose    : AWK array functions library
# Last Update: Thu 23 Aug 2018 10:16:39 AM CEST
#--------------------------------------------------------------------------
## return the absolute value
function absolute(x) {
    return ( x > 0) ? x : -x
}

## isEmpty returns 1 if arr has one or more elements
function isEmpty(arr,     i) {
    for (i in arr) {
        return 0
    }
    return 1
}

## copy the array
function acopy(arr1, arr2,    i) {
    for (i in arr1) {
        arr2[i] = arr1[i];
    }
}

## return the size of the array
function sizeof(arr,    i, count) {
    for (i in arr) {
        count++
    }
    return count
}

## check if the array contains the value
function hasValue(arr, value,    k) {
    for (k in arr) {
        if (arr[k] == value) {
            return 0
        }
    }
    return 1
}

## check if arrays are equal
function equals(arr1, arr2) {
    if (sizeof(arr1) != sizeof(arr2)) {
        return 0
    }
    for (i in arr1) {
        if (arr1[i] != arr2[i]) {
            return 0
        }
    }
    return 1
}

## delete an array
function clear(arr) {
    for (i in arr) {
        delete arr[i]
    }
}

function MedianArray(array) {
    cnt=asort(array, sorted_array)
    mod=cnt%2
    if ( mod==1 ) {
        val1=(cnt/2)+0.5
        median=sorted_array[val1]
    } else {
        val1=(cnt/2)
        val2=(cnt/2)+1
        median=((sorted_array[val1] + sorted_array[val2])/2)
    }
    return median
}

function MinArray(array) {
    cnt=asort(array,sorted_array)
    return sorted_array[1]
}

function MaxArray(array){
    cnt=asort(array,sorted_array)
    return sorted_array[cnt]
}

function StdDevArray(array){
    cnt=asort(array,sorted_array)
    stddev=0
    if (cnt>0) {
        avg=AverageArray(array)
        sqrtTOT=0
        for (i=1;i<=cnt;i++) {
            sqrtTOT+=(absolute(array[i]-avg)*absolute(array[i]-avg))
        }
        stddev=sqrt(sqrtTOT/(cnt-1))
    }
    return stddev
}

function AverageArray(array) {
    cnt=asort(array,sorted_array)
    avg=0
    if(cnt>0) {
        sum=SumArray(array)
        avg=sum/cnt
    }
    return avg
}

function SumArray(array) {
    cnt=asort(array)
    sum=0
    for (i=1;i<=cnt;i++) {
        sum+=array[i]
    }
    return sum
}

function calcVariance(array){
    cnt=asort(array,sorted_array)
    avg=calcMean(array);
    for(i=1;i<=cnt;i++){
        totdiff+=(array[i]-avg)*(array[i]-avg);
    }
    return totdiff/cnt;
}
###########################################################################
###                                   EOF
###########################################################################
