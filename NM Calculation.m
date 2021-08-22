function [P]=Pglobal(Nx,Ny,Mx,My,Re,meshx,meshy,Item)

    for sut=1:meshx+1              
        if sut==1 || sut==meshx+1;
        else                       
                                P(Re(sut,2)) = -Ny; 
                P(Re(sut+meshy*(meshx+1),2)) =  Ny; 
                                P(Re(sut,4)) = -My; 
                P(Re(sut+meshy*(meshx+1),4)) =  My; 
               
        end
    end 

    for sat=1:meshx+1:meshx*(meshy+1)+1    
        if sat==1 || sat==meshx*(meshy+1)+1;    
        else
                
                       P(Re(sat,1))=- Nx;  
                 P(Re(sat+meshx,1))=  Nx;  
                      P(Re(sat,5)) =  Mx;  
                P(Re(sat+meshx,5)) =- Mx;  
                
        end
    end


end
    
