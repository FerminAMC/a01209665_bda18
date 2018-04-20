// Materias Primas
CREATE(res:MateriaPrima {type:"Carne de res"})
CREATE(leche:MateriaPrima {type:"Leche"})
CREATE(cereal:MateriaPrima {type:"Cereal"})
CREATE(pan:MateriaPrima {type:"Pan Integral"})
CREATE(azucar:MateriaPrima {type:"Azucar"})

// Recetas
CREATE(cerealConLeche:Receta {name:"Cereal con leche"})
CREATE(cerealConLeche)-[:Lleva {measurement:"Litros", quantity:1}]->(:MateriaPrima {type:"Leche"})
CREATE(cerealConLeche)-[:Lleva {measurement:"Gramos", quantity:100}]->(:MateriaPrima {type:"Cereal"})

CREATE(cerealConLeche:Receta {name:"Huevo revuelto"})
CREATE(cerealConLeche)-[:Lleva {measurement:"", quantity:1}]->(:MateriaPrima {type:"Huevo"})

MATCH(cerealConLeche:Receta {name:"Cereal con leche"})-[:Lleva]->(m:MateriaPrima)return cerealConLeche, m
MATCH(cerealConLeche:Receta {name:"Cereal con leche"})-[x:Lleva]->(m:MateriaPrima)return m.type+": "+ x.quantity + " " + x.measurement
MATCH(cerealConLeche:Receta {name:"Cereal con leche"})
DETACH DELETE cerealConLeche
