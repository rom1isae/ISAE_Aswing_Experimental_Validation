function extract_local_distribution_data(input_file)
format short e
% Open the text file

% Find the position of the last period (.) in the file name
last_dot_index = find(input_file == '.', 1, 'last');

% Extract the file name without the extension
aswing_name = input_file(1:last_dot_index-1);

% Display the file name without the extension

fileID = fopen(input_file, 'r');

% Initialize variables to store data
beam_data = cell(1, 0);
beam_found = false;
current_beam = [];

% Read each line of the file
while ~feof(fileID)
    % Read the current line
    line = fgetl(fileID);
    
    % Check if the line contains 'Surface Beam'
    if contains(line, 'Surface  Beam')
        % If we were previously collecting data for a beam, store it
        if ~isempty(current_beam)
            [m,n] = size(current_beam);
            for j = 1:n
                for i=1:m
                    current_beam(i,j) = exp10(j)*current_beam(i,j);
                end
            end
            beam_data{end+1} = current_beam;
            current_beam = [];
        end
        beam_found = true;
        % Skip next two lines (header and line of dashes)
        line_exp = fgetl(fileID);
        exp = sscanf(line_exp, ['%g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g'], [27, 1]);
        exp2 = [0 ; exp];
        exp10 = 10.^exp2;
        fgetl(fileID);
    else
        % Check if it's a line with data for a beam
        if beam_found && ~isempty(line)
            data = sscanf(line, ['%g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g %g'], [28, 1]);
            % Convert to scientific notation directly
            current_beam = [current_beam; data'];
        end
    end
end



% If there's remaining data for the last beam, store it
if ~isempty(current_beam)
    [m,n] = size(current_beam);
    for j = 1:n
        for i=1:m
            current_beam(i,j) = exp10(j)*current_beam(i,j);
        end
    end
    beam_data{end+1} = current_beam;
end

% Close the file
fclose(fileID);

N = numel(beam_data);

matlab_save_file = aswing_name + ".mat";

% Save the extracted data into a MATLAB .mat file
save(matlab_save_file, 'beam_data',"N");
end