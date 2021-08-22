function [FI]=FIindex(Xt,Xc,Yt,Yc,S,Qsepoxil,No)


F1  = 1/Xt-1/Xc;
F2  = 1/Yt-1/Yc;
F11 = 1/(Xt*Xc);
F22 = 1/(Yt*Yc);
F66 = 1/(S^2);
F12 =-1/2*1/sqrt(Xt*Xc*Yt*Yc);


for s=1:No
sigmax=0;
sigmay=0;
tauxy =0;
FI(s,:)=0;

for i=1:4
sigmax=sigmax+Qsepoxil(1,i,s)/4;        
sigmay=sigmay+Qsepoxil(2,i,s)/4;        
tauxy =tauxy +Qsepoxil(3,i,s)/4;                
end


FIn= F11*sigmax*sigmax + ... 
         F22*sigmay*sigmay + ... 
         F66*tauxy*tauxy   + ... 
         F12*sigmax*sigmay + ... 
         F1*sigmax+ ....                 
         F2*sigmay ;                     



FI(s)=FIn;

end
       
        

