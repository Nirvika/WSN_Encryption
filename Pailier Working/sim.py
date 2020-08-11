#! /usr/bin/python

from tinyos.tossim.TossimApp import *
from TOSSIM import *
import sys


n = NescApp();
#n = NescApp("Benaloh", "app.xml");

vars = n.variables.variables();
t = Tossim(vars);
t.addChannel("Boot", sys.stdout);

m = t.getNode(5);
m.bootAtTime((31 + t.ticksPerSecond() / 10) + 1);

for i in range(1,50):
    t.runNextEvent();

