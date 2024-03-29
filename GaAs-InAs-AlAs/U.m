function Uo = U(x, Ualas_scaled, Ugaas_scaled, Uinas_scaled, dalas_scaled, dgaas_scaled, dinas_scaled)

    V = Ualas_scaled .* ((0 <= x) & (x < dalas_scaled)) + ...
        Ugaas_scaled .* ((dalas_scaled <= x) & (x < dalas_scaled + dgaas_scaled)) + ...
        Uinas_scaled .* ((dalas_scaled + dgaas_scaled <= x) & (x < dalas_scaled + dgaas_scaled + dinas_scaled)) + ...
        Ugaas_scaled .* ((dalas_scaled + dgaas_scaled + dinas_scaled <= x) & (x < dalas_scaled + 2 * dgaas_scaled + dinas_scaled)) + ...
        Ualas_scaled .* (x == dalas_scaled + 2 * dgaas_scaled + dinas_scaled);

    Uo = V;
end

