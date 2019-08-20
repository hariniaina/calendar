
//jquery validate init


$(function(){

    //Basic Validation

    $( "#wizard-validation-form" ).validate( {
        rules: {
            "student[firstname]": "required",
            "student[lastname]": "required",
            'user[username]': {
                required: true,
                minlength: 2
            },
            'user[password]': {
                required: true,
                minlength: 6
            },
            'user[password_confirmation]': {
                required: true,
                minlength: 6,
                equalTo: "#user_password"
            },
            'user[email]': {
                required: true,
                email: true
            },
            'student[address]': "required",
            'student[tel]': "required",
            'student[lastname]': "required",
            'student[firstname]': "required",
            'student[legal_status]': "required",
            'student[birthdate]': "required",
            'cv[summary]': "required",
            'cv[hobbies]': "required",

            'company[address]': "required",
            'company[tel]': "required",
            'company[name]': "required",
            'company[start_date]': "required",
            'company[legal_status]': "required",
            'company[activity_area]': "required",
            'company[siret]': "required",
            'city': "required",
            'agree': "required"
        },
        messages: {
            "student[firstname]": "Sois un peu sérieux 2 secondes",
            "student[lastname]": "Sois un peu sérieux 2 secondes",
            'user[username]': {
                required: "Veuillez choisir un nouveau pseudo",
                minlength: "Votre pseudo doit contenir au moins 2 caractères"
            },
            'user[password]': {
                required: "Veuillez entrer un mot de passe",
                minlength: "Votre mot de passe doit au moins contenir 6 caractères"
            },
            'user[password_confirmation]': {
                required: "Veuillez confirmer votre mot de passe",
                minlength: "Votre mot de passe doit au moins contenir 6 caractères",
                equalTo: "Veuillez entrer le même mot de passe que ci-dessus"
            },
            'user[email]': "Veuillez entrer une addresse email valide",
            'student[address]': "Veuillez entrer une vraie addresse",
            'student[tel]': "Veuillez entrer un numéro de téléphone",
            'student[lastname]': "Veuillez entrer votre nom de famille",
            'student[firstname]': "Veuillez entrer votre prénom",
            'student[legal_status]': "Vous devez choisir",
            'student[birthdate]': "Entrez votre date de naissance",
            'cv[summary]': "Dites nous un peu plus sur vous",
            'cv[hobbies]': "C'est pour qu'on puisse se faire un foot en salle un d'ces quatres.",

            'company[address]': "Veuillez entrer une vraie addresse",
            'company[tel]': "Veuillez entrer un numéro de téléphone",
            'company[name]': "Nom obligatoire",
            'company[start_date]': "Date de lancement requis",
            'company[legal_status]': "Status légal obligatoire",
            'company[activity_area]': "Secteur d'activité non valide",
            'company[siret]': "Siret non valide",
            'city': "Veuillez choisir au moins une ville",
            'agree': "Please accept our policy"
        },
        errorElement: "em",
        errorPlacement: function ( error, element ) {
            // Add the `help-block` class to the error element
            error.addClass( "help-block" );

            if ( element.prop( "type" ) === "checkbox" ) {
                error.insertAfter( element.parent( "label" ) );
            } else {
                error.insertAfter( element );
            }
        },
        highlight: function ( element, errorClass, validClass ) {
            $( element ).parents( ".col-sm-5" ).addClass( "has-error" ).removeClass( "has-success" );
        },
        unhighlight: function (element, errorClass, validClass) {
            $( element ).parents( ".col-sm-5" ).addClass( "has-success" ).removeClass( "has-error" );
        }
    } );

    //Using feedback icons

    $( "#signupForm1" ).validate( {
        rules: {
            firstname1: "required",
            lastname1: "required",
            username1: {
                required: true,
                minlength: 2
            },
            password1: {
                required: true,
                minlength: 5
            },
            confirm_password1: {
                required: true,
                minlength: 5,
                equalTo: "#password1"
            },
            email1: {
                required: true,
                email: true
            },
            agree1: "required"
        },
        messages: {
            firstname1: "Please enter your firstname",
            lastname1: "Please enter your lastname",
            username1: {
                required: "Please enter a username",
                minlength: "Your username must consist of at least 2 characters"
            },
            password1: {
                required: "Please provide a password",
                minlength: "Your password must be at least 5 characters long"
            },
            confirm_password1: {
                required: "Please provide a password",
                minlength: "Your password must be at least 5 characters long",
                equalTo: "Please enter the same password as above"
            },
            email1: "Please enter a valid email address",
            agree1: "Please accept our policy"
        },
        errorElement: "em",
        errorPlacement: function ( error, element ) {
            // Add the `help-block` class to the error element
            error.addClass( "help-block" );

            // Add `has-feedback` class to the parent div.form-group
            // in order to add icons to inputs
            element.parents( ".col-sm-5" ).addClass( "has-feedback" );

            if ( element.prop( "type" ) === "checkbox" ) {
                error.insertAfter( element.parent( "label" ) );
            } else {
                error.insertAfter( element );
            }

            // Add the span element, if doesn't exists, and apply the icon classes to it.
            if ( !element.next( "span" )[ 0 ] ) {
                $( "<span class='fa fa-times form-control-feedback'></span>" ).insertAfter( element );
            }
        },
        success: function ( label, element ) {
            // Add the span element, if doesn't exists, and apply the icon classes to it.
            if ( !$( element ).next( "span" )[ 0 ] ) {
                $( "<span class='fa fa-check form-control-feedback'></span>" ).insertAfter( $( element ) );
            }
        },
        highlight: function ( element, errorClass, validClass ) {
            $( element ).parents( ".col-sm-5" ).addClass( "has-error" ).removeClass( "has-success" );
            $( element ).next( "span" ).addClass( "fa-times" ).removeClass( "fa-check" );
        },
        unhighlight: function ( element, errorClass, validClass ) {
            $( element ).parents( ".col-sm-5" ).addClass( "has-success" ).removeClass( "has-error" );
            $( element ).next( "span" ).addClass( "fa-check" ).removeClass( "fa-times" );
        }
    } );


    //semantic

    $( "#semanticForm" ).validate( {
        rules: {
            firstname2: "required",
            lastname2: "required",
            username2: {
                required: true,
                minlength: 2
            },
            password2: {
                required: true,
                minlength: 5
            },
            confirm_password2: {
                required: true,
                minlength: 5,
                equalTo: "#password"
            },
            email2: {
                required: true,
                email: true
            },
            agree2: "required"
        },
        messages: {
            firstname2: "Please enter your firstname",
            lastname2: "Please enter your lastname",
            username2: {
                required: "Please enter a username",
                minlength: "Your username must consist of at least 2 characters"
            },
            password2: {
                required: "Please provide a password",
                minlength: "Your password must be at least 5 characters long"
            },
            confirm_password2: {
                required: "Please provide a password",
                minlength: "Your password must be at least 5 characters long",
                equalTo: "Please enter the same password as above"
            },
            email2: "Please enter a valid email address",
            agree2: "Please accept our policy"
        },
        errorPlacement: function ( error, element ) {
            error.addClass( "ui red pointing label transition" );
            error.insertAfter( element.parent() );
        },
        highlight: function ( element, errorClass, validClass ) {
            $( element ).parents( ".row" ).addClass( errorClass );
        },
        unhighlight: function (element, errorClass, validClass) {
            $( element ).parents( ".row" ).removeClass( errorClass );
        }
    } );

});



