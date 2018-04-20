require('../node_modules/neo4j-driver/lib/browser/neo4j-web.min.js');

// Creates the connection to the DB
var neo4j = window.neo4j.v1;
var driver = neo4j.driver("bolt://localhost", neo4j.auth.basic("neo4j", "40846382"));

function buscarMateriaPrima(materiaPrima){
  var session = driver.session();
  return session
    .run(
      'MATCH (mp:MateriaPrima) \
      WHERE mp.type == {type} \
      RETURN mp',
      {type: materiaPrima}
    )
    .then(result => {
      session.close();
      return result.records.map(record => {
        return new MateriaPrima(record.get('type'));
      });
    })
    .catch(error => {
      session.close();
      throw error;
    });
}

exports.buscarMateriaPrima = buscarMateriaPrima;
