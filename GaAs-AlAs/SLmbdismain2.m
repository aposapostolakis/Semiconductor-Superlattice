filename = "parameters3.txt";
fid = fopen(filename, "r");

% Initialize cell array to store all parameters
parameters = {};

% Read lines until the end of the file
while ~feof(fid)
    % Read the current line
    line = fgetl(fid);
    
    % Extract the part of the line before '%'
    [token, ~] = strtok(line, '%');
    
    % Store the extracted token in the parameters cell array
    parameters{end+1} = token;

end

fclose(fid);

% Extract individual parameters
Ualas = str2double(parameters{1});
Ugaas = str2double(parameters{2});
dalas = str2double(parameters{3});
dgaas = str2double(parameters{4});



% Call the function with extracted parameters
SLmbdis2(Ualas, Ugaas, dalas, dgaas);

