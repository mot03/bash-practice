/*const util = require('util');
const pro = require('child_process');
const script = pro.exec('bash if.sh');

//console.log(process);
//console.log(process.argv);
//console.log('PRO======');
//console.log(pro);

let test = [];
script.stdout.on('data', function (data) {
  test.push(data.toString());
  console.log(data.toString());
  script.stdin.write('Tom\n');
  script.stdin.write('32\n');
});

console.log(test);
script.kill();*/

/*
so I need a function that take a filepath - and X number of arguments - the arguments will be the input from a user of the script
executes the files
also the function needs to kill the child process if it hangs somehow
*/

/*const exec = require('child_process').exec;
const myShellScript = exec('bash if.sh 1');

myShellScript.stdout.on('data', (data)=>{
    console.log(data);
    // do whatever you want here with data

});

myShellScript.stderr.on('data', (data)=>{
    console.error(data);
});*/


/*const util = require('util');
var exec = require('child_process').exec;
var execFile = util.promisify(require('child_process').execFile);

async function getOutput() {
  const { stdout } = await execFile('sh substring.sh');
  console.log(stdout);
}

getOutput();*/

const util = require('util');
const exec = require('child_process').exec;

const getScriptOutput = async function(command) {
    // console.log(arguments);
    const script = await exec(command);
    const output = [];

    script.stdout.on('data', function (data) { 
        //script.stdin.write('20\n');
        //script.stdin.write('30\n');
        //console.log(data);
        //console.log(output);
        output.push(data.toString());
        return output;
    });

    script.on('error', function (error) {
        console.log('error');
    });
    script.kill();

    // What do I want to return? all the stuff that's echo'd? 
    // Kind of my only option
    // so A test might be the script should read a username and output it
    // so script(filename, tom) should return -[enter your name:, hello, Tom]
}


(async () => {
  let test = await getScriptOutput('bash add-two.sh')
  console.log(test);
});

