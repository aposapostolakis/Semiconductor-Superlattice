function SLmbdis(Ualas, Ugaas, Uinas, dalas, dgaas, dinas)
    % Function to calculate miniband properties based on given parameters

    % Define other constants
    NK = 51; % Discretization of momentum space
    k0 = pi;
    k = linspace(-k0, k0, NK); % k crystal momentum
    me = 0.510998 * 10^6; % Electron mass in MeV
    co = 3 * 10^8; % Speed of light
    cp = 6.582119569 * 10^-16; % Planck constant
    mgaas = 0.067; % Effective mass of GaAs
    L = 2*dgaas+dinas+dalas;  % Length of a SL period in nm
    Vo = me * mgaas * (L * 10^-9)^2 / co^2 / cp^2; % Potential Energy

    % Define coordinate vector and coordinate step
    N = 2000; % Define N consistently
    x = linspace(0, 1, N).'; % coordinate vector
    h = (x(2) - x(1)); % Coordinate step

    

    % Initialize arrays to store miniband properties
    D3 = [];
    

    for j = 1:NK
        % Calculate scaling factors
        Ualas_scaled = Ualas * Vo;
        Ugaas_scaled = Ugaas * Vo;
        Uinas_scaled = Uinas * Vo;
        dalas_scaled = dalas / L;
        dgaas_scaled = dgaas / L;
        dinas_scaled = dinas / L;

        % Periodic potential
        Uo = U(x, Ualas_scaled, Ugaas_scaled, Uinas_scaled, dalas_scaled, dgaas_scaled, dinas_scaled);

        % Calculate the Hamiltonian matrix
        voffdiag = ones(N - 2, 1); % Adjust size to match N
        mymat = ((k(j)^2 / 2 + 1 / (h^2)) * eye(N - 1) + diag(voffdiag, -1) * (k(j) / (2 * h) * 1i - 1 / (2 * h^2)) + diag(voffdiag, 1) * (-k(j) / (2 * h) * 1i - 1 / (2 * h^2)) + spdiags(Uo, 0, N - 1, N - 1));
        mymat(N - 1, 1) = -k(j) / (2 * h) * 1i - 1 / (2 * h^2);
        mymat(1, N - 1) = k(j) / (2 * h) * 1i - 1 / (2 * h^2);

        % Compute eigenvalues
        D = sort(eig(mymat), 'ascend');
        De = D(1:3);
        ka = k(j) * ones(length(De), 1);

        if j == 1
            D2 = [ka, De * 1000 / Vo];
            D3 = D2;
        else
            D2 = [ka, De * 1000 / Vo];
            D3 = [D3; D2];
        end
    end

    % Compute miniband properties
    m = (3 * NK - 1) / 2;
    Delta1 = D3(1, 2) - D3(m, 2); % Miniband width of the first miniband
    Delta2 = D3(m + 1, 2) - D3(2, 2); % Miniband width of the second miniband
    Delta3 = D3(3, 2) - D3(m + 2, 2); % Miniband width of the third miniband
    Bandgap1 = D3(2, 2) - D3(1, 2); % First bandgap
    Bandgap2 = D3(m + 2, 2) - D3(m + 1, 2); % Second bandgap

    % Display miniband properties
    disp(['Miniband width of the first miniband: ', num2str(Delta1)]);
    disp(['Miniband width of the second miniband: ', num2str(Delta2)]);
    disp(['Miniband width of the third miniband: ', num2str(Delta3)]);
    disp(['First bandgap: ', num2str(Bandgap1)]);
    disp(['Second bandgap: ', num2str(Bandgap2)]);
    
    % Save parameters to a file
output_filename = 'miniband_properties_GaAs_InAs_AlAs.txt';
fid = fopen(output_filename, 'w'); % Open the file for writing


fprintf('GaAs-InAs-AlAs structure\n');

% Write parameters to the file once the plotting in GNU Octave is finalized

fprintf(fid, 'Miniband width of the first miniband: %.2f meV\n', Delta1);
fprintf(fid, 'Miniband width of the second miniband: %.2f meV\n', Delta2);
fprintf(fid, 'Miniband width of the third miniband: %.2f meV\n', Delta3);
fprintf(fid, 'First bandgap: %.2f meV\n', Bandgap1);
fprintf(fid, 'Second bandgap: %.2f meV\n', Bandgap2);
fprintf(fid, 'Length of a SL period: %.2f nm\n', L);



    % Plot the dispersion of the first 3 minibands
    scatter(D3(:, 1) / pi, D3(:, 2))
    xlabel('k/\pi'); % Set label for the x-axis
    ylabel('Energy (meV)'); % Set label for the y-axis
    title('Dispersion of the First 3 Minibands'); % Set title for the plot
    print('dispersion_plot_GaAs_InAs_AlAs.png', '-dpng') % Save as PNG image file
    pause;
end

