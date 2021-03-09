def dijkstra(graph, source)
  dist = Array.new(9) 
  pset = Array.new(9)
  for i in 0..dist.length-1
    dist[i] = 55555555 #maxInt
    pset[i] = false
  end
  dist[source] = 0;
  for i in 0..dist.length
    u = recMin(dist, pset, -1, 55555555, 0)
    pset[u] = true
    for v in 0..dist.length
      updateDist(graph, dist, pset, u, v)
    end
  end
  return dist
end

def recMin(dist, pset, index, mini, v)
  if v < dist.length 
    if ((pset[v]) == false) && ((dist[v]) <= mini)
      return recMin(dist, pset, v, (dist[v]), (v+1))
    else
      return recMin(dist, pset, index, mini, (v+1))
    end
  end
  return index
end

def updateDist(graph, dist, pset, u, v)
  if (pset[v]== false) && (graph[u][v])!= 0 && (dist[u]!= 55555555) && ((dist[u] + graph[u][v]) < dist[v])
    dist[v] = dist[u] + graph[u][v];
  end
end
def yazdırGraph(graph)
  for i in 0..8
    print "[ "
    for j in 0..8
      print String(graph[i][j]) << " "
    end
  puts "], "
  end
end

def yazdırDistance(dist)
  for i in 0..8
    print String(0)<< " -- " << String(i)<< " --> "<< String(dist[i]) << "\n"
  end
end

graph = [[ 0, 5, 0, 0, 0, 0, 0, 0, 10 ],[ 5, 0, 6, 0, 0, 0, 0, 7, 0 ],[ 0, 6, 0, 10, 0, 0, 5, 9, 7 ],[ 0, 0, 10, 0, 3, 7, 8, 9, 0 ],[ 0, 0, 0, 3, 0, 1, 0, 0, 0 ],[ 0, 0, 0, 7, 1, 11, 0, 0, 0 ],[ 0, 0, 5, 8, 0, 11, 0, 3, 0 ],[ 0, 7, 9, 9, 0, 0, 3, 0, 9 ],[ 10, 0, 7, 0, 0, 0, 0, 9, 0 ]]

puts "Dijkstra Algorithm"
puts "Graph: "
yazdırGraph(graph)
print "Distances: "
print dijkstra(graph, 0)
puts ""
yazdırDistance(dijkstra(graph, 0))