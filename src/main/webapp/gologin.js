var googleUser = {};
var startApp = function() {
  gapi.load('auth2', function(){
    // Retrieve the singleton for the GoogleAuth library and set up the client.
    auth2 = gapi.auth2.init({
      client_id: '397544680867-qid0uguiingim882ddostd84s2tnq19j.apps.googleusercontent.com',
      cookiepolicy: 'single_host_origin',
      // Request scopes in addition to 'profile' and 'email'
      //scope: 'additional_scope'
    });
    attachSignin(document.getElementById('lgoogle-btn'));
  });
};

function attachSignin(element) {
  console.log(element.id);
  auth2.attachClickHandler(element, {},
      function(googleUser) {
        var profile = googleUser.getBasicProfile();
        var id_token = googleUser.getAuthResponse().id_token;
        console.log('ID: ' + profile.getId());
        console.log('Name: ' + profile.getName());
        console.log('Email: ' + profile.getEmail());
        var m = profile.getEmail();
        var i = profile.getId();
        
        window.location.replace("gologin.jsp?mess="+m+','+i);
      });
};

function fpwd(){
	var e = prompt("Enter your registered email : ", "");
	window.location.replace("fpwd.jsp?me="+e);
};