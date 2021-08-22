function [R,Re,Item,Nom,Topology]=NReology(Pos,No,Node,meshx,meshy)


for i=1:Node;
           %u v w Qx Qy
    Re(i,:)=[1 1 1 1 1];
end

    for sut=1:meshx+1              
        if sut==1 || sut==meshx+1;
                                                                     
                         Re(sut,:)=[0 0 0 1 1];
                         Re(sut,:)=[0 0 0 1 1];
        else  
              
                        Re(sut,:) = [0 1 0 1 1]   ;
        Re(sut+meshy*(meshx+1),:) = [0 1 0 1 1]   ;

        end                         
    end 

    for sat=1:meshx+1:meshx*(meshy+1)+1    
        if sat==1 || sat==meshx*(meshy+1)+1;    
                          Re(sat,:)=[0 0 0 1 1];
                    Re(sat+meshx,:)=[0 0 0 1 1];
        else
                        Re(sat,:) = [1 0 0 1 1]   ;
                  Re(sat+meshx,:) = [1 0 0 1 1]   ;                           
        end
    end

Topology=Re;

Nom=size(Re,2);

Item=0;
for i=1:Node;
    for j=1:Nom;
        if Re(i,j)==1 ;
            Item = Item +1;
            Re(i,j) = Item;
        end
    end
end

for i=1:No
R(i,:)=[Re(Pos(i,1),:) ... %Node(1)
        Re(Pos(i,2),:) ... %Node(2)
        Re(Pos(i,3),:) ... %Node(3)
        Re(Pos(i,4),:)];   %Node(4)
end
