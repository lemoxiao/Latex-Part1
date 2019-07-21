%%       function to get the neareat product vector
%        input : w in tensor space of N times N space
%        output: x in N dimensional  real sapce
%                y in N dimensional real space

function [x,y,e] = nearest_product(w,N_A)
    if isrow(w) % change to the column vector
        w = w';
    end
    
    n = length(w);
    N_B = n/N_A;
    if abs(round(N_B)-N_B)  > eps
        fprintf('the product of the sub dimensions must equal to dimension of w\n');
        return
    end
    
    w = reshape(w,N_B,N_A);
    w = w';
    [u,e,v] = svds(w,1);
    x = u;
    y = conj(v);
end
