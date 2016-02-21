function plotSSC(idx,X)
% plotSSC plot a 2D pictures which correspond to the first frame of the
% video. The points from de data matrix X are colored given by their 
% clusters from the vector idx.

figure
hold on
grid on
for ind = 1 : length(idx)
    for k = 1 : max(idx)
        if idx(ind) == k
            scatter(X(ind,1),X(ind,30),'MarkerEdgeColor',[k/max(idx),0,k/max(idx)],...
                'MarkerFaceColor',[k/max(idx),0,k/max(idx)],'LineWidth',1.5);
        end
    end
end

end
