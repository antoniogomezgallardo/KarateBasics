function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }

  //for all environments
  var config = {
    apiUrl: 'https://conduit-api.bondaracademy.com/api'
  }

  //for each environment
  if (env == 'dev') {
    config.userEmail = 'karateEmail@email.com'
    config.userPassword = 'karate123'
  } else if (env == 'QA') {
    config.userEmail = 'karateQA@email.com'
    config.userPassword = 'karate456'
  }

  // header configuration
  var accesToken = karate.callSingle('classpath:conduitApp/utils/AuthToken.feature', config).authToken
  karate.configure('headers', {Authorization: 'Token ' + accesToken})


  return config;
}