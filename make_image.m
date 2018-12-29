function imX = make_image(x);

minX = min(min(x));
maxX = max(max(x));
scale = maxX - minX;
imX = uint8(floor((x - minX)*255/scale));