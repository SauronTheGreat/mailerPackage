Package.describe({
  name: 'rushabhhathi:mailersinapp',
  version: '0.0.1',
  // Brief, one-line summary of the package.
  summary: 'Add mailer support using mailgun',
  // URL to the Git repository containing the source code for this package.
  git: '',
  // By default, Meteor will default to using README.md for documentation.
  // To avoid submitting documentation, set this field to null.
  documentation: 'README.md'
});

Package.onUse(function(api) {
  api.versionsFrom('1.0.2.1');
    var both = ['client', 'server'];

    api.use('coffeescript', both);
    api.use(['templating'], 'client');
    api.use('handlebars', 'client');
  api.use('underscore', 'client');
  api.use(['gfk:mailgun-api'
],both);
  
  api.addFiles('mailersinapp.js');
  api.addFiles("server/mailerMethods.coffee")
});

Package.onTest(function(api) {
  api.use('tinytest');
  api.use('rushabhhathi:mailersinapp');
  api.addFiles('mailersinapp-tests.js');
});
