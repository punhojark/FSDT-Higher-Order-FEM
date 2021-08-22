function [px,py]=Pmove(Cor,Pos,No)

for s=1:No;
    px(:,s)=[Cor(Pos(s,1),1)
             Cor(Pos(s,2),1)
             Cor(Pos(s,3),1)
             Cor(Pos(s,4),1)];
    
    py(:,s)=[Cor(Pos(s,1),2)
             Cor(Pos(s,2),2)
             Cor(Pos(s,3),2)
             Cor(Pos(s,4),2)];
 
end

