%generate the back layer of the scene based on the area number
function bNew = generateBack(b,area,house)
   if area==1
    bNew=b;
    bNew(1:2,1:3)=[491:493;523:525]; %add house
   end
%{
   if area==2
       
   end
   if area==3
       
   end
   if area==4
       
   end
   if area==5
       
   end
   %}
end