#!/bin/bash

rm tmp/pids/server.pid

rails server -b 0.0.0.0
