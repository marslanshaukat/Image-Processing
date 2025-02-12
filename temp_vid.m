mov=aviread('C:\Documents and Settings\home\My Documents\Downloads\Video\person15_running_d1_uncomp.avi');

for i=1:325
    pause(1/30);
      imshow(mov(1,i).cdata);
end