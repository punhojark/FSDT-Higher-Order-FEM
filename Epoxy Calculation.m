function [minimumangle,FFFI]=Epox4

qo=0;

E1  = 1.81E+11 ;
E2  = 0.103E+11;
G12 = 0.71E+10 ;
G13 = 0.71E+10 ;
G23 = 0.71E+10 ;
v12 = 0.28     ;
v21 = v12*E2/E1;

totalx = 1.20  ; 
totaly = 1.20  ; 
th     = 0.06  ; 
meshn  = 4     ; 


Nx=1E5*4.5 ; 
Ny=1E5*4.5 ; 
Mx=1E2*4.5 ; 
My=1E2*4.5 ;


Xt=1500E+6;
Xc=1500E+6;
Yt=40E+6;
Yc=246E+6;
S =68E+6;

if isempty(Nx)==true;Nx=0;end
if isempty(Ny)==true;Ny=0;end
if isempty(Mx)==true;Mx=0;end
if isempty(My)==true;My=0;end


meshx=meshn;
meshy=meshn;

    [Cor,Node]=Cglobal(meshn,totalx,totaly);
    [Pos,No]=Position(meshx,meshy);
    [R,Re,Item]=NReology(Pos,No,Node,meshx,meshy);
    [P]=Pglobal(Nx,Ny,Mx,My,Re,meshx,meshy,Item);
    [Qsis]=Qglobal(totalx,totaly,meshn,qo,No,Item,R);
     P=P-Qsis;
    [px,py]=Pmove(Cor,Pos,No);


numerator=1;

teta1  = 0;
teta2  = 90; 
rho    = 1/50;  
segment= 19 ;            



tetan  = (teta2-teta1)*rho;
gridspacez =th/segment ;

for loc=teta1:tetan:teta2;                             

tetarandom=pi/180*[   loc    ;
                      loc    ; 
                      loc    ;   
                      loc
                      loc
                      45-loc
                      loc
                      45+loc
                      8*loc 
                      loc 
                      8*loc 
                      45+loc 
                      loc 
                      45-loc 
                      loc 
                      loc 
                      loc 
                      loc 
                      loc  ];


if segment <= size(tetarandom,1)
else
disp('warning:not selected all epoxi-laminate.s flux of optimization angles')
return
end

K(20,20,No)=0;

                                        for lamina=1:segment; 
for s=1:1;
   for k=1:3; 
       for j=1:3; 
           for i=1:3; 

                
    [A,Jacobi,H]=Kepoxs(s,i,j,k,px,py,gridspacez,1);

    [Cmaterial]=Cepoxs(E1,E2,G12,G13,G23,v12,v21,tetarandom(lamina));

    K(:,:,s)=K(:,:,s)+0.5*gridspacez*H(i)*H(j)*H(k)*det(Jacobi)* ...
                                        A(:,:,s)'*Cmaterial*A(:,:,s);           
          end
      end
   end
end
                                        end                


    for s=1:No;
        K(:,:,s)=K(:,:,1);
    end


    [Hu]=Ksolve(K,P,R,Item,No);

for lamina=1:segment;                                     

 
for J=-th/2+(lamina-1)*th/segment:th/(segment):-th/2+lamina*th/segment ;
    for s=1:No;                                                                     
        for i=1:4;                          
            switch(i)                     
                    case {1}, e=-1  ; n=-1 ; 
                    case {2}, e= 1  ; n=-1 ; 
                    case {3}, e= 1  ; n= 1 ;
                    case {4}, e=-1  ; n= 1 ;
             end

    [Aconnect]=Kepoxs(s,e,n,J,px,py,th,0);


    [Cmaterial,Cp]=Cepoxs(E1,E2,G12,G13,G23,v12,v21,tetarandom(lamina));
        
         Qsglobal(:,i,s)=Cmaterial*Aconnect(:,:,s)*Hu(s,:)';  
         Qsepoxil(:,i,s)=Cp*Qsglobal(:,i,s);
     
        
        end %___(i)
    end %__(s)
end %__(J)

      
    [FI]=FIindex(Xt,Xc,Yt,Yc,S,Qsepoxil,No);

    [loc lamina max(FI)]
    FFI(lamina,numerator,:)=max(FI);

    FFFI(:,numerator)=max(FFI(:,numerator));
end                                                        


numerator=numerator+1;

clear K Ksis 
end


[minimumangle,FFFI]=FIinterface(teta1,teta2,tetan,FFI,FFFI);


