var api = require('./neo4jApi');

$(function () {
  buscarMP();
  $("#buscarMP").submit(e => {
    e.preventDefault();
    buscarMP();
  });
});

function mostrarMP(type){
  api
    .buscarMateriaPrima(type)
    .then(materiaPrima => {
      if(!materiaPrima) return;
      $("#typeMP").text(materiaPrima.type);
    }, "json");
}

function buscarMP(){
  var query = $("#buscarMP").find("input[name=buscarMP]").val();
  api
    .buscarMateriaPrima(query)
    .then(materiaPrima => {
      var t = $("table#results tbody").empty();
      if(materiaPrima){
        $("<tr><td class='materiaPrima'>" + materiaPrima.type + "</td></tr>")
        mostrarMP(materiaPrima.type)
      }
    });
}
