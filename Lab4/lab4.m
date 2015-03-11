%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ECEn 380 | Lab 4
% Luke Hsiao & Travis Chambers
% 4 November 2014
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Record a 5 second clip at 96kHz, 24-bit, mono
% recObj = audiorecorder(96000, 24, 1);
% disp('Start speaking.')
% recordblocking(recObj, 5); % Record/Sample for 5 seconds
% disp('End of Recording.')
% 
% myRecording = getaudiodata(recObj);
% whos myRecording
% 
% figure(1); 
% plot(myRecording);
% title('Plot of Audio Recording'); 
% xlabel('Time(seconds)');
% 
% %96,000 sample/s
% player = audioplayer(myRecording, 96000); 
% playblocking(player);
% 
% %70,000 sample/s
% player = audioplayer(myRecording, 70000); 
% playblocking(player);
% 
% %120,000 sample/s
% player = audioplayer(myRecording, 120000); 
% playblocking(player);
% 
% % 2 second impulse response with echo
% impulse_echo = zeros(192000, 1);
% 
% % Adding delta functions
% impulse_echo(1) = 1; 
% %delta at the beginning 
% impulse_echo(48000) = 0.5; 
% %half amplitude delta .5 s 
% impulse_echo(96000) = 0.25;
% player = audioplayer(impulse_echo, 96000); 
% playblocking(player);
% 
% % Convolving Together
% myRecording_echo = conv(myRecording, impulse_echo); 
% player = audioplayer(myRecording_echo, 96000); 
% playblocking(player);
% 
% % Trying the 3 other Acoustic Responses 
% impulse_great_hall = wavread('great_hall.wav'); 
% impulse_octagon = wavread('octagon.wav'); 
% impulse_classroom = wavread('classroom.wav');
% 
% player = audioplayer(impulse_great_hall, 96000);
% playblocking(player);
% 
% 
% player = audioplayer(impulse_octagon, 96000);
% playblocking(player);
% 
% player = audioplayer(impulse_classroom, 96000);
% playblocking(player);
% 
% figure(2); 
% subplot(3,1,1); 
% plot(impulse_great_hall);
% title('Great Hall Acoustic Response'); 
% xlabel('Time(seconds)'); 
% subplot(3,1,2);  
% plot(impulse_octagon);
% title('Octagon Acoustic Response'); 
% xlabel('Time(seconds)'); 
% subplot(3,1,3); 
% plot(impulse_classroom); 
% title('Classroom Acoustic Response'); 
% xlabel('Time(seconds)');
% 
% % Extra Credit
% 
% %impulse response of frieght elevator
% impulse_elevator = wavread('freight_elevator.wav');
% 
% figure(3)
% plot(impulse_elevator);
% title('Clyde Freight Elevator Acoustic Response'); 
% xlabel('Time(seconds)'); 
% 
% % Convolving Together
% myRecording_elevator = conv(myRecording, impulse_elevator); 
% player = audioplayer(myRecording_elevator, 96000); 
% playblocking(player);

%%%%%%%%%%%% Task 2 %%%%%%%%%%%%%
% recObj = audiorecorder(48000, 24, 1);
% disp('Starting 5 second recording of input.')
% recordblocking(recObj, 5); % Record/Sample for 5 seconds
% disp('End of Recording.')
% my48kHzRecording_15 = getaudiodata(recObj);
% 
% pause(3);
% 
% recObj = audiorecorder(48000, 24, 1);
% disp('Starting 5 second recording of input.')
% recordblocking(recObj, 5); % Record/Sample for 5 seconds
% disp('End of Recording.')
% my48kHzRecording_14 = getaudiodata(recObj);

% % Play Back 15kHz recording
%     player = audioplayer(my48kHzRecording_15, 48000); 
%     playblocking(player);
%     % keep only every 6th sample
%     my8kHzRecording_15 = my48kHzRecording_15(1:6:length(my48kHzRecording_15));
%     player = audioplayer(my8kHzRecording_15, 8000); 
%     playblocking(player);
% 
% % Play Back 14kHz recording
%     player = audioplayer(my48kHzRecording_14, 48000); 
%     playblocking(player);
%     % keep only every 6th sample
%     my8kHzRecording_14 = my48kHzRecording_14(1:6:length(my48kHzRecording_14));
%     player = audioplayer(my8kHzRecording_14, 8000); 
%     playblocking(player);
    
    
% Record Frequency Sweep
% recObj = audiorecorder(48000, 24, 1);
% disp('Starting 5 second recording of input in 1 sec.')
% pause(1);
% recordblocking(recObj, 5); % Record/Sample for 5 seconds
% disp('End of Recording.')
% my48kHzRecording_sweep = getaudiodata(recObj);
% 
% player = audioplayer(my48kHzRecording_sweep, 48000);
% playblocking(player);
% 
% my8kHzRecording_sweep = my48kHzRecording_sweep(1:6:length(my48kHzRecording_sweep));
% player = audioplayer(my8kHzRecording_sweep, 8000);
% playblocking(player);


% Music Recording
% recObj = audiorecorder(48000, 24, 1);
% disp('Starting 5 second recording of input in 1 sec.')
% pause(1);
% recordblocking(recObj, 5); % Record/Sample for 5 seconds
% disp('End of Recording.')
% my48kHzRecording_mp3 = getaudiodata(recObj);
% 
% % 4,000 Hz recording
% recObj = audiorecorder(4000, 24, 1);
% disp('Starting 5 second recording of input in 1 sec.')
% pause(1);
% recordblocking(recObj, 5); % Record/Sample for 5 seconds
% disp('End of Recording.')
% my4kHzRecording_mp3 = getaudiodata(recObj);
% 
% % Decimate 48kHz
% decminated_mp3 = my48kHzRecording_mp3(1:6:length(my48kHzRecording_mp3));
% player = audioplayer(decminated_mp3, 4000);
% playblocking(player);
% 
% % Directly Undersampled 
% player = audioplayer(my4kHzRecording_mp3, 4000);
% playblocking(player);

%%%%%% Part 6 %%%%%%%%
 recObj = audiorecorder(48000, 24, 1);
 disp('Starting 5 second recording of input.')
 recordblocking(recObj, 5); % Record/Sample for 5 seconds
 disp('End of Recording.')
my48kHzRecording_15_preFiltered = getaudiodata(recObj);
player = audioplayer(my48kHzRecording_15_preFiltered, 48000); 
playblocking(player);
% keep only every 6th sample
my8kHzRecording_15_preFiltered = my48kHzRecording_15_preFiltered(1:6:length(my48kHzRecording_15_preFiltered));
player = audioplayer(my8kHzRecording_15_preFiltered, 8000); 
playblocking(player);
