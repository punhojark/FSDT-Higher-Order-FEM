function [Pos,No]=Position(meshx,meshy)

no=1;              
for i=1:meshy;
    for j=1:meshx;
            Pos(no,1)=(meshy+1)*(i-1)+j  ;
            Pos(no,2)=(meshy+1)*(i-1)+j+1;
            Pos(no,3)=(meshy+1)*(i)+j+1  ;
            Pos(no,4)=(meshy+1)*(i)+j    ;
            no=no+1;    
    end
end%________________|
No=size(Pos,1); 
