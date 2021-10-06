function f=ls1(g)
g=double(g);
a=max(max(g));
b=min(min(g));
f=(g-b)/(a-b);