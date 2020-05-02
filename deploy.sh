#!/bin/sh
npm run build && rsync -avz dist/ droplet:/var/www/edu-tools.pauek.info
