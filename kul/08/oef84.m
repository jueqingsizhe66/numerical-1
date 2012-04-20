function oef84()
    step=0.1;
    radius=10;

    function [X,Y] = cirkel(x, y, r)
        for a=1:2*pi/step+10,
            X(a) = x + cos(a*step) * r;
            Y(a) = y + sin(a*step) * r;
        end
    end

    function [y] = move(x, r)
        y = sin(x) * r;
    end

    for x = 1:100,
        [X,Y] = cirkel(x,move(x,radius),radius);
        plot(X,Y);
        axis([-10 110 -20 110])
        F(x) = getframe();
    end
    
    movie(F,10)
end
