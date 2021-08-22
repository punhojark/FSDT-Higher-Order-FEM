function [Qsis]=Qglobal(totalx,totaly,meshn,qo,No,Item,R)


if isempty(qo)==true || qo==0 
    Qsis(Item)=0;
    return
else


gridspacex=totalx/meshn;
gridspacey=totaly/meshn;
%Open dimension Qsis matrix
Q(20,1)=0;

for s=1:No
      Q(3,s) = gridspacex*gridspacey*qo/4;
      Q(8,s) = gridspacex*gridspacey*qo/4;
      Q(13,s) = gridspacex*gridspacey*qo/4;
      Q(18,s) = gridspacex*gridspacey*qo/4;
end

%In global axis-system unfirom out-load superposition
%Open dimension Qsis matrix

Qsis(Item)=0;
      for n=1:No;
          for sat=1:20;
               if (R(n,sat)~=0)
                    Qsis(R(n,sat))=Qsis(R(n,sat)) + Q(sat,n);
               end
          end
      end
      

end % qo==0