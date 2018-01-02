use lib $?FILE.IO.sibling("lib");

use Test;

use MoarRemoteTest;

plan 1;

Promise.in(10).then: { note "Did not finish test in 10 seconds. Considering this a failure."; exit 1 }

DebugTarget.run("nqp::sleep(10)", :start-suspended,
    -> $client, $supply, $proc {
        is $client.remote-version, v1.1, "got the right version"
    });