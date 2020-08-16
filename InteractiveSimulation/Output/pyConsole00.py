# -*- coding: utf-8 -*-
"""------------------------------------------------------------
description:
    
------------------------------------------------------------"""
import csv
import os
import time
import sys
import pygame
import tkinter as tk
import tkinter.ttk as ttk


"""----------------------------------------------------------------------
main script (define global objects)
----------------------------------------------------------------------"""
timeBegin=time.time()
timeLim=10000
tInterval=10

rootframe= tk.Tk()

treeview=ttk.Treeview(rootframe)
treeview["show"]= "headings"
treeview["columns"]=(1,2)

treeview.heading(1, text="variable")
treeview.heading(2, text="value")
treeview.pack()



"""----------------------------------------------------------------------
define sub-routines
----------------------------------------------------------------------"""
def readcsv():
    curDir=os.getcwd()
    
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
def main():
    global rootframe
    
    [dataMatrix, nRow, nCol]= readcsv()
    x = treeview.get_children()
    
    for item in x: ## Changing all children from root item
        treeview.delete(item)
    #----- end for -----
    
    i=0
    for i in range(nRow):
        treeview.insert("","end",values=(dataMatrix[i][0],dataMatrix[i][1]))
    #***** end for *****
    
    rootframe.after(tInterval, main)
#***** end def *****



"""----------------------------------------------------------------------
main script
----------------------------------------------------------------------"""
[dataMatrix, nRow, nCol]= readcsv()

i=0
for i in range(nRow):
    treeview.insert("","end",values=(dataMatrix[i][0],dataMatrix[i][1]))
#***** end for *****


rootframe.after(tInterval, main)
rootframe.mainloop()

    



