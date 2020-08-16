# -*- coding: utf-8 -*-
"""--------------------------------------------------------------------------------
description:
    
--------------------------------------------------------------------------------"""
'''----------------------------------------------------------------------
load modules
----------------------------------------------------------------------'''
import csv
import os
import time
import tkinter as tk
import tkinter.ttk as ttk



'''----------------------------------------------------------------------
main script (define script-global objects)
----------------------------------------------------------------------'''
'''--------------------
setting about time handling
--------------------'''
timeBegin=time.time()
timeLim=10000
tInterval=10


'''--------------------
setting about gui
--------------------'''
rootframe= tk.Tk()  # main gui window

# table display gui
treeview=ttk.Treeview(rootframe)
treeview["show"]= "headings"
treeview["columns"]=(1,2)
treeview.heading(1, text="variable")
treeview.heading(2, text="value")
treeview.pack()



'''----------------------------------------------------------------------
define sub-routines
----------------------------------------------------------------------'''
def readcsv():
    curDir=os.getcwd()  # get directory of this script
    
    # open and read simulation data csv
    with open(curDir+'\pyConsole00_data.csv') as dataFile:
        reader = csv.reader(dataFile)
        i=0
        dataMatrix=[]
        for row in reader:
            dataMatrix.append(row)
            i=i+1
            nCol= len(row)
        #***** end for *****
    #***** end with *****
    nRow=i
    
    return dataMatrix, nRow, nCol
#***** end def *****


'''---------------------------------------------------------'''
def mainroutine():
    global rootframe
    
    # read data csv
    [dataMatrix, nRow, nCol]= readcsv()
    
    x = treeview.get_children()
    
    # delete table displayed on window
    for item in x:
        treeview.delete(item)
    #----- end for -----
    
    # re-display info of scv data
    timeRunning= time.time() - timeBegin
    treeview.insert("","end",values=("time (in python script)", timeRunning))
    
    i=0
    for i in range(nRow):
        treeview.insert("","end",values=(dataMatrix[i][0],dataMatrix[i][1]))
    #***** end for *****
    
    # command of recursive call, with specific time interval
    rootframe.after(tInterval, mainroutine)
#***** end def *****



'''----------------------------------------------------------------------
main script
----------------------------------------------------------------------'''
# read data csv
[dataMatrix, nRow, nCol]= readcsv()

# display info of scv data
timeRunning= time.time() - timeBegin
treeview.insert("","end",values=("time(in python script)", timeRunning))
i=0
for i in range(nRow):
    treeview.insert( "","end",values=(dataMatrix[i][0],dataMatrix[i][1]) )
#***** end for *****


# call routine of display & update, with specific time interval
rootframe.after(tInterval, mainroutine)

# continue display & update of csv data until window is closed
rootframe.mainloop()

