function [ table ] = hmmdquanttable32(  )
% Returns a 32 bin hmmd quantization table (hue, diff, sum)

ndiffs = 4;
diff2hue = [1 4 4 4];
diff2sum = [8 4 1 1];
table = zeros([32 3]);

counter = 1;

for diff = 1:ndiffs
    for hue = 1:diff2hue(diff)
        for sum = 1:diff2sum(diff)
          %fprintf('blah %d %d %d %d\n', diff, hue, sum, counter);
          nhues = diff2hue(diff);
          nsums = diff2sum(diff);
          thishue = 255/2/nhues + (hue - 1) * 255/nhues;
          thissum = 255/2/nsums + (sum - 1) * 255/nsums;
          thisdiff = 255/2/ndiffs + (diff - 1) * 255/ndiffs;
          table(counter, :) = round([thishue thisdiff thissum]);
          counter = counter + 1;
        end
    end
end

end
