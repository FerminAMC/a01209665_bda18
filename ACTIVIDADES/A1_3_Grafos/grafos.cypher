:start write-code
create(p:Vehiculos{marca:"nissan"})
match(v:Vehiculos{marca:"nissan"})return v
match(v:Vehiculos)return v limit 1
match(v:Vehiculos)where v.marca="vw"return v
match(v:Vehiculos), (w:Vehiculos) where v.marca="nissan" and w.marca="vw" create(v)-[s:Costo{costo:100}]->(w) //crea consulta y asigna relacion
match(v:Vehiculos)-[c:Costo]->(d:Vehiculos)delete c,v,d //borrar nodos relacionados y su relacion
match(v:Vehiculos)-[c:Costo]->() return c // te trae una relacion con direccion "Sentido"
match(v:Vehiculos)-[c:Costo]-() return c // trae una relacion sin direccion, esto puede ser mas de una
match()-[c]->() return c // trae todas las relacciones con direccion
match()-[c]-() return c // trae todas las relaciones
match(p:Person{name:"Tom Hanks"})-[:ACTED_IN]->(m:Movie) return m
match(p:Person{name:"Tom Hanks"})-[:ACTED_IN]->(m:Movie)<-[:ACTED_IN]-(p2:Person) return count(p2)
match(p:Person{name:"Tom Hanks"})-[*1..4]-(m:Person) return m
match(p:Person{name:"Tom Hanks"})-[*4]-(m:Person) return m

match p = shortestPath((pachino:Person{name:"Al Pacino"})-[*]-(m:Person{name:"Tom Cruise"})) return p
