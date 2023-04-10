%{
** DISCLAIMER **
THIS CODE IS A WORK-IN-PROGRESS AND SHOULD NOT BE USED IN ANY ENGINEERING DESIGN WORK.
%}

%{
** ABOUT THIS SCRIPT FILE **
This code is written for the design of a a small earthen dam in rural Tanzania.
The purpose of the script file is to produce dam dimensions based on constants observed in the field.
The methodology used in this design is from the book 'Design of Small Dams' written by the United States Bureau of Reclamation.
%}

% CONSTRAINING VARIABLES
channel_width_bottom = 30; %(ft) measured in field with pacing
channel_side_grade = 26.6; %(degrees) estimated 2:1 slope using site photo/video
protection_thickness_front = 1.5; %(ft) small dams book and own analysis
protection_thickness_top = 1;%(ft) small dams book and own analysis
protection_thickness_back = 1; %(ft) small dams book and own analysis
dam_foundation_height = 8; %(ft) height of the dam without top slope protection
min_freeboard = 4; %(ft) from small dams book
excavation_depth = 5; %(ft) based on OSHA safety



% geometric calculations
dam_full_height = dam_foundation_height + protection_thickness_top; %(ft)
crest_width = round(dam_foundation_height / 5 + 10); %(ft) round to nearest foot for simplicity
dam_width_bottom = channel_width_bottom; % (ft) measured at toes of dam
excavation_width = channel_width_bottom; % (ft)
dam_width_top = round(dam_width_bottom + 2 * (dam_foundation_height / tand(channel_side_grade))); %(ft) (crest length)
freeboard_height = dam_full_height - min_freeboard; %(ft)

% (ft) how far the spillway extends past the edge of the crest on the front
%side. Used for dimensioning purposes in plan view
sw_ext_front = ((min_freeboard - protection_thickness_top) / tand(channel_side_grade)) + (protection_thickness_front / sind(channel_side_grade)); 

% (ft) how far the spillway extends past the edge of the crest on the front
%side. Used for dimensioning purposes in plan view
sw_ext_back = ((min_freeboard - protection_thickness_top) / tand(channel_side_grade)) + (protection_thickness_back / sind(channel_side_grade)); 

foundation_volume = 9315; %(ft^3) calculated in onshape 3D model

%(ft) approx needed length for two excavations to fufill foundation soil
%reqs. Rounding to 35 to account for slope at ends of cuts. 
excavation_length = (foundation_volume / excavation_depth / excavation_width)/2; 
