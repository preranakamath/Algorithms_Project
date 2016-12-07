#The random function helped generate random numbers as an input.
#The timeit library help calculate the time the program took to run.
import random
import timeit
def quicksort(sortinglist,low,high):
    if(low < high):
        p = partition(sortinglist,low,high)
        quicksort(sortinglist,low,p-1)
        quicksort(sortinglist,p+1,high)


def partition(sortinglist,low,high):
    pivot = sortinglist[high]
    i = low-1
    for j in range(low,high):
        if(sortinglist[j] <= pivot):
            i+= 1
            sortinglist[i],sortinglist[j] = sortinglist[j],sortinglist[i]

    sortinglist[i+1] ,sortinglist[high] = sortinglist[high],sortinglist[i+1]

    return(i+1)

sortinglist = []
length = 0
#The range gives the length of the list
for x in range(100):
    list = random.randint(1,1000)
    sortinglist.append(list)
for i in sortinglist:
    length+=1
starttime = timeit.default_timer()
quicksort(sortinglist,0,length-1)
stoptime = timeit.default_timer()
completetime = stoptime - starttime
print ("The run time is"),completetime

print sortinglist

