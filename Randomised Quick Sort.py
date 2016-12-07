#The random function helped generate random numbers as an input.
#The timeit library help calculate the time the program took to run.
import random
import timeit
def quicksort(sortinglist, low, high):
    if (low < high):
        p = partition(sortinglist, low, high)
        quicksort(sortinglist, low, p - 1)
        quicksort(sortinglist, p + 1, high)

def partition(sortinglist,low,high):
    pivot = low+1
    sortinglist[low] , sortinglist[pivot] = sortinglist[pivot],sortinglist[low]
    i = low + 1
    pivot = sortinglist[low]
    for j in range(low+1, high+1):
        if (sortinglist[j] < pivot):
            sortinglist[i] , sortinglist[j] = sortinglist[j] , sortinglist[i]
            i += 1

    pos = i-1
    sortinglist[pos] , sortinglist[low] = sortinglist[low] ,sortinglist[pos]

    return (pos)

sortinglist = []
length = 0
#The range gives the length of the list
sortinglist = [1,2,3,4    ]
for i in sortinglist:
    length+=1
starttime = timeit.default_timer()
quicksort(sortinglist,0,length-1)
stoptime = timeit.default_timer()
completetime = stoptime - starttime
print("The run time is"),completetime
print sortinglist

