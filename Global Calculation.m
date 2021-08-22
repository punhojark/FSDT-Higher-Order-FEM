function [Cor,Node,gridspacex,gridspacey]=Cglobal(meshn,totalx,totaly)

 gridspacex = totalx/meshn; 
 gridspacey = totaly/meshn;  

dim=1;
for sut=0:meshn 
     for sat=0:meshn

x=sat*gridspacex-meshn*gridspacex/2; 
y=sut*gridspacey-meshn*gridspacey/2; 

      Cor(dim,:)=[x y 0.00];
      dim=dim+1;     
     end    
end
Node=size(Cor,1); 