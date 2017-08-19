#!/bin/bash

echo 'Create & Migrate DB'

rails db:create
rails db:migrate
