function meshData = cleanmesh(meshData)

thresholdArea = 1e-6;
thresholdDistance = 1e-4;
removeVertexList = [];

[centroids, normals, areas] = genmeshcolloc(meshData);

IndexSetOfBadPanels = find(areas < thresholdArea);

for i=1:length(IndexSetOfBadPanels)
  f1 = meshData.face(IndexSetOfBadPanels(i),1);
  v1 = meshData.vert(f1,:);
  f2 = meshData.face(IndexSetOfBadPanels(i),2);
  v2 = meshData.vert(f2,:);
  f3 = meshData.face(IndexSetOfBadPanels(i),3);
  v3 = meshData.vert(f3,:);
  if norm(v1-v2) < thresholdDistance
    if f2 > f1
      removeVertexList = [removeVertexList f2];
    else
      removeVertexList = [removeVertexList f1];
    end
  else
    if norm(v2 - v3) < thresholdDistance
      if f3 > f2
	removeVertexList = [removeVertexList f3];
      else
	removeVertexList = [removeVertexList f2];
      end
    else
      if norm(v3 - v1) < thresholdDistance
	if f1 > f3 
	  removeVertexList = [removeVertexList f1];
	else
	  removeVertexList = [removeVertexList f3];
	end
      else
	fprintf('Not sure what the problem with this panel is!');
	keyboard
      end
    end
  end
end

