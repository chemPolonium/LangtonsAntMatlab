mapSize = 200;
centerPosition = round(mapSize/2);
% [xCoordinates,yCoordinates] = meshgrid(0:mapSize-1,0:mapSize-1);
map = false(mapSize);
position = [centerPosition centerPosition];
direction = [1 0];
rotateLeft = @(x) [-x(2) x(1)];
rotateRight = @(x) [x(2) -x(1)];

for i = 1:11000
    if map(position(1),position(2))
        direction = rotateRight(direction);
    else
        direction = rotateLeft(direction);
    end
    map(position(1),position(2)) = ~map(position(1),position(2));
    position = position + direction;
end

% xBlackCoordinates = xCoordinates(map);
% yBlackCoordinates = yCoordinates(map);

map = map(find(any(map'),1):find(any(map'),1,'last'),...
    find(any(map),1):find(any(map),1,'last'));
image(map,'CDataMapping','Scaled');

% for ii = 1:length(xBlackCoordinates(:))
%     x = xBlackCoordinates(ii) + [0 1 1 0];
%     y = yBlackCoordinates(ii) + [0 0 1 1];
%     patch(x,y,'k','facealpha',1);
% end

axis equal