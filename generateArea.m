function [lNew,fNew]=generateArea(l,f, e)
   lNew=l;
   lNew(20)=e;
   fNew=f;
   fNew(3)=e;
end