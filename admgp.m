function [t,r]=admgp(f,betat,betar)
t=f;
r=0*f;
for i=1:5
    t1=t;
    r1=r;
    t=smootht(f-r,betat,f);
    r=smootht(f-t,betar,f);
    normE= norm([t1;r1]-[t;r], 'fro')/norm([t;r], 'fro');
    if normE<0.1
        break;
    end
end
% i