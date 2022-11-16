% ALL VALUES IN FEET

% CONSTANTS ---------------------------------------------------

% DAM CONSTANTS
channel_depth = 30; %placeholder
channel_width = 30; %placeholder
crest_drop = 5; 
max_dam_height = 50; %from small dams book
freeboard_height = 5; %placeholder

% WATER CONSTANTS 
rho_water = 62.4; %lbs/ft^3
g_water = 32.2; % ft/s^2

% DAM DIMENSIONS -----------------------------------------------

% we want height of dam to be under the depth of the channel to prevent
% people walking across the crest.
dam_height = channel_depth - crest_drop;

if (dam_height > max_dam_height)
    dam_height = max_dam_height;
end

%from small dams book
crest_width = dam_height / 5 + 10; 

% 4 to 1 ratio on upstream, 2.5 to 1 ratio on downstream
dam_length = (4*dam_height) + (2.5*dam_height) + crest_width;

% Horizontal drainage blanket should extend from z + 5 ft from centerline
% of the dam
drainage_blanket_location = dam_height + 5;

max_water_height = dam_height - freeboard_height; 

% DAM PHYSICS ----------------------------------
max_lateral_force = rho_water * g_water * max_water_height;

% PRINT RESULTS ----------------------------------------------
fprintf('The dam height is %f feet\n', dam_height)
fprintf('The total dam length is %f feet\n', dam_length)
fprintf('The crest width is %f feet\n', crest_width)
fprintf('The drainage blanket should run from the toe of the dam to %f feet from the centerline of the dam', drainage_blanket_location)


