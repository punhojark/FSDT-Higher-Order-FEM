function [Hu,Ksis,D]=Ksolve(K,P,R,Item,No)

Ksis(Item,Item)=0;
    for n=1:No;
        for sat=1:20;
            for sut=1:20;
               if (R(n,sat)~=0)
                  if (R(n,sut)~=0);
                    Ksis(R(n,sut),R(n,sat))=Ksis(R(n,sut),R(n,sat)) + K(sat,sut,n);
                 end    
              end
           end
       end
   end

%Plate system global stiffness matrix
equation=size(Ksis);
if equation(1)~=rank(Ksis)
    display('This system stiffness matrix is badly scaled')
    error('Control system support boundary conditions')
else
    Ku = inv(Ksis);
    D = Ku *P';
end


        for  v = 1 : No;
             for m = 1 :20;
                 u = R(v, m);
                 if u ~=0 
                    Hu(v, m,:) = D(u) ;
                 else    
                 Hu(v,m)=0;
                 end
              end    
        end


