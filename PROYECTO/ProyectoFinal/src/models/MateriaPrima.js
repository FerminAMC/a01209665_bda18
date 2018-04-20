var _ = require('lodash');

function MateriaPrima(type) {
  _.extend(this, {
    type: type
  });
}

module.exports = Movie;
