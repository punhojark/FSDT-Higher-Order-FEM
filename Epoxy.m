function [Cmaterial,Cp]=Cepoxs(E1,E2,G12,G13,G23,v12,v21,tetarandom)

 ks=5/6  ; 
Q11 = E1/(1-v12*v21)     ;
Q12 = v12*E2/(1-v12*v21) ;
Q22 = E2/(1-v12*v21)     ;
Q33 = G12                ;
Q44 = ks*G13             ; 
Q55 = ks*G23             ;

Cepox = [ Q11   Q12    0    0    0   
          Q12   Q22    0    0    0   
          0     0     Q33   0    0    
          0     0      0   Q44   0    
          0     0      0    0   Q55 ];


Q=tetarandom;
            o_x               o_y                 txy                       txz          tyz
Conversion=[  cos(Q)^2      ,    sin(Q)^2      ,    -2*sin(Q)*cos(Q)              ,        0    ,   0
              sin(Q)^2      ,    cos(Q)^2      ,     2*sin(Q)*cos(Q)              ,        0    ,   0
            sin(Q)*cos(Q)   ,   -sin(Q)*cos(Q) ,  -(sin(Q)-cos(Q))*(sin(Q)+cos(Q)),        0    ,   0
                  0         ,       0          ,          0                       ,      cos(Q) , -sin(Q)
                  0         ,       0          ,          0                       ,      sin(Q) ,  cos(Q) ];

      
Cp=[  cos(Q)^2     ,   sin(Q)^2     ,   2*sin(Q)*cos(Q)              ,    0    ,   0
      sin(Q)^2     ,   cos(Q)^2     ,  -2*sin(Q)*cos(Q)              ,    0    ,   0
    -sin(Q)*cos(Q) ,   sin(Q)*cos(Q), -(sin(Q)-cos(Q))*(sin(Q)+cos(Q)),    0    ,   0    
         0         ,      0         ,         0                      ,  cos(Q) ,  sin(Q)
         0         ,      0         ,         0                      , -sin(Q) ,  cos(Q)];
        
    Cmaterial=Conversion*Cepox*Conversion';
    





