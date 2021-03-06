function [entropy,numeroMedioBits,histoGroup,alfaGroup] = group(signal,nBits,alfa,isSound)
signal = signal(:);
histoGroup = [];
%% ELIM CASO SEJA IMPAR
if(rem(size(signal,1),2) ~= 0)
    signal = signal(1:size(signal,1)-1,:);
end

if(nBits==8)
    if(isSound)
        signal = signal*2^16;
    else
        signal = uint16(signal(:));
    end
elseif(nBits==16)
    signal = signal*2^16;
end  

grouped = signal(1:2:end) * 2^nBits + signal(2:2:end);
[histoGroup,alfaGroup] = createHistogram(grouped,0);
histAux = histoGroup;
entropy = calcEntropy(histoGroup);
%% FAZ MATRIZ PARA HISTOGRAMA 3D
if(~isSound)
    histAux = zeros(length(alfa),length(alfa));
    for i=1:length(alfaGroup)
        x = alfa(find(alfa == floor(alfaGroup(i)/2^8)));
        y = alfa(find(alfa == alfaGroup(i)-x*2^8));
        histAux(x+1,y+1) = histoGroup(i); 
    end
end

histoGroup = histAux;
numeroMedioBits = entropy/2;

end

