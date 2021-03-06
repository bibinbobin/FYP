function [gcd] = polygcd(P1,P2)
%POLYGCD    Calculate polynomial GCD
%    polygcd(P1,P2) calculates the GCD of the polynomials P1 and P2.
%

a = P1;
b = P2;
while any(b)
    % conv requires removal of leaing zeros
    while(a(1)==0)
        a = a(2:length(a));
    end
    while (b(1)==0)
        b = b(2:length(b));
    end
    % check for scalar factors and remove
    if(all(a==a(1)))
        a = a/a(1);
    end
    if(all(b==b(1)))
        b = b/b(1);
    end
    [~, remain] = deconv(a,b);
    a = b;
    b = remain;
end
gcd = a;
end