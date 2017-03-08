;(function(document){

  "use strict";

  var storeCnpj = document.querySelector('#store_cnpj');

  storeCnpj.addEventListener('blur', function(){
    is_cnpj(this.value)

    if ( is_cnpj(this.value) === false){
      alert("Esse CNPJ não é 'valido")
    }

  });

  function is_cnpj(numCnpj) {

    var b = [6,5,4,3,2,9,8,7,6,5,4,3,2];

    if((numCnpj = numCnpj.replace(/[^\d]/g,"")).length != 14)
        return false;

    if(/0{14}/.test(numCnpj))
        return false;

    for (var i = 0, n = 0; i < 12; n += numCnpj[i] * b[++i]);

    if(numCnpj[12] != (((n %= 11) < 2) ? 0 : 11 - n))
        return false;

    for (var i = 0, n = 0; i <= 12; n += numCnpj[i] * b[i++]);

    if(numCnpj[13] != (((n %= 11) < 2) ? 0 : 11 - n))
        return false;

    return true;
  };




}(document));
