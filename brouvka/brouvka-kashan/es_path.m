function path = es_path(path,O)
s = find(path(2:end) == O);
path(s+1) = [];