// scheme-model
const db = require('../../data/db-config');
module.exports = {
  find,
  findById,
  findSteps,
  add,
  update,
  remove,
};

function find() {
  return db('schemes');
}

function findById(id) {
  return db('schemes').where({ id }).first();
}

function findSteps(id) {
  return db('schemes')
    .join('steps', 'steps.scheme_id', 'schemes.id')
    .select(
      'steps.id',
      'schemes.scheme_name',
      'steps.step_number',
      'steps.instruction'
    )
    .where('schemes.id', id);
}

function add(schemeData) {
  return db('schemes').insert(schemeData);
}

function update(changes, id) {
  return db('schemes').where({ id }).update(changes);
}

function remove(id) {
  return db('schemes').where({ id }).del();
}
