
/**
* Função para remover acentos.
* [\u0300-\u036f]/g esse trecho de código é uma expressão regular que pega o range dos acentos: ´, ~, ^
*/

function removerAcentos(str) {
  return str.normalize('NFD').replace(/[\u0300-\u036f]/g, "")
}
