const Nightmare = require('nightmare');

const nightmare = new Nightmare();

nightmare.goto('http://10.0.75.2:9090/configureSecurity/?')
    .click('#cb12')
    .click('#radio-block-1')
    .click('#radio-block-6')
    .click('#yui-gen4-button')
    .wait(500)
    .goto('http://10.0.75.2:9090/signup')
    .type('#username', 'victor')
    .type('input[name=password1]', 'kawasaki')
    .type('input[name=password2]', 'kawasaki')
    .type('input[name=fullname]', 'victor')
    .type('input[name=email]', 'kawasaki@repsol.com')
    .click('#yui-gen1-button')
    .end()
    .then(result => {
        console.log("Done")
    })
    .catch(error => {
        console.error(error);
    });