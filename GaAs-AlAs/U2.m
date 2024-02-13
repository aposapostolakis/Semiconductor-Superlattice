function Uo = U2(x, Ualas_scaled, Ugaas_scaled, dalas_scaled, dgaas_scaled)

    V = Ualas_scaled .* ((0 <= x) & (x < dalas_scaled)) + ...
        Ugaas_scaled .* ((dalas_scaled <= x) & (x < dalas_scaled + dgaas_scaled)) + ...
        Ualas_scaled .* (x == dalas_scaled + dgaas_scaled);

    Uo = V;
end

