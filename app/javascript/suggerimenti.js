$(window).bind('scroll', function () {
    if ($(window).scrollTop() < $('#barra-ricerca2').offset().top + $('#barra-ricerca2').outerHeight(true)) {
        $('#barra-ricerca').addClass("hidden");
        $('#card-suggerimenti').addClass("hidden");
    }
    else {
        $('#barra-ricerca').removeClass("hidden");
        $('#card-suggerimenti').removeClass("hidden");
    }
    if ($(window).scrollTop() > $('#immagine-home').offset().top + $('#immagine-home').outerHeight(true)) {
        $('#navbar').removeClass("transparent");
    } else {
        $('#navbar').addClass("transparent");
    }
});

