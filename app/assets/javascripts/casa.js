function decrementa(idnumero, idform) {
    let numeroattuale = parseInt(document.getElementById(idnumero).innerHTML);
    if (isNaN(numeroattuale))
        return false;

    if (numeroattuale - 1 < document.getElementById(idform).min)
        return false;
    document.getElementById(idnumero).innerHTML = numeroattuale - 1;
    document.getElementById(idform).value = numeroattuale - 1;
    return true;
}

function incrementa(idnumero, idform) {
    let numeroattuale = parseInt(document.getElementById(idnumero).innerHTML);
    if (isNaN(numeroattuale))
        return false;

    document.getElementById(idnumero).innerHTML = numeroattuale + 1;
    document.getElementById(idform).value = numeroattuale + 1;
    return true;
}

function abilitadisabilita(valore, idform) {

    if (valore == 0) {
        document.getElementById(idform).value = "";
        document.getElementById(idform).disabled = true;

    }

    else
        document.getElementById(idform).disabled = false;

}


$(document).ready(function () {
    $('#form-casa').on('submit', function (event) {
        const cin = new Date($('#check-in').val());
        const cout = new Date($('#check-out').val());
        if (cout < cin) {
            var string = /*html*/`
              <h5>Il check-out non può essere precedente al check-in</h5>  
            `;
            $('#query-result').html(string);
            return false;
        }
    });
})

