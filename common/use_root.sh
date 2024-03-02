#!/bin/bash

expect -c "
    spawn su root
    expect {
        \"Password\" { send \"123456\r\";}
    }
expect eof"

whoami
