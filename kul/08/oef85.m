function oef85()
    step=0.1;
    xx=25;
    yy=25;
    zz=0;
    
    function [X,Y,Z] = bol(x,y,z,r)
        for a=1:2*pi/step+10,
            for b=1:2*pi/step+10
                X(a,b) = x + cos(a*step) * sin(b*step) * r;
                Y(a,b) = y + sin(a*step) * sin(b*step) * r;
                Z(a,b) = z + cos(b*step) * r;
            end
        end 
    end

    for r = 1:5,
        [X,Y,Z] = bol(xx,yy,zz,r*10);
        mesh(X,Y,Z);
        axis([-50 75 -50 75])
        F(r) = getframe();
    end
    
    movie(F,10)
end

