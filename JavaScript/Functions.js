
/**
* Função para remover acentos.
* [\u0300-\u036f]/g esse trecho de código é uma expressão regular que pega o range dos acentos: ´, ~, ^
*/

function removerAcentos(str) {
  return str.normalize('NFD').replace(/[\u0300-\u036f]/g, "")
}

# Buscar campos de tabela dinamicamente jquery
$(document).on('keyup', '#input_busca', function() {
    let valor = $(this).val();
    if(valor != ""){
        $(".pesquisa").hide();
        let reg = new RegExp(valor, "ig");
        $(".pesquisa").each(function(){
            let nome = $(this).attr('nome');
            let user = $(this).attr('user');
            if (reg.test(nome) || reg.test(user)) {
                $(this).show();
            }
        });
    }else {
        // Mostra todos as <tr>
        $(".pesquisa").show();
    }
});
