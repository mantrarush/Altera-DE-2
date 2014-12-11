[x,map] = imread('mettaur_2R.bmp');
level = graythresh(x);
blag = ind2rgb(x,map);
a = zeros(length(x(:,1)),length(x(1,:)));
b  = zeros(length(x(:,1)),length(x(1,:)));
figure(1)

imagesc(blag)

for i = 1:length(x(:,1))
    for j = 1:length(x(1,:))
a(i,j) = (blag(i,j,1)*255*256^2)+(blag(i,j,2)*255*256)+(blag(i,j,3)*255);

    end
end

penis = unique(a);

fileID = fopen('dafuck.txt','w');

fprintf(fileID,'''{\r\n');

% 
% for i = 1:length(x(:,1))
%      fprintf(fileID,'{');
%     for j = 1:length(x(1,:))
%    hs = dec2hex(a(i,j),6)';     
% fprintf(fileID,'6-h%6x, \t' ,a(i,j));
%     end
%     fprintf(fileID,'}\r\n');
% end
 for i = 1:length(x(:,1))
      fprintf(fileID,'''{');
      
     for j = 1:length(x(1,:))
              
        for k = 1:length(penis)
               if(penis(k) == a(i,j))
                   fprintf(fileID,'c%d, ',k+18);
               end
        end
              
     end
    fprintf(fileID,'},\r\n');
    
 end
  fprintf(fileID,'\r\n};');
 
fclose(fileID);
hex = dec2hex(penis)
    