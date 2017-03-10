;(function(document){

  "use strict";

  var zipCode = document.querySelector('#address_zip_code');
  var street = document.querySelector('#address_street');
  var complement = document.querySelector('#address_complement');
  var numb = document.querySelector('#address_numb');
  var neighborhood = document.querySelector('#address_neighborhood');
  var city = document.querySelector('#address_city');
  var state = document.querySelector('#address_state');
  var fields = [street, complement, neighborhood, city, state]

  zipCode.addEventListener('blur', function(){
    searchCep(this.value)
  });

  function clearForm(fields) {
    fields.forEach(function(input) {
        input.value=("");
    });
  }

  function searchCep(result) {

      var resultZipCode = result.replace(/\D/g, '');

      if (resultZipCode != "") {

          var valitedZipCode = /^[0-9]{8}$/;

          if(valitedZipCode.test(resultZipCode)) {
            street.value="...";
            complement.value="...";
            neighborhood.value="...";
            city.value="...";
            state.value="...";

            fetch('https://viacep.com.br/ws/'+ resultZipCode + '/json').then(function(data){
              return data.json();
            }).then(function(response){
              changeValues(response);
              console.log(response);
            })

          } else {
              clearForm(fields);
              alert("Formato de CEP inválido.");
          }
      }
      else {
          clearForm(fields);
      }
  };

  function changeValues(content) {
    if (!("erro" in content)) {
      street.value=(content.logradouro);
      complement.value=(content.complemento);
      neighborhood.value=(content.bairro);
      city.value=(content.localidade);
      state.value=(content.uf);
      numb.focus();
    }
    else {
        clearForm(fields);
        alert("CEP não encontrado.");
    }
  }

}(document));
